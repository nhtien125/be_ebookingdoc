const AppointmentService = require("../service/appointmentService");
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
        user_id, // Thêm user_id
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
        user_id, // Thêm user_id khi tạo
      });
      res.status(200).json({
        code: 200,
        msg: "Tạo thành công",
        status: "success",
        data: result,
      });
    } catch (error) {
      res.status(400).json({ code: 400, msg: error.message, status: "error" });
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
        user_id, // Thêm user_id
      } = req.body;
      const updated = await AppointmentService.update(req.params.id, {
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
        user_id, // Thêm user_id khi cập nhật
      });
      if (!updated)
        return res.status(404).json({
          code: 404,
          msg: "Không tìm thấy để cập nhật",
          status: "error",
        });
      res.json({ code: 200, msg: "Cập nhật thành công", status: "success" });
    } catch (error) {
      res.status(400).json({ code: 400, msg: error.message, status: "error" });
    }
  }

  static async delete(req, res) {
    try {
      const deleted = await AppointmentService.remove(req.params.id);
      if (!deleted)
        return res
          .status(404)
          .json({ code: 404, msg: "Không tìm thấy để xóa", status: "error" });
      res.json({ code: 200, msg: "Xóa thành công", status: "success" });
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

  static async delete(req, res) {
    try {
      const appointmentId = req.params.id; 
      const deleted = await AppointmentService.remove(appointmentId); 

      if (!deleted) {
        return res
          .status(404)
          .json({
            code: 404,
            msg: "Không tìm thấy cuộc hẹn để xóa",
            status: "error",
          });
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

  static async updateStatus(req, res) {
    try {
      const { uuid } = req.params;
      const { status } = req.body;
      const updated = await AppointmentService.updateStatus(uuid, status);
      if (!updated) {
        return res.status(404).json({
          code: 404,
          msg: "Không tìm thấy để cập nhật",
          status: "error",
        });
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
