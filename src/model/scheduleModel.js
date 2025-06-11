const db = require('../helper/database');
const { v4: uuidv4 } = require('uuid');

class Schedule {
  static async findAll() {
    try {
      const [rows] = await db.execute('SELECT * FROM `schedules`');
      return rows;
    } catch (error) {
      throw new Error('Error fetching schedules: ' + error.message);
    }
  }

  static async findById(uuid) {
    try {
      const [rows] = await db.execute('SELECT * FROM `schedules` WHERE `uuid` = ?', [uuid]);
      return rows[0] || null;
    } catch (error) {
      throw new Error('Error fetching schedule by ID: ' + error.message);
    }
  }

  static async create({ doctor_id, clinic_id, start_time, end_time }) {
    try {
      const uuid = uuidv4().replace(/-/g, '');
      const query = `
        INSERT INTO \`schedules\` (
          \`uuid\`, \`doctor_id\`, \`clinic_id\`, \`start_time\`, \`end_time\`
        ) VALUES (?, ?, ?, ?, ?)
      `;
      const [result] = await db.execute(query, [uuid, doctor_id, clinic_id, start_time, end_time]);
      return { uuid, doctor_id, clinic_id, start_time, end_time };
    } catch (error) {
      throw new Error('Error creating schedule: ' + error.message);
    }
  }

 static async update(uuid, { doctor_id, clinic_id, start_time, end_time }) {
    try {
      const query = `
        UPDATE \`schedules\`
        SET \`doctor_id\` = ?, \`clinic_id\` = ?, \`start_time\` = ?, \`end_time\` = ?
        WHERE \`uuid\` = ?
      `;
      const [result] = await db.execute(query, [doctor_id, clinic_id, start_time, end_time, uuid]);
      if (result.affectedRows === 0) {
        throw new Error('Schedule not found');
      }
      return { uuid, doctor_id, clinic_id, start_time, end_time };
    } catch (error) {
      throw new Error('Error updating schedule: ' + error.message);
    }
  }

  static async delete(uuid) {
    try {
      const [result] = await db.execute('DELETE FROM `schedules` WHERE `uuid` = ?', [uuid]);
      if (result.affectedRows === 0) {
        throw new Error('Schedule not found');
      }
      return { message: 'Schedule deleted successfully' };
    } catch (error) {
      throw new Error('Error deleting schedule: ' + error.message);
    }
  }
}

module.exports = Schedule;