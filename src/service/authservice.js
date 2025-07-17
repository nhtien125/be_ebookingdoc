const User = require("../model/userModel");
const db = require("../helper/database");
const { v4: uuidv4 } = require("uuid");
const validator = require("validator");
const bcrypt = require('bcrypt');
const SALT_ROUNDS = 10;

class UserService {
  static async login(user) {
    try {
      const identifier = user.email || user.username;
      if (!identifier || !user.password) {
        const error = new Error("Thông tin đăng nhập không hợp lệ!");
        error.statusCode = 400;
        throw error;
      }
      const field = identifier.includes("@") ? "email" : "username";
      const [rows] = await db.execute(
        `SELECT * FROM \`user\` WHERE \`${field}\` = ?`,
        [identifier]
      );
      if (!rows || rows.length === 0) {
        const error = new Error("Thông tin tài khoản hoặc mật khẩu không chính xác!");
        error.statusCode = 400;
        throw error;
      }
      const userData = rows[0];

      // So sánh mật khẩu đã hash
      const isMatch = await bcrypt.compare(user.password, userData.password);
      if (!isMatch) {
        const error = new Error("Thông tin tài khoản hoặc mật khẩu không chính xác!");
        error.statusCode = 400;
        throw error;
      }

      // Trả về thông tin user (KHÔNG trả mật khẩu)
      return {
        code: 200,
        data: {
          uuid: userData.uuid ?? null,
          name: userData.name ?? null,
          premission_id: userData.premission_id ?? null,
          email: userData.email ?? null,
          phone: userData.phone ?? null,
          gender: userData.gender ?? null,
          address: userData.address ?? null,
          username: userData.username ?? null,
          status: userData.status ?? null,
          image: userData.image ?? null,
          created_at: userData.created_at ?? null,
          updated_at: userData.updated_at ?? null,
        },
      };
    } catch (error) {
      error.statusCode = error.statusCode || 500;
      throw error;
    }
  }

  static async register(userData) {
    try {
      const sanitizeInput = (value) => {
        if (typeof value !== "string") return value;
        return value.replace(/[\n\r\t\x00-\x1F\x7F-\x9F]/g, "").trim();
      };
      const premissionId = Number(userData.premission_id);
      const username = sanitizeInput(userData.username);
      const password = sanitizeInput(userData.password);
      const email = sanitizeInput(userData.email);
      const name = sanitizeInput(userData.name);
      const phone = sanitizeInput(userData.phone);
      const address = sanitizeInput(userData.address);

      if (!email || !validator.isEmail(email)) {
        const error = new Error("Email không hợp lệ!");
        error.statusCode = 400;
        throw error;
      }

      if (premissionId !== 3) {
        if (!username || username.length < 6) {
          const error = new Error("Username phải có ít nhất 6 ký tự!");
          error.statusCode = 400;
          throw error;
        }
        if (!password || password.length < 6) {
          const error = new Error("Password phải có ít nhất 6 ký tự!");
          error.statusCode = 400;
          throw error;
        }
      }

      let query = `SELECT uuid FROM \`user\` WHERE \`email\` = ?`;
      let params = [email];
      if (premissionId !== 3) {
        query += ` OR \`username\` = ?`;
        params.push(username);
      }
      const [rows] = await db.execute(query, params);
      if (rows.length > 0) {
        const error = new Error("Email hoặc Username đã tồn tại!");
        error.statusCode = 400;
        throw error;
      }

      let hashedPassword = null;
      if (password) {
        hashedPassword = await bcrypt.hash(password, SALT_ROUNDS);
      }

      const user = new User({
        uuid: uuidv4().replace(/-/g, ""),
        premission_id: premissionId,
        name,
        email,
        phone,
        gender: userData.gender || null,
        address,
        username: username || null,
        password: hashedPassword || null,
        status: userData.status || 1,
        image: null,
        created_at: new Date(),
        updated_at: new Date(),
      });

      await user.save();

      // Không trả password
      return {
        code: 200,
        data: {
          uuid: user.uuid,
          name: user.name,
          email: user.email,
          phone: user.phone,
          username: user.username,
          premission_id: user.premission_id,
          status: user.status,
          image: user.image,
        },
        message: "Đăng ký thành công!",
      };
    } catch (error) {
      error.statusCode = error.statusCode || 500;
      throw error;
    }
  }

