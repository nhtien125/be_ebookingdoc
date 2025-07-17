// service/appointmentService.js
const db = require("../helper/database");
const { v4: uuidv4 } = require("uuid");
const Appointment = require("../model/appointmentModel");
class AppointmentService {
  static async getAll() {
    const [rows] = await db.execute(
      "SELECT * FROM appointments ORDER BY created_at DESC"
    );
    return Appointment.fromRows(rows);
  }

  static async getById(uuid) {
    const [rows] = await db.execute(
      "SELECT * FROM appointments WHERE uuid = ?",
      [uuid]
    );
    if (rows.length === 0) return null;
    return Appointment.fromRow(rows[0]);
  }

  static async create({
    doctor_id,
    patient_id,
    clinic_id,
    hospital_id,
    schedule_id,
    vaccination_center_id,
    medical_service_id,
    date,
    status,
    health_status,
    user_id,
  }) {
    // Kiểm tra user đã đặt lịch cùng khung giờ chưa
    const [exist] = await db.execute(
      `SELECT uuid FROM appointments WHERE schedule_id = ? AND user_id = ? LIMIT 1`,
      [schedule_id, user_id]
    );
    if (exist.length > 0) {
      const error = new Error(
        "Bạn đã đặt lịch ở khung giờ này. Vui lòng chọn khung giờ khác!"
      );
      error.statusCode = 409;
      error.status = "duplicate_schedule";
      throw error;
    }

    const uuid = uuidv4().replace(/-/g, "").slice(0, 32);
    await db.execute(
      `INSERT INTO appointments 
      (uuid, doctor_id, patient_id, clinic_id, hospital_id, schedule_id, vaccination_center_id, medical_service_id, date, status, health_status, user_id, created_at, updated_at) 
      VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, NOW(), NOW())`,
      [
        uuid,
        doctor_id,
        patient_id,
        clinic_id,
        hospital_id,
        schedule_id,
        vaccination_center_id,
        medical_service_id,
        date,
        status,
        health_status,
        user_id,
      ]
    );
    return {
      uuid,
      doctor_id,
      patient_id,
      clinic_id,
      hospital_id,
      schedule_id,
      vaccination_center_id,
      medical_service_id,
      date,
      status,
      health_status,
      user_id,
    };
  }

  static async update(
    uuid,
    {
      doctor_id,
      patient_id,
      clinic_id,
      hospital_id,
      schedule_id,
      vaccination_center_id,
      medical_service_id,
      date,
      status,
      health_status,
      user_id, // Thêm user_id
    }
  ) {
    const [result] = await db.execute(
      `UPDATE appointments 
      SET doctor_id=?, patient_id=?, clinic_id=?, hospital_id=?, schedule_id=?, vaccination_center_id=?, medical_service_id=?, date=?, status=?, health_status=?, user_id=?, updated_at=NOW() 
      WHERE uuid=?`,
      [
        doctor_id,
        patient_id,
        clinic_id,
        hospital_id,
        schedule_id,
        vaccination_center_id,
        medical_service_id,
        date,
        status,
        health_status,
        user_id, // Gửi user_id vào database
        uuid,
      ]
    );
    return result.affectedRows > 0;
  }

  static async remove(uuid) {
    const [result] = await db.execute(
      "DELETE FROM appointments WHERE uuid = ?",
      [uuid]
    );
    return result.affectedRows > 0;
  }

  static async getByUserId(userId) {
    const [rows] = await db.execute(
      "SELECT * FROM appointments WHERE doctor_id = ? OR patient_id = ? OR user_id = ? ORDER BY created_at DESC",
      [userId, userId, userId]
    );
    return Appointment.fromRows(rows);
  }

  static async getByDoctorId(doctorId) {
    const [rows] = await db.execute(
      "SELECT * FROM appointments WHERE doctor_id = ? ORDER BY created_at DESC",
      [doctorId]
    );
    return Appointment.fromRows(rows);
  }
  static async updateStatus(uuid, status) {
    const [result] = await db.execute(
      "UPDATE appointments SET status = ?, updated_at = NOW() WHERE uuid = ?",
      [status, uuid]
    );
    return result.affectedRows > 0;
  }
}
module.exports = AppointmentService;
