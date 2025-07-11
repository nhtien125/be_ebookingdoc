const db = require("../helper/database");
const { v4: uuidv4 } = require("uuid");
const Specialization = require("../model/specializationModel");

class SpecializationService {
  static async getAll() {
    const [rows] = await db.execute(
      "SELECT * FROM specializations ORDER BY created_at DESC"
    );
    return Specialization.fromRows(rows);
  }

  static async getById(uuid) {
    if (!uuid || uuid === "undefined" || uuid === "null") {
      return null;
    }
    const [rows] = await db.execute(
      "SELECT * FROM specializations WHERE uuid = ?",
      [uuid]
    );
    if (rows.length === 0) return null;
    return Specialization.fromRow(rows[0]);
  }

  static async create({ name }) {
    const uuid = uuidv4().replace(/-/g, "").slice(0, 32);
    await db.execute(
      "INSERT INTO specializations (uuid, name, created_at, updated_at) VALUES (?, ?, NOW(), NOW())",
      [uuid, name]
    );
    return { uuid, name };
  }
  static async update(uuid, { name }) {
    const [result] = await db.execute(
      "UPDATE specializations SET name = ?, updated_at = NOW() WHERE uuid = ?",
      [name, uuid]
    );
    return result.affectedRows > 0;
  }
  static async remove(uuid) {
    const [result] = await db.execute(
      "DELETE FROM specializations WHERE uuid = ?",
      [uuid]
    );
    return result.affectedRows > 0;
  }
}
module.exports = SpecializationService;
