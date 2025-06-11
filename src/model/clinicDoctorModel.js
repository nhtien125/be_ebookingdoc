const db = require("../helper/database");

class ClinicDoctor {
  static async addDoctor(clinic_uuid, doctor_uuid) {
    const query = `
      INSERT INTO \`clinics_doctors\` (\`clinic_uuid\`, \`doctor_uuid\`)
      VALUES (?, ?)
    `;
    await db.execute(query, [clinic_uuid, doctor_uuid]);
  }

  static async removeDoctor(clinic_uuid, doctor_uuid) {
    const query = `
      DELETE FROM \`clinics_doctors\`
      WHERE \`clinic_uuid\` = ? AND \`doctor_uuid\` = ?
    `;
    await db.execute(query, [clinic_uuid, doctor_uuid]);
  }

  static async getDoctorsByClinic(clinic_uuid) {
    const query = `
      SELECT d.* FROM \`doctors\` d
      JOIN \`clinics_doctors\` cd ON d.uuid = cd.doctor_uuid
      WHERE cd.clinic_uuid = ?
    `;
    const [rows] = await db.execute(query, [clinic_uuid]);
    return rows;
  }
}

module.exports = ClinicDoctor;