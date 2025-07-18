// services/appointmentService.js
const db = require("../helper/database");
const { v4: uuidv4 } = require("uuid");
const NotificationService = require("./NotificationService");

class AppointmentService {
  static async getAll() {
    const [rows] = await db.execute(
      "SELECT * FROM appointments ORDER BY created_at DESC"
    );
    return rows;
  }

  static async getById(uuid) {
    const [rows] = await db.execute(
      "SELECT * FROM appointments WHERE uuid = ?",
      [uuid]
    );
    return rows.length > 0 ? rows[0] : null;
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
    const uuid = uuidv4().replace(/-/g, "").slice(0, 32);
    const created_at = new Date();
    const updated_at = created_at;
    const params = [
      uuid,
      doctor_id || null,
      patient_id || null,
      clinic_id || null,
      hospital_id || null,
      schedule_id || null,
      vaccination_center_id || null,
      medical_service_id || null,
      date,
      status || 1,
      health_status || null,
      user_id,
      created_at,
      updated_at,
    ];
    try {
      const [result] = await db.execute(
        `INSERT INTO appointments 
        (uuid, doctor_id, patient_id, clinic_id, hospital_id, schedule_id, vaccination_center_id, medical_service_id, date, status, health_status, user_id, created_at, updated_at)
        VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)`,
        params
      );
      console.log("Kết quả insert:", result);
      // result.affectedRows phải = 1 nếu insert thành công
      if (result.affectedRows !== 1) throw new Error('Insert không thành công!');
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
        status: status || 1,
        health_status,
        user_id,
        created_at,
        updated_at,
      };
    } catch (error) {
      console.error("Lỗi khi insert appointment:", error);
      throw error;
    }
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
      user_id,
    }
  ) {
    const oldAppointment = await this.getById(uuid);

    const [result] = await db.execute(
      `UPDATE appointments SET 
        doctor_id=?, patient_id=?, clinic_id=?, hospital_id=?, schedule_id=?, 
        vaccination_center_id=?, medical_service_id=?, date=?, status=?, health_status=?, user_id=?, updated_at=NOW()
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
        user_id,
        uuid,
      ]
    );

    if (
      result.affectedRows > 0 &&
      oldAppointment &&
      oldAppointment.status !== status
    ) {
      try {
        let notificationType;
        if (status === 0) notificationType = "appointment_success";
        else if (status === 1) notificationType = "appointment_pending";
        else if (status === 2) notificationType = "appointment_confirmed";
        else if (status === 3) notificationType = "appointment_rejected";
        else if (status === 4) notificationType = "appointment_cancelled";

        if (notificationType) {
          await NotificationService.createAppointmentNotification(
            uuid,
            user_id,
            doctor_id,
            notificationType
          );
        }
      } catch (notificationError) {
        console.error(
          "Error creating appointment update notification:",
          notificationError
        );
      }
    }

    return result.affectedRows > 0;
  }

  static async remove(uuid) {
    const appointment = await this.getById(uuid);

    const [result] = await db.execute(
      "DELETE FROM appointments WHERE uuid = ?",
      [uuid]
    );

    if (result.affectedRows > 0 && appointment) {
      try {
        await NotificationService.createAppointmentNotification(
          uuid,
          appointment.user_id,
          appointment.doctor_id,
          "appointment_cancelled"
        );
      } catch (notificationError) {
        console.error(
          "Error creating appointment deletion notification:",
          notificationError
        );
      }
    }

    return result.affectedRows > 0;
  }

  static async updateStatus(uuid, status) {
    const oldAppointment = await this.getById(uuid);

    const [result] = await db.execute(
      `UPDATE appointments SET status = ?, updated_at = NOW() WHERE uuid = ?`,
      [status, uuid]
    );

    if (
      result.affectedRows > 0 &&
      oldAppointment &&
      oldAppointment.status !== status
    ) {
      try {
        let notificationType;
        if (status === 0) notificationType = "appointment_success";
        else if (status === 1) notificationType = "appointment_pending";
        else if (status === 2) notificationType = "appointment_confirmed";
        else if (status === 3) notificationType = "appointment_rejected";
        else if (status === 4) notificationType = "appointment_cancelled";

        if (notificationType) {
          await NotificationService.createAppointmentNotification(
            uuid,
            oldAppointment.user_id,
            oldAppointment.doctor_id,
            notificationType
          );
        }
      } catch (notificationError) {
        console.error(
          "Error creating appointment status notification:",
          notificationError
        );
      }
    }

    return result.affectedRows > 0;
  }

  static async getByUserId(userId) {
    const [rows] = await db.execute(
      `SELECT a.*, u.name AS user_name, d.name AS doctor_name
       FROM appointments a
       LEFT JOIN user u ON a.user_id = u.uuid
       LEFT JOIN user d ON a.doctor_id = d.uuid
       WHERE a.user_id = ?
       ORDER BY a.date DESC`,
      [userId]
    );
    return rows;
  }

  static async getByDoctorId(doctorId) {
    const [rows] = await db.execute(
      `SELECT a.*, u.name AS user_name, d.name AS doctor_name
       FROM appointments a
       LEFT JOIN user u ON a.user_id = u.uuid
       LEFT JOIN user d ON a.doctor_id = d.uuid
       WHERE a.doctor_id = ?
       ORDER BY a.date DESC`,
      [doctorId]
    );
    return rows;
  }
}

module.exports = AppointmentService;
