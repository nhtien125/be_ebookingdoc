const db = require("../helper/database");

class HospitalSpecialization {
  static async addSpecialization(hospital_uuid, specialization_uuid) {
    const query = `
      INSERT INTO \`hospital_specializations\` (\`hospital_uuid\`, \`specialization_uuid\`)
      VALUES (?, ?)
    `;
    await db.execute(query, [hospital_uuid, specialization_uuid]);
  }

  static async removeSpecialization(hospital_uuid, specialization_uuid) {
    const query = `
      DELETE FROM \`hospital_specializations\`
      WHERE \`hospital_uuid\` = ? AND \`specialization_uuid\` = ?
    `;
    await db.execute(query, [hospital_uuid, specialization_uuid]);
  }

  static async getSpecializationsByHospital(hospital_uuid) {
    const query = `
      SELECT s.* FROM \`specializations\` s
      JOIN \`hospital_specializations\` hs ON s.uuid = hs.specialization_uuid
      WHERE hs.hospital_uuid = ?
    `;
    const [rows] = await db.execute(query, [hospital_uuid]);
    return rows;
  }
}

module.exports = HospitalSpecialization;