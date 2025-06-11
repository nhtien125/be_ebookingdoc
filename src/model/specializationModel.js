const db = require('../helper/database');

class Specialization {
  static async findAll() {
    const [rows] = await db.execute('SELECT * FROM `specializations`');
    return rows;
  }

  static async findById(uuid) {
    const [rows] = await db.execute('SELECT * FROM `specializations` WHERE `uuid` = ?', [uuid]);
    return rows[0];
  }

  static async findByName(name) {
    const [rows] = await db.execute(
      'SELECT * FROM `specializations` WHERE LOWER(`name`) = LOWER(?) LIMIT 1',
      [name]
    );
    return rows[0] || null;
  }
  static async create({ uuid, name }) {
    const query = `
    INSERT INTO specializations(uuid, name)
    VALUES (?, ?)
  `;
    await db.execute(query, [uuid, name]);
  }

  static async update(uuid, { name }) {
    const query = `
      UPDATE \`specializations\`
      SET \`name\` = ? = ?
      WHERE \`uuid\` = ?
    `;
    await db.execute(query, [name, uuid]);
  }

  static async delete(uuid) {
    await db.execute('DELETE FROM `specializations` WHERE `uuid` = ?', [uuid]);
  }
}

module.exports = Specialization;
