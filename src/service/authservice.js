const User = require('./../model/userModel');
const db = require('../helper/database');
const { signAccessToken } = require('../api/utils/token');
const { v4: uuidv4 } = require('uuid');

class UserService {
  static async login(user) {
    try {
      const identifier = user.phone || user.username;
      if (!identifier || !user.password) {
        const error = new Error('Phone hoặc username và password không được để trống!');
        error.statusCode = 400;
        throw error;
      }

      const field = user.phone ? 'phone' : 'username';
      const [rows] = await db.execute(
        `SELECT uuid, name, premission_id FROM \`user\` WHERE \`${field}\` = ? AND \`password\` = ?`,
        [identifier, user.password]
      );

      console.log('Login query result:', rows);

      if (!rows || rows.length === 0) {
        const error = new Error('Thông tin tài khoản hoặc mật khẩu không chính xác!');
        error.statusCode = 400;
        throw error;
      }

      const userData = rows[0];
      if (!userData || typeof userData !== 'object') {
        const error = new Error('Dữ liệu user không hợp lệ!');
        error.statusCode = 500;
        throw error;
      }

      const uuid = userData.uuid;
      if (!uuid) {
        const error = new Error('Không tìm thấy UUID của user!');
        error.statusCode = 500;
        throw error;
      }

      const token = await signAccessToken(uuid);
      if (!token || !token.access_token || !token.refresh_token) {
        const error = new Error('Không thể tạo token!');
        error.statusCode = 500;
        throw error;
      }
      await db.execute('DELETE FROM `token` WHERE `user_id` = ?', [uuid]);

      await db.execute(
        `
          INSERT INTO \`token\`(
            \`uuid\`,
            \`user_id\`,
            \`access_token\`,
            \`refresh_token\`
          )
          VALUES (uuid(), ?, ?, ?)
        `,
        [uuid, token.access_token, token.refresh_token]
      );

      return {
        code: 200,
        data: {
          uuid: userData.uuid ?? null,
          name: userData.name ?? null,
          permission: userData.premission_id ?? null,
          access_token: token.access_token,
          refresh_token: token.refresh_token,
        },
      };
    } catch (error) {
      console.error('Login error:', error);
      error.statusCode = error.statusCode || 500;
      throw error;
    }
  }
  
  static async register(userData) {
    try {
      // Kiểm tra dữ liệu đầu vào bắt buộc
      if (
        userData.username === undefined ||
        userData.username === null ||
        userData.username === '' ||
        userData.password === undefined ||
        userData.password === null ||
        userData.password === '' ||
        userData.email === undefined ||
        userData.email === null ||
        userData.email === ''
      ) {
        const error = new Error('Username, password và email không được để trống hoặc undefined!');
        error.statusCode = 400;
        throw error;
      }
      console.log('Register input:', userData);
      let existingUser;
      try {
        const [rows] = await db.execute(
          `SELECT uuid FROM \`user\` WHERE \`username\` = ? OR \`email\` = ?`,
          [userData.username, userData.email]
        );
        existingUser = rows;
      } catch (dbError) {
        console.error('Database query error:', dbError);
        const error = new Error('Lỗi khi kiểm tra thông tin người dùng: Không thể truy vấn database!');
        error.statusCode = 500;
        throw error;
      }

      console.log('Existing user result:', existingUser);

      if (existingUser === undefined) {
        const error = new Error('Lỗi khi kiểm tra thông tin người dùng: Kết quả truy vấn không hợp lệ!');
        error.statusCode = 500;
        throw error;
      }

      if (existingUser.length > 0) {
        const error = new Error('Username hoặc email đã tồn tại!');
        error.statusCode = 400;
        throw error;
      }
      const user = new User({
        uuid: uuidv4(),
        premission_id: userData.premission_id || null,
        doctor_id: userData.doctor_id || null,
        patient_id: userData.patient_id || null,
        name: userData.name || null,
        email: userData.email,
        phone: userData.phone || null,
        gender: userData.gender || null,
        address: userData.address || null,
        username: userData.username,
        password: userData.password,
        status: userData.status || 1,
      });
      try {
        await user.save();
      } catch (saveError) {
        console.error('Error saving user:', saveError);
        const error = new Error('Lỗi khi lưu thông tin người dùng vào database!');
        error.statusCode = 500;
        throw error;
      }

      return {
        code: 201,
        data: {
          uuid: user.uuid,
          name: user.name,
          email: user.email,
          phone: user.phone,
          username: user.username,
          premission_id: user.premission_id,
          status: user.status,
        },
        message: 'Đăng ký thành công!',
      };
    } catch (error) {
      console.error('Register error:', error);
      error.statusCode = error.statusCode || 500;
      throw error;
    }
  }
  static async getUserById(uuid) {
    try {
      const user = await User.findById(uuid);
      if (!user) {
        const error = new Error('Không tìm thấy người dùng!');
        error.statusCode = 404;
        throw error;
      }
      return {
        code: 200,
        data: {
          uuid: user.uuid,
          name: user.name,
          email: user.email,
          phone: user.phone,
          gender: user.gender,
          address: user.address,
          username: user.username,
          permission_id: user.permission_id,
          status: user.status,
          created_at: user.created_at,
          updated_at: user.updated_at,
        },
      };
    } catch (error) {
      error.statusCode = error.statusCode || 500;
      throw error;
    }
  }

  static async updateUser(uuid, updateData) {
    try {
      const user = await User.findById(uuid);
      if (!user) {
        const error = new Error('Không tìm thấy người dùng!');
        error.statusCode = 404;
        throw error;
      }

      Object.assign(user, updateData);
      await user.update();
      return {
        code: 200,
        data: {
          uuid: user.uuid,
          name: user.name,
          email: user.email,
          phone: user.phone,
          username: user.username,
        },
      };
    } catch (error) {
      error.statusCode = error.statusCode || 500;
      throw error;
    }
  }

  static async deleteUser(uuid) {
    try {
      const user = await User.findById(uuid);
      if (!user) {
        const error = new Error('Không tìm thấy người dùng!');
        error.statusCode = 404;
        throw error;
      }

      await User.delete(uuid);
      return {
        code: 200,
        message: 'Xóa người dùng thành công!',
      };
    } catch (error) {
      error.statusCode = error.statusCode || 500;
      throw error;
    }
  }
}

module.exports = UserService;