  static async getDetailInfo(uuid) {
    try {
      const user = await User.findById(uuid);
      if (!user) {
        return {
          code: 404,
          data: null,
          message: "Không tìm thấy người dùng!",
        };
      }
      const {
        name,
        gender,
        phone,
        email,
        address,
        image,
        premission_id,
        created_at,
        updated_at,
      } = user;
      return {
        code: 200,
        data: {
          name,
          gender,
          phone,
          email,
          address,
          image,
          premission_id,
          created_at,
          updated_at,
        },
        message: "Lấy thông tin user thành công!",
      };
    } catch (error) {
      throw new Error("Không thể lấy thông tin người dùng.");
    }
  }

  static async updateProfile(uuid, body) {
    try {
      if (!body.name || !body.phone || !body.email || !uuid) {
        const error = new Error("Thiếu trường bắt buộc!");
        error.statusCode = 400;
        throw error;
      }

      const fields = [];
      const params = [];
      if (body.name !== undefined) {
        fields.push("`name` = ?");
        params.push(body.name);
      }
      if (body.gender !== undefined) {
        fields.push("`gender` = ?");
        params.push(body.gender);
      }
      if (body.birth_day !== undefined) {
        fields.push("`birth_day` = ?");
        params.push(body.birth_day);
      }
      if (body.phone !== undefined) {
        fields.push("`phone` = ?");
        params.push(body.phone);
      }
      if (body.email !== undefined) {
        fields.push("`email` = ?");
        params.push(body.email);
      }
      if (body.address !== undefined) {
        fields.push("`address` = ?");
        params.push(body.address);
      }
      if (body.image !== undefined) {
        fields.push("`image` = ?");
        params.push(body.image);
      }
      if (body.premission_id !== undefined) {
        fields.push("`premission_id` = ?");
        params.push(body.premission_id);
      }
      fields.push("`updated_at` = ?");
      params.push(new Date());

      const query = `UPDATE \`user\` SET ${fields.join(", ")} WHERE \`uuid\` = ?`;
      params.push(uuid);

      const [result] = await db.execute(query, params);
      return {
        code: 200,
        data: { affectedRows: result.affectedRows },
        message:
          result.affectedRows > 0
            ? "Cập nhật thông tin thành công!"
            : "Không tìm thấy user hoặc không có gì thay đổi!",
      };
    } catch (error) {
      error.statusCode = 500;
      throw error;
    }
  }

  static async getAll(premission_id = null) {
    try {
      let query = `
        SELECT
          uuid,
          name,
          email,
          phone,
          gender,
          address,
          username,
          status,
          image,
          premission_id
        FROM \`user\`
      `;
      const params = [];
      if (premission_id !== null) {
        query += ` WHERE premission_id = ?`;
        params.push(premission_id);
      }
      const [rows] = await db.execute(query, params);
      if (!rows || !Array.isArray(rows)) {
        const error = new Error("Lỗi dữ liệu từ database!");
        error.statusCode = 500;
        throw error;
      }
      return {
        code: 200,
        data: rows,
        message: "Lấy danh sách người dùng thành công!",
      };
    } catch (error) {
      error.statusCode = 500;
      throw error;
    }
  }

  static async getById(id) {
    try {
      if (!id) {
        const error = new Error("Thiếu id người dùng!");
        error.statusCode = 400;
        throw error;
      }
      const [rows] = await db.execute(
        "SELECT uuid, name, email, phone, gender, address, username, status, image, premission_id FROM `user` WHERE uuid = ?",
        [id]
      );
      if (!rows || rows.length === 0) {
        return {
          code: 404,
          data: null,
          message: "Không tìm thấy user!",
        };
      }
      return {
        code: 200,
        data: rows[0],
        message: "Lấy thông tin người dùng thành công!",
      };
    } catch (error) {
      error.statusCode = 500;
      throw error;
    }
  }
}

module.exports = UserService;
