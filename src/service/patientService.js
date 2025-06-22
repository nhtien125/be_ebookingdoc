const db = require("../helper/database");
const { v4: uuidv4 } = require("uuid");
const Patient = require("../model/patientModel");

class PatientService {
  static async getAll() {
    const [rows] = await db.execute(
      "SELECT * FROM patients ORDER BY created_at DESC"
    );
    return Patient.fromRows(rows);
  }

  static async getById(uuid) {
    const [rows] = await db.execute("SELECT * FROM patients WHERE uuid = ?", [
      uuid,
    ]);
    if (rows.length === 0) return null;
    return Patient.fromRow(rows[0]);
  }

  static async create(data) {
    const uuid = uuidv4().replace(/-/g, "").slice(0, 32);
    const { user_id, name, dob, gender, phone, relationship, address } = data;

    await db.execute(
      `INSERT INTO patients 
        (uuid, user_id, name, dob, gender, phone, relationship, address, created_at, updated_at) 
        VALUES (?, ?, ?, ?, ?, ?, ?, ?, NOW(), NOW())`,
      [uuid, user_id, name, dob, gender, phone, relationship, address]
    );
    return { uuid, ...data };
  }

  static async update(uuid, data) {
    const { user_id, name, dob, gender, phone, relationship, address } = data;

    const [result] = await db.execute(
      `UPDATE patients SET 
        user_id = ?, name = ?, dob = ?, gender = ?, phone = ?, relationship = ?, address = ?, updated_at = NOW()
      WHERE uuid = ?`,
      [user_id, name, dob, gender, phone, relationship, address, uuid]
    );
    return result.affectedRows > 0;
  }

  static async remove(uuid) {
    const [result] = await db.execute("DELETE FROM patients WHERE uuid = ?", [
      uuid,
    ]);
    return result.affectedRows > 0;
  }
  static async getByUserId(user_id) {
    const [rows] = await db.execute(
      "SELECT * FROM patients WHERE user_id = ? ORDER BY created_at DESC",
      [user_id]
    );
    return Patient.fromRows(rows);
  }
}
module.exports = PatientService;
