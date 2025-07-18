const db = require("../helper/database");
const { v4: uuidv4 } = require("uuid");
const Clinic = require("../model/clinicModel");

class ClinicService {
  static async getAll() {
    const [rows] = await db.execute(
      "SELECT * FROM clinics ORDER BY created_at DESC"
    );
    return Clinic.fromRows(rows);
  }

  static async getById(uuid) {
    const [rows] = await db.execute("SELECT * FROM clinics WHERE uuid = ?", [
      uuid,
    ]);
    if (rows.length === 0) return null;
    return Clinic.fromRow(rows[0]);
  }

  static async create({
    name,
    address,
    phone,
    email,
    image,
    description,
  }) {
    const uuid = uuidv4().replace(/-/g, "").slice(0, 32);
    await db.execute(
      "INSERT INTO clinics (uuid, name, address, phone, email, image, description, created_at, updated_at) VALUES (?, ?, ?, ?, ?, ?, ?, NOW(), NOW())",
      [uuid, name, address, phone, email, image, description]
    );
    return {
      uuid,
      name,
      address,
      phone,
      email,
      image,
      description,
    };
  }

  static async update(
    uuid,
    { name, address, phone, email, image, description }
  ) {
    const [result] = await db.execute(
      "UPDATE clinics SET name=?, address=?, phone=?, email=?, image=?, description=?, updated_at=NOW() WHERE uuid=?",
      [name, address, phone, email, image, description, uuid]
    );
    return result.affectedRows > 0;
  }

  static async remove(uuid) {
    const [result] = await db.execute("DELETE FROM clinics WHERE uuid = ?", [
      uuid,
    ]);
    return result.affectedRows > 0;
  }
}
module.exports = ClinicService;
