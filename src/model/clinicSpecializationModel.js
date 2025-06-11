const db = require("../helper/database");

class ClinicSpecialization {
  static async addSpecialization(clinic_uuid, specialization_uuid) {
    const query = `
      INSERT INTO \`clinics_specializations\` (\`clinic_uuid\`, \`specialization_uuid\`)
      VALUES (?, ?)
    `;
    await db.execute(query, [clinic_uuid, specialization_uuid]);
  }

  static async removeSpecialization(clinic_uuid, specialization_uuid) {
    const query = `
      DELETE FROM \`clinics_specializations\`
      WHERE \`clinic_uuid\` = ? AND \`specialization_uuid\` = ?
    `;
    await db.execute(query, [clinic_uuid, specialization_uuid]);
  }

  static async getSpecializationsByClinic(clinic_uuid) {
    const query = `
      SELECT s.* FROM \`specializations\` s
      JOIN \`clinics_specializations\` cs ON s.uuid = cs.specialization_uuid
      WHERE cs.clinic_uuid = ?
    `;
    const [rows] = await db.execute(query, [clinic_uuid]);
    return rows;
  }
}

module.exports = ClinicSpecialization;