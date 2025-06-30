const db = require("../helper/database");
const { v4: uuidv4 } = require("uuid");
const VaccinationCenter = require("../model/vaccinationCenterModel");

class VaccinationCenterService {
  static async getAll() {
    const [rows] = await db.execute(
      "SELECT * FROM vaccination_centers ORDER BY created_at DESC"
    );
    return VaccinationCenter.fromRows(rows);
  }

  static async getById(uuid) {
    const [rows] = await db.execute(
      "SELECT * FROM vaccination_centers WHERE uuid = ?",
      [uuid]
    );
    if (rows.length === 0) return null;
    return VaccinationCenter.fromRow(rows[0]);
  }

  static async create({
    name,
    address,
    phone,
    email,
    image,
    description,
    status,
    working_hours,
  }) {
    const uuid = uuidv4().replace(/-/g, "").slice(0, 32);
    await db.execute(
      "INSERT INTO vaccination_centers (uuid, name, address, phone, email, image, description, status, working_hours, created_at, updated_at) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, NOW(), NOW())",
      [
        uuid,
        name,
        address,
        phone,
        email,
        image,
        description,
        status,
        working_hours,
      ]
    );
    return {
      uuid,
      name,
      address,
      phone,
      email,
      image,
      description,
      status,
      working_hours,
    };
  }

  static async update(
    uuid,
    { name, address, phone, email, image, description, status, working_hours }
  ) {
    const [result] = await db.execute(
      "UPDATE vaccination_centers SET name=?, address=?, phone=?, email=?, image=?, description=?, status=?, working_hours=?, updated_at=NOW() WHERE uuid=?",
      [
        name,
        address,
        phone,
        email,
        image,
        description,
        status,
        working_hours,
        uuid,
      ]
    );
    return result.affectedRows > 0;
  }

  static async remove(uuid) {
    const [result] = await db.execute(
      "DELETE FROM vaccination_centers WHERE uuid = ?",
      [uuid]
    );
    return result.affectedRows > 0;
  }
}
module.exports = VaccinationCenterService;
