const db = require("../helper/database");

class HospitalDoctor {
  static async addDoctor(hospital_uuid, doctor_uuid) {
    const query = `
      INSERT INTO \`hospital_doctors\` (\`hospitals_uuid\`, \`doctor_uuid\`)
      VALUES (?, ?)
    `;
    await db.execute(query, [hospital_uuid, doctor_uuid]);
  }

  static async removeDoctor(hospital_uuid, doctor_uuid) {
    const query = `
      DELETE FROM \`hospital_doctors\`
      WHERE \`hospitals_uuid\` = ? AND \`doctor_uuid\` = ?
    `;
    await db.execute(query, [hospital_uuid, doctor_uuid]);
  }

  static async getDoctorsByHospital(hospital_uuid) {
    const query = `
      SELECT d.* FROM \`doctors\` d
      JOIN \`hospital_doctors\` hd ON d.uuid = hd.doctor_uuid
      WHERE hd.hospitals_uuid = ?
    `;
    const [rows] = await db.execute(query, [hospital_uuid]);
    return rows;
  }
}

module.exports = HospitalDoctor;