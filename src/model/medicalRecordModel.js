const db = require('../helper/database');
const { v4: uuidv4 } = require('uuid');

class MedicalRecord {
  static async findAll() {
    try {
      const [rows] = await db.execute('SELECT * FROM `medical_records`');
      return rows;
    } catch (error) {
      throw new Error('Error fetching medical records: ' + error.message);
    }
  }

  static async findById(uuid) {
    try {
      const [rows] = await db.execute('SELECT * FROM `medical_records` WHERE `uuid` = ?', [uuid]);
      return rows[0] || null;
    } catch (error) {
      throw new Error('Error fetching medical record by ID: ' + error.message);
    }
  }

  static async create({ patient_id }) {
    try {
      const uuid = uuidv4().replace(/-/g, '');
      const query = `
        INSERT INTO \`medical_records\` (
          \`uuid\`, \`patient_id\`
        ) VALUES (?, ?)
      `;
      const [result] = await db.execute(query, [uuid, patient_id]);
      return { uuid, patient_id };
    } catch (error) {
      throw new Error('Error creating medical record: ' + error.message);
    }
  }

  static async update(uuid, { patient_id }) {
    try {
      const query = `
        UPDATE \`medical_records\`
        SET \`patient_id\` = ?
        WHERE \`uuid\` = ?
      `;
      const [result] = await db.execute(query, [patient_id, uuid]);
      if (result.affectedRows === 0) {
        throw new Error('Medical record not found');
      }
      return { uuid, patient_id };
    } catch (error) {
      throw new Error('Error updating medical record: ' + error.message);
    }
  }

  static async delete(uuid) {
    try {
      const [result] = await db.execute('DELETE FROM `medical_records` WHERE `uuid` = ?', [uuid]);
      if (result.affectedRows === 0) {
        throw new Error('Medical record not found');
      }
      return { message: 'Medical record deleted successfully' };
    } catch (error) {
      throw new Error('Error deleting medical record: ' + error.message);
    }
  }
}

module.exports = MedicalRecord;