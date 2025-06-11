const db = require('../helper/database');
const { v4: uuidv4 } = require('uuid');

class Appointment {
  static async findAll() {
    const [rows] = await db.execute('SELECT * FROM `appointments`');
    return rows;
  }

  static async findById(uuid) {
    const [rows] = await db.execute('SELECT * FROM `appointments` WHERE `uuid` = ?', [uuid]);
    return rows[0] || null;
  }

  static async create({ doctor_id, patient_id, clinic_id, schedule_id, package_id, date, status }) {
    const uuid = uuidv4().replace(/-/g, '');
    const query = `
      INSERT INTO \`appointments\` (
        \`uuid\`, \`doctor_id\`, \`patient_id\`, \`clinic_id\`, 
        \`schedule_id\`, \`package_id\`, \`date\`, \`status\`
      ) VALUES (?, ?, ?, ?, ?, ?, ?, ?)
    `;
    await db.execute(query, [
      uuid, doctor_id, patient_id, clinic_id, 
      schedule_id, package_id, date, status
    ]);
    return { uuid, doctor_id, patient_id, clinic_id, schedule_id, package_id, date, status };
  }

  static async update(uuid, { doctor_id, patient_id, clinic_id, schedule_id, package_id, date, status }) {
    const query = `
      UPDATE \`appointments\`
      SET \`doctor_id\` = ?, \`patient_id\` = ?, \`clinic_id\` = ?, 
          \`schedule_id\` = ?, \`package_id\` = ?, \`date\` = ?, \`status\` = ?
      WHERE \`uuid\` = ?
    `;
    await db.execute(query, [
      doctor_id, patient_id, clinic_id, schedule_id, 
      package_id, date, status, uuid
    ]);
    return { uuid, doctor_id, patient_id, clinic_id, schedule_id, package_id, date, status };
  }

  static async delete(uuid) {
    await db.execute('DELETE FROM `appointments` WHERE `uuid` = ?', [uuid]);
  }
}

module.exports = Appointment;