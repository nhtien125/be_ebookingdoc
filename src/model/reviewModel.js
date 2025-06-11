const db = require('../helper/database');
const { v4: uuidv4 } = require('uuid');

class Review {
  static async findAll() {
    try {
      const [rows] = await db.execute('SELECT * FROM `reviews`');
      return rows;
    } catch (error) {
      throw new Error('Error fetching reviews: ' + error.message);
    }
  }

  static async findById(uuid) {
    try {
      const [rows] = await db.execute('SELECT * FROM `reviews` WHERE `uuid` = ?', [uuid]);
      return rows[0] || null;
    } catch (error) {
      throw new Error('Error fetching review by ID: ' + error.message);
    }
  }

  static async create({ doctor_id, patient_id, comment }) {
    try {
      const uuid = uuidv4().replace(/-/g, '');
      const query = `
        INSERT INTO \`reviews\` (
          \`uuid\`, \`doctor_id\`, \`patient_id\`, \`comment\`
        ) VALUES (?, ?, ?, ?)
      `;
      const [result] = await db.execute(query, [uuid, doctor_id, patient_id, comment]);
      return { uuid, doctor_id, patient_id, comment };
    } catch (error) {
      throw new Error('Error creating review: ' + error.message);
    }
  }

  static async update(uuid, { doctor_id, patient_id, comment }) {
    try {
      const query = `
        UPDATE \`reviews\`
        SET \`doctor_id\` = ?, \`patient_id\` = ?, \`comment\` = ?
        WHERE \`uuid\` = ?
      `;
      const [result] = await db.execute(query, [doctor_id, patient_id, comment, uuid]);
      if (result.affectedRows === 0) {
        throw new Error('Review not found');
      }
      return { uuid, doctor_id, patient_id, comment };
    } catch (error) {
      throw new Error('Error updating review: ' + error.message);
    }
  }

  static async delete(uuid) {
    try {
      const [result] = await db.execute('DELETE FROM `reviews` WHERE `uuid` = ?', [uuid]);
      if (result.affectedRows === 0) {
        throw new Error('Review not found');
      }
      return { message: 'Review deleted successfully' };
    } catch (error) {
      throw new Error('Error deleting review: ' + error.message);
    }
  }
}

module.exports = Review;