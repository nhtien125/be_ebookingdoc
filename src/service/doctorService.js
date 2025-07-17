const db = require("../helper/database");
const { v4: uuidv4 } = require("uuid");
const Doctor = require("../model/doctorModel");

class DoctorService {
  static async getAll() {
    const [rows] = await db.execute(
      "SELECT * FROM doctors ORDER BY created_at DESC"
    );
    return Doctor.fromRows(rows);
  }

  static async getById(uuid) {
    const [rows] = await db.execute("SELECT * FROM doctors WHERE uuid = ?", [
      uuid,
    ]);
    if (rows.length === 0) return null;
    return Doctor.fromRow(rows[0]);
  }

  static async create({
    user_id,
    hospital_id,
    clinic_id,
    specialization_id,
    license,
    introduce,
    experience,
    status = 1
  }) {
    const uuid = uuidv4().replace(/-/g, "").slice(0, 32);
    await db.execute(
      `INSERT INTO doctors 
      (uuid, user_id, hospital_id, clinic_id, specialization_id, license, introduce, experience, status, created_at, updated_at) 
      VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, NOW(), NOW())`,
      [
        uuid,
        user_id,
        hospital_id,
        clinic_id,
        specialization_id,
        license,
        introduce,
        experience,
        status,
      ]
    );
    return {
      uuid,
      user_id,
      hospital_id,
      clinic_id,
      specialization_id,
      license,
      introduce,
      experience,
      status,
    };
  }

  static async update(
    uuid,
    {
      user_id,
      hospital_id,
      clinic_id,
      specialization_id,
      license,
      introduce,
      experience,
      status
    }
  ) {
    const [result] = await db.execute(
      `UPDATE doctors SET user_id=?, hospital_id=?, clinic_id=?, specialization_id=?, license=?, introduce=?, experience=?, status=?, updated_at=NOW() WHERE uuid=?`,
      [
        user_id,
        hospital_id,
        clinic_id,
        specialization_id,
        license,
        introduce,
        experience,
        status,
        uuid,
      ]
    );
    return result.affectedRows > 0;
  }

  static async remove(uuid) {
    const [result] = await db.execute("DELETE FROM doctors WHERE uuid = ?", [
      uuid,
    ]);
    return result.affectedRows > 0;
  }

  static async getByUserId(userId) {
    const [rows] = await db.execute(
      "SELECT * FROM doctors WHERE user_id = ? ORDER BY created_at DESC",
      [userId]
    );
    return Doctor.fromRows(rows);
  }

  static async updateStatus(uuid, status) {
    const [result] = await db.execute(
      `UPDATE doctors SET status=?, updated_at=NOW() WHERE uuid=?`,
      [status, uuid]
    );
    return result.affectedRows > 0;
  }

  static async getByStatus(status) {
    const [rows] = await db.execute(
      "SELECT * FROM doctors WHERE status = ? ORDER BY created_at DESC",
      [status]
    );
    return Doctor.fromRows(rows);
  }
}

module.exports = DoctorService;