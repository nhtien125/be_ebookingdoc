const db = require('../helper/database');
const { v4: uuidv4 } = require('uuid');

class Patient {
  static async findAll() {
    try {
      const [rows] = await db.execute('SELECT * FROM `patients`');
      return rows;
    } catch (error) {
      throw new Error('Error fetching patients: ' + error.message);
    }
  }

  static async findById(uuid) {
    try {
      const [rows] = await db.execute('SELECT * FROM `patients` WHERE `uuid` = ?', [uuid]);
      return rows[0] || null;
    } catch (error) {
      throw new Error('Error fetching patient by ID: ' + error.message);
    }
  }

  static async create({ user_id, medical_record_id }) {
    try {
      const uuid = uuidv4().replace(/-/g, '');
      const query = `
        INSERT INTO \`patients\` (
          \`uuid\`, \`user_id\`, \`medical_record_id\`
        ) VALUES (?, ?, ?)
      `;
      const [result] = await db.execute(query, [uuid, user_id, medical_record_id]);
      return { uuid, user_id, medical_record_id };
    } catch (error) {
      throw new Error('Error creating patient: ' + error.message);
    }
  }

  static async update(uuid, { user_id, medical_record_id }) {
    try {
      const query = `
        UPDATE \`patients\`
        SET \`user_id\` = ?, \`medical_record_id\` = ?
        WHERE \`uuid\` = ?
      `;
      const [result] = await db.execute(query, [user_id, medical_record_id, uuid]);
      if (result.affectedRows === 0) {
        throw new Error('Patient not found');
      }
      return { uuid, user_id, medical_record_id };
    } catch (error) {
      throw new Error('Error updating patient: ' + error.message);
    }
  }

  static async delete(uuid) {
    try {
      const [result] = await db.execute('DELETE FROM `patients` WHERE `uuid` = ?', [uuid]);
      if (result.affectedRows === 0) {
        throw new Error('Patient not found');
      }
      return { message: 'Patient deleted successfully' };
    } catch (error) {
      throw new Error('Error deleting patient: ' + error.message);
    }
  }
}

module.exports = Patient;