const db = require('../helper/database');
const { v4: uuidv4 } = require('uuid');

class Result {
  static async findAll() {
    try {
      const [rows] = await db.execute('SELECT * FROM `results`');
      return rows;
    } catch (error) {
      throw new Error('Error fetching results: ' + error.message);
    }
  }

  static async findById(uuid) {
    try {
      const [rows] = await db.execute('SELECT * FROM `results` WHERE `uuid` = ?', [uuid]);
      return rows[0] || null;
    } catch (error) {
      throw new Error('Error fetching result by ID: ' + error.message);
    }
  }

  static async create({ medical_record_id, date, diagnosis, prescription, note }) {
    try {
      const uuid = uuidv4().replace(/-/g, '');
      const query = `
        INSERT INTO \`results\` (
          \`uuid\`, \`medical_record_id\`, \`date\`, \`diagnosis\`, \`prescription\`, \`note\`
        ) VALUES (?, ?, ?, ?, ?, ?)
      `;
      const [result] = await db.execute(query, [uuid, medical_record_id, date, diagnosis, prescription, note]);
      return { uuid, medical_record_id, date, diagnosis, prescription, note };
    } catch (error) {
      throw new Error('Error creating result: ' + error.message);
    }
  }

  static async update(uuid, { medical_record_id, date, diagnosis, prescription, note }) {
    try {
      const query = `
        UPDATE \`results\`
        SET \`medical_record_id\` = ?, \`date\` = ?, \`diagnosis\` = ?, \`prescription\` = ?, \`note\` = ?
        WHERE \`uuid\` = ?
      `;
      const [result] = await db.execute(query, [medical_record_id, date, diagnosis, prescription, note, uuid]);
      if (result.affectedRows === 0) {
        throw new Error('Result not found');
      }
      return { uuid, medical_record_id, date, diagnosis, prescription, note };
    } catch (error) {
      throw new Error('Error updating result: ' + error.message);
    }
  }

  static async delete(uuid) {
    try {
      const [result] = await db.execute('DELETE FROM `results` WHERE `uuid` = ?', [uuid]);
      if (result.affectedRows === 0) {
        throw new Error('Result not found');
      }
      return { message: 'Result deleted successfully' };
    } catch (error) {
      throw new Error('Error deleting result: ' + error.message);
    }
  }
}

module.exports = Result;