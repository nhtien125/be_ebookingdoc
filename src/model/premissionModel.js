const db = require('../helper/database');
const { v4: uuidv4 } = require('uuid');

class premission {
  static async findAll() {
    try {
      const [rows] = await db.execute('SELECT * FROM `premission`');
      return rows;
    } catch (error) {
      throw new Error('Error fetching premission: ' + error.message);
    }
  }

  static async findById(uuid) {
    try {
      const [rows] = await db.execute('SELECT * FROM `premission` WHERE `uuid` = ?', [uuid]);
      return rows[0] || null;
    } catch (error) {
      throw new Error('Error fetching premission by ID: ' + error.message);
    }
  }
  static async create({ name }) {
    try {
      const query = `
      INSERT INTO \`premission\` (
        \`name\`
      ) VALUES (?)
    `;
      const [result] = await db.execute(query, [name]);

      const insertedId = result.insertId;
      return { id: insertedId, name };
    } catch (error) {
      throw new Error('Error creating premission: ' + error.message);
    }
  }


  static async update(uuid, { name }) {
    try {
      const query = `
        UPDATE \`premission\`
        SET \`name\` = ?
        WHERE \`uuid\` = ?
      `;
      const [result] = await db.execute(query, [name, uuid]);
      if (result.affectedRows === 0) {
        throw new Error('premission not found');
      }
      return { uuid, name };
    } catch (error) {
      throw new Error('Error updating premission: ' + error.message);
    }
  }

  static async delete(uuid) {
    try {
      const [result] = await db.execute('DELETE FROM `premission` WHERE `uuid` = ?', [uuid]);
      if (result.affectedRows === 0) {
        throw new Error('premission not found');
      }
      return { message: 'premission deleted successfully' };
    } catch (error) {
      throw new Error('Error deleting premission: ' + error.message);
    }
  }
}

module.exports = premission;