const db = require('../helper/database');
const { v4: uuidv4 } = require('uuid');

class Package {
  static async findAll() {
    try {
      const [rows] = await db.execute('SELECT * FROM `packages`');
      return rows;
    } catch (error) {
      throw new Error('Error fetching packages: ' + error.message);
    }
  }

  static async findById(uuid) {
    try {
      const [rows] = await db.execute('SELECT * FROM `packages` WHERE `uuid` = ?', [uuid]);
      return rows[0] || null;
    } catch (error) {
      throw new Error('Error fetching package by ID: ' + error.message);
    }
  }

  static async create({ name, specialization_id, introduce, price }) {
    try {
      const uuid = uuidv4().replace(/-/g, '');
      const query = `
        INSERT INTO \`packages\` (
          \`uuid\`, \`name\`, \`specialization_id\`, \`introduce\`, \`price\`
        ) VALUES (?, ?, ?, ?, ?)
      `;
      const [result] = await db.execute(query, [uuid, name, specialization_id, introduce, price]);
      return { uuid, name, specialization_id, introduce, price };
    } catch (error) {
      throw new Error('Error creating package: ' + error.message);
    }
  }

  static async update(uuid, { name, specialization_id, introduce, price }) {
    try {
      const query = `
        UPDATE \`packages\`
        SET \`name\` = ?, \`specialization_id\` = ?, \`introduce\` = ?, \`price\` = ?
        WHERE \`uuid\` = ?
      `;
      const [result] = await db.execute(query, [name, specialization_id, introduce, price, uuid]);
      if (result.affectedRows === 0) {
        throw new Error('Package not found');
      }
      return { uuid, name, specialization_id, introduce, price };
    } catch (error) {
      throw new Error('Error updating package: ' + error.message);
    }
  }

  static async delete(uuid) {
    try {
      const [result] = await db.execute('DELETE FROM `packages` WHERE `uuid` = ?', [uuid]);
      if (result.affectedRows === 0) {
        throw new Error('Package not found');
      }
      return { message: 'Package deleted successfully' };
    } catch (error) {
      throw new Error('Error deleting package: ' + error.message);
    }
  }
}

module.exports = Package;