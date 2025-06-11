const db = require('../helper/database');
const { v4: uuidv4 } = require('uuid');

class News {
  static async findAll() {
    try {
      const [rows] = await db.execute('SELECT * FROM `news`');
      return rows;
    } catch (error) {
      throw new Error('Error fetching news: ' + error.message);
    }
  }

  static async findById(uuid) {
    try {
      const [rows] = await db.execute('SELECT * FROM `news` WHERE `uuid` = ?', [uuid]);
      return rows[0] || null;
    } catch (error) {
      throw new Error('Error fetching news by ID: ' + error.message);
    }
  }

  static async create({ doctor_id, title, content }) {
    try {
      const uuid = uuidv4().replace(/-/g, '');
      const query = `
        INSERT INTO \`news\` (
          \`uuid\`, \`doctor_id\`, \`title\`, \`content\`
        ) VALUES (?, ?, ?, ?)
      `;
      const [result] = await db.execute(query, [uuid, doctor_id, title, content]);
      return { uuid, doctor_id, title, content };
    } catch (error) {
      throw new Error('Error creating news: ' + error.message);
    }
  }

  static async update(uuid, { doctor_id, title, content }) {
    try {
      const query = `
        UPDATE \`news\`
        SET \`doctor_id\` = ?, \`title\` = ?, \`content\` = ?
        WHERE \`uuid\` = ?
      `;
      const [result] = await db.execute(query, [doctor_id, title, content, uuid]);
      if (result.affectedRows === 0) {
        throw new Error('News not found');
      }
      return { uuid, doctor_id, title, content };
    } catch (error) {
      throw new Error('Error updating news: ' + error.message);
    }
  }

  static async delete(uuid) {
    try {
      const [result] = await db.execute('DELETE FROM `news` WHERE `uuid` = ?', [uuid]);
      if (result.affectedRows === 0) {
        throw new Error('News not found');
      }
      return { message: 'News deleted successfully' };
    } catch (error) {
      throw new Error('Error deleting news: ' + error.message);
    }
  }
}

module.exports = News;