const db = require('../helper/database');

class Doctor {
  static async findAll() {
    const [rows] = await db.execute('SELECT * FROM `doctors`');
    return rows;
  }

  static async findById(uuid) {
    const [rows] = await db.execute('SELECT * FROM `doctors` WHERE `uuid` = ?', [uuid]);
    return rows[0] || null;
  }

  static async findByLicense(license) {
    const [rows] = await db.execute('SELECT * FROM `doctors` WHERE `license` = ?', [license]);
    return rows[0] || null;
  }

  static async findByUserId(user_id) {
    const [rows] = await db.execute('SELECT * FROM `doctors` WHERE `user_id` = ?', [user_id]);
    return rows[0] || null;
  }

  static async create({ uuid, user_id, doctor_type, specialization_id, license, introduce }) {
    const query = `
      INSERT INTO \`doctors\` (
        \`uuid\`, \`user_id\`, \`doctor_type\`, \`specialization_id\`,
        \`license\`, \`introduce\`
      ) VALUES (?, ?, ?, ?, ?, ?)
    `;
    await db.execute(query, [
      uuid, user_id, doctor_type, specialization_id, license, introduce
    ]);
  }

  static async update(uuid, { user_id, doctor_type, specialization_id, license, introduce }) {
    const query = `
      UPDATE \`doctors\`
      SET \`user_id\` = ?, \`doctor_type\` = ?, \`specialization_id\` = ?,
          \`license\` = ?, \`introduce\` = ?
      WHERE \`uuid\` = ?
    `;
    await db.execute(query, [
      user_id, doctor_type, specialization_id, license, introduce, uuid
    ]);
  }

  static async delete(uuid) {
    await db.execute('DELETE FROM `doctors` WHERE `uuid` = ?', [uuid]);
  }
}

module.exports = Doctor;