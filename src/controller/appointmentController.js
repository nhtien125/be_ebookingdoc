const AppointmentService = require("../service/appointmentService");
const NotificationService = require("../service/NotificationService");
const db = require("../helper/database");

class AppointmentController {
  static async getAll(req, res) {
    try {
      const data = await AppointmentService.getAll();
      res.json({ code: 200, msg: "Thành công", status: "success", data });
    } catch (error) {
      res.status(500).json({ code: 500, msg: error.message, status: "error" });
    }
  }

  static async getById(req, res) {
    try {
      const uuid = req.params.uuid;
      const data = await AppointmentService.getById(uuid);
      if (!data)
        return res
          .status(404)
          .json({ code: 404, msg: "Không tìm thấy", status: "error" });
      res.json({ code: 200, msg: "Thành công", status: "success", data });
    } catch (error) {
      res.status(500).json({ code: 500, msg: error.message, status: "error" });
    }
  }

  static async create(req, res) {
    try {
      const {
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
      } = req.body;

      const result = await AppointmentService.create({
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
      });

      // Tạo thông báo cho user/patient
      try {
        if (user_id) {
          await NotificationService.createAppointmentNotification(
            result.uuid,
            user_id,
            null,
            'appointment_created'
          );
        }

        // Tạo thông báo cho doctor
        if (doctor_id) {
          await NotificationService.createAppointmentNotification(
            result.uuid,
            null,
            doctor_id,
            'appointment_created'
          );
        }
      } catch (notificationError) {
        console.error('Error creating appointment notifications:', notificationError);
        // Không throw lỗi vì appointment đã tạo thành công
      }

      res.status(201).json({
        code: 201,
        msg: "Tạo thành công",
        status: "success",
        data: result,
      });
    } catch (error) {
      const code = error.statusCode || 400;
      const status = error.status || "error";
      res.status(code).json({
        code: code,
        msg: error.message,
        status: status,
      });
    }
  }

  static async update(req, res) {
    try {
      const {
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
      } = req.body;

      const appointmentId = req.params.id;
      
      // Lấy thông tin appointment cũ để so sánh
      const oldAppointment = await AppointmentService.getById(appointmentId);
      
      const updated = await AppointmentService.update(appointmentId, {
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
      });

      if (!updated) {
        return res.status(404).json({
          code: 404,
          msg: "Không tìm thấy để cập nhật",
          status: "error",
        });
      }

      // Tạo thông báo khi có thay đổi về status
      try {
        if (oldAppointment && oldAppointment.status !== status) {
          let notificationType = null;
          
          if (status === 'confirmed') {
            notificationType = 'appointment_confirmed';
          } else if (status === 'cancelled') {
            notificationType = 'appointment_cancelled';
          } else if (status === 'completed') {
            notificationType = 'appointment_completed';
          }

          if (notificationType) {
            // Thông báo cho user/patient
            if (user_id) {
              await NotificationService.createAppointmentNotification(
                appointmentId,
                user_id,
                null,
                notificationType
              );
            }

            // Thông báo cho doctor
            if (doctor_id) {
              await NotificationService.createAppointmentNotification(
                appointmentId,
                null,
                doctor_id,
                notificationType
              );
            }
          }
        }
      } catch (notificationError) {
        console.error('Error creating update notifications:', notificationError);
      }

      res.json({ code: 200, msg: "Cập nhật thành công", status: "success" });
    } catch (error) {
      res.status(400).json({ code: 400, msg: error.message, status: "error" });
    }
  }

  static async delete(req, res) {
    try {
      const appointmentId = req.params.id;
      
      // Lấy thông tin appointment trước khi xóa để tạo thông báo
      const appointment = await AppointmentService.getById(appointmentId);
      
      const deleted = await AppointmentService.remove(appointmentId);

      if (!deleted) {
        return res.status(404).json({
          code: 404,
          msg: "Không tìm thấy cuộc hẹn để xóa",
          status: "error",
        });
      }

      // Tạo thông báo hủy appointment
      try {
        if (appointment) {
          // Thông báo cho user/patient
          if (appointment.user_id) {
            await NotificationService.createAppointmentNotification(
              appointmentId,
              appointment.user_id,
              null,
              'appointment_cancelled'
            );
          }

          // Thông báo cho doctor
          if (appointment.doctor_id) {
            await NotificationService.createAppointmentNotification(
              appointmentId,
              null,
              appointment.doctor_id,
              'appointment_cancelled'
            );
          }
        }
      } catch (notificationError) {
        console.error('Error creating deletion notifications:', notificationError);
      }

      res.json({
        code: 200,
        msg: "Xóa cuộc hẹn thành công",
        status: "success",
      });
    } catch (error) {
      res.status(500).json({ code: 500, msg: error.message, status: "error" });
    }
  }

  static async getByUserId(req, res) {
    try {
      const userId = req.params.userId;
      const data = await AppointmentService.getByUserId(userId);
      if (!data || data.length === 0) {
        return res.status(404).json({
          code: 404,
          msg: "Không tìm thấy cuộc hẹn nào",
          status: "error",
        });
      }
      res.json({ code: 200, msg: "Thành công", status: "success", data });
    } catch (error) {
      res.status(500).json({ code: 500, msg: error.message, status: "error" });
    }
  }

  static async getByDoctorId(req, res) {
    try {
      const doctorId = req.params.doctorId;
      const data = await AppointmentService.getByDoctorId(doctorId);
      if (!data || data.length === 0) {
        return res.status(404).json({
          code: 404,
          msg: "Không tìm thấy cuộc hẹn nào",
          status: "error",
        });
      }
      res.json({ code: 200, msg: "Thành công", status: "success", data });
    } catch (error) {
      res.status(500).json({ code: 500, msg: error.message, status: "error" });
    }
  }

  static async updateStatus(req, res) {
    try {
      const { uuid } = req.params;
      const { status } = req.body;
      
      // Lấy thông tin appointment cũ
      const oldAppointment = await AppointmentService.getById(uuid);
      
      const updated = await AppointmentService.updateStatus(uuid, status);
      
      if (!updated) {
        return res.status(404).json({
          code: 404,
          msg: "Không tìm thấy để cập nhật",
          status: "error",
        });
      }

      // Tạo thông báo khi thay đổi status
      try {
        if (oldAppointment && oldAppointment.status !== status) {
          let notificationType = null;
          
          if (status === 'confirmed') {
            notificationType = 'appointment_confirmed';
          } else if (status === 'cancelled') {
            notificationType = 'appointment_cancelled';
          } else if (status === 'completed') {
            notificationType = 'appointment_completed';
          }

          if (notificationType) {
            // Thông báo cho user/patient
            if (oldAppointment.user_id) {
              await NotificationService.createAppointmentNotification(
                uuid,
                oldAppointment.user_id,
                null,
                notificationType
              );
            }

            // Thông báo cho doctor
            if (oldAppointment.doctor_id) {
              await NotificationService.createAppointmentNotification(
                uuid,
                null,
                oldAppointment.doctor_id,
                notificationType
              );
            }
          }
        }
      } catch (notificationError) {
        console.error('Error creating status update notifications:', notificationError);
      }

      res.json({
        code: 200,
        msg: "Cập nhật trạng thái thành công",
        status: "success",
      });
    } catch (error) {
      res.status(400).json({ code: 400, msg: error.message, status: "error" });
    }
  }
}

module.exports = AppointmentController;