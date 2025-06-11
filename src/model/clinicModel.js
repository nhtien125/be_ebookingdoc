const db = require("../helper/database");
const { v4: uuidv4 } = require("uuid");

class Clinic {
  static async findAll() {
    const [rows] = await db.execute("SELECT * FROM `clinics`");
    return rows;
  }

  static async findById(uuid) {
    const [rows] = await db.execute(
      "SELECT * FROM `clinics` WHERE `uuid` = ?",
      [uuid]
    );
    return rows[0] || null;
  }

  static async create({ uuid,name, address, phone, email, image }) {
    const query = `
      INSERT INTO \`clinics\` (
        \`uuid\`, \`name\`, \`address\`, \`phone\`, \`email\`, \`image\`
      ) VALUES (?, ?, ?, ?, ?, ?)
    `;
  await db.execute(query, [uuid, name, address,phone,email, image]);
   
  }

  static async update(uuid, { name, address, phone, email, image }) {
    const query = `
      UPDATE \`clinics\`
      SET \`name\` = ?, \`address\` = ?, \`phone\` = ?, \`email\`,,\`image\` = ?
      WHERE \`uuid\` = ?
    `;
    await db.execute(query, [name, address, phone, email, uuid, image]);
    return { uuid, name, address, phone, email, image };
  }

  static async delete(uuid) {
    await db.execute("DELETE FROM `clinics` WHERE `uuid` = ?", [uuid]);
  }
}

module.exports = Clinic;
