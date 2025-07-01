const db = require("../helper/database");

class AppointmentCancellationService {
  static async create({ appointment_uuid, cancel_reason, cancelled_by }) {
    const [result] = await db.execute(
      `INSERT INTO appointment_cancellations 
      (appointment_uuid, cancel_reason, cancelled_by, cancelled_at)
      VALUES (?, ?, ?, NOW())`,
      [appointment_uuid, cancel_reason, cancelled_by]
    );

    return {
      id: result.insertId,
      appointment_uuid,
      cancel_reason,
      cancelled_by,
      cancelled_at: new Date(),
    };
  }

  // Lấy tất cả lý do hủy của một cuộc hẹn
  static async getByAppointmentUuid(appointment_uuid) {
    const [rows] = await db.execute(
      "SELECT * FROM appointment_cancellations WHERE appointment_uuid = ?",
      [appointment_uuid]
    );
    return rows;
  }

  // Lấy lý do hủy theo ID
  static async getById(id) {
    const [rows] = await db.execute(
      "SELECT * FROM appointment_cancellations WHERE id = ?",
      [id]
    );
    return rows[0] || null;
  }
}

module.exports = AppointmentCancellationService;
