const db = require("../helper/database");

class User {
  constructor({
    uuid,
    premission_id,
    name,
    email,
    phone,
    gender,
    address,
    username,
    password,
    status,
    image,
    birth_day, // Thêm trường ngày sinh
    created_at,
    updated_at,
  }) {
    this.uuid = uuid || null;
    this.premission_id = premission_id || null;
    this.name = name || null;
    this.email = email || null;
    this.phone = phone || null;
    this.gender = gender || null;
    this.address = address || null;
    this.username = username || null;
    this.password = password || null;
    this.status = status || 1;
    this.image = image || null;
    this.birth_day = birth_day || null; // Thêm trường ngày sinh
    this.created_at = created_at || new Date();
    this.updated_at = updated_at || new Date();
  }

  // Ví dụ trong model User
  static async findById(uuid) {
    try {
      console.log("[findById] uuid:", uuid, "| typeof:", typeof uuid);
      // KHÔNG ĐỂ params = undefined hoặc null!
      const [rows, fields] = await db.execute(
        "SELECT * FROM `user` WHERE `uuid` = ?",
        [uuid]
      );
      console.log("==> rows:", rows);
      if (!rows || rows.length === 0) return null;
      return new User(rows[0]);
    } catch (err) {
      console.error("Lỗi truy vấn findById:", err);
      return null;
    }
  }

  async save() {
    try {
      const query = `
        INSERT INTO \`user\` (
          \`uuid\`,
          \`premission_id\`,
          \`name\`,
          \`email\`,
          \`phone\`,
          \`gender\`,
          \`address\`,
          \`username\`,
          \`password\`,
          \`status\`,
          \`image\`,
          \`birth_day\`,      -- Thêm trường này vào câu lệnh SQL
          \`created_at\`,
          \`updated_at\`
        ) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
      `;
      const params = [
        this.uuid,
        this.premission_id,
        this.name,
        this.email,
        this.phone,
        this.gender,
        this.address,
        this.username,
        this.password,
        this.status,
        this.image || null,
        this.birth_day || null, // Thêm trường này vào params
        this.created_at,
        this.updated_at,
      ];
      console.log("Tham số query lưu database:", params);
      const [result] = await db.execute(query, params);
      console.log("Kết quả lưu database:", result);
      return this;
    } catch (error) {
      console.error("Lỗi lưu user vào database:", error);
      throw new Error("Lỗi khi lưu thông tin người dùng vào database!");
    }
  }
}

module.exports = User;
