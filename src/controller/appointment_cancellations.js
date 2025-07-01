const AppointmentCancellationService = require("../service/appointment_cancellations");
const AppointmentService = require("../service/appointmentService");

class AppointmentCancellationController {
  // Thêm lý do hủy lịch
  static async create(req, res) {
    try {
      const { appointment_uuid, cancel_reason, cancelled_by } = req.body;

      // Kiểm tra xem cuộc hẹn có tồn tại hay không
      const appointment = await AppointmentService.getById(appointment_uuid);
      if (!appointment) {
        return res.status(404).json({
          code: 404,
          msg: "Không tìm thấy cuộc hẹn",
          status: "error",
        });
      }

      // Tạo bản ghi lý do hủy lịch
      const cancellation = await AppointmentCancellationService.create({
        appointment_uuid,
        cancel_reason,
        cancelled_by,
      });

      res.status(201).json({
        code: 201,
        msg: "Lý do hủy lịch được thêm thành công",
        status: "success",
        data: cancellation,
      });
    } catch (error) {
      res.status(400).json({
        code: 400,
        msg: error.message,
        status: "error",
      });
    }
  }

  // Lấy lý do hủy lịch theo appointment_uuid
  static async getByAppointmentUuid(req, res) {
    try {
      const { appointment_uuid } = req.params;
      const cancellations = await AppointmentCancellationService.getByAppointmentUuid(appointment_uuid);

      if (cancellations.length === 0) {
        return res.status(404).json({
          code: 404,
          msg: "Không có lý do hủy cho cuộc hẹn này",
          status: "error",
        });
      }

      res.json({
        code: 200,
        msg: "Thành công",
        status: "success",
        data: cancellations,
      });
    } catch (error) {
      res.status(500).json({
        code: 500,
        msg: error.message,
        status: "error",
      });
    }
  }

  // Lấy lý do hủy lịch theo ID
  static async getById(req, res) {
    try {
      const { id } = req.params;
      const cancellation = await AppointmentCancellationService.getById(id);

      if (!cancellation) {
        return res.status(404).json({
          code: 404,
          msg: "Không tìm thấy lý do hủy",
          status: "error",
        });
      }

      res.json({
        code: 200,
        msg: "Thành công",
        status: "success",
        data: cancellation,
      });
    } catch (error) {
      res.status(500).json({
        code: 500,
        msg: error.message,
        status: "error",
      });
    }
  }
}

module.exports = AppointmentCancellationController;
