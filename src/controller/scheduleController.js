const ScheduleService = require("../service/scheduleService");

class ScheduleController {
  static async getAll(req, res) {
    try {
      const data = await ScheduleService.getAll();
      res.json({ code: 200, msg: "Thành công", status: "success", data });
    } catch (error) {
      res.status(500).json({ code: 500, msg: error.message, status: "error" });
    }
  }

  static async getById(req, res) {
    try {
      const data = await ScheduleService.getById(req.params.id);
      if (!data)
        return res
          .status(404)
          .json({ code: 404, msg: "Không tìm thấy", status: "error" });
      res.json({ code: 200, msg: "Thành công", status: "success", data });
    } catch (error) {
      res.status(500).json({ code: 500, msg: error.message, status: "error" });
    }
  }

  static async getByDoctorId(req, res) {
    try {
      const { doctor_id } = req.params;
      const data = await ScheduleService.getByDoctorId(doctor_id);
      if (!data)
        return res
          .status(404)
          .json({ code: 404, msg: "Không tìm thấy", status: "error" });
      res.json({ code: 200, msg: "Thành công", status: "success", data });
    } catch (err) {
      res.status(500).json({
        code: 500,
        msg: err.message,
        status: "error",
      });
    }
  }

  static async create(req, res) {
    try {
      const { doctor_id, work_date, start_time, end_time } = req.body;

      // Validation dữ liệu đầu vào
      if (!doctor_id || !work_date || !start_time || !end_time) {
        return res.status(400).json({
          code: 400,
          msg: "Thiếu thông tin bắt buộc",
          status: "error",
        });
      }

      const result = await ScheduleService.create({
        doctor_id,
        work_date,
        start_time,
        end_time,
      });

      res.status(201).json({
        code: 201,
        msg: "Tạo thành công",
        status: "success",
        data: result,
      });
    } catch (error) {
      // Xử lý các loại lỗi khác nhau
      if (error.message.includes("Doctor không tồn tại")) {
        return res.status(400).json({
          code: 400,
          msg: "Doctor không tồn tại trong hệ thống",
          status: "error",
        });
      }
      
      if (error.message.includes("trùng lịch")) {
        return res.status(409).json({
          code: 409,
          msg: "Thời gian đã bị trùng lịch với một ca khác!",
          status: "error",
        });
      }

      res.status(400).json({ code: 400, msg: error.message, status: "error" });
    }
  }

  static async update(req, res) {
    try {
      const { doctor_id, work_date, start_time, end_time } = req.body;

      // Validation dữ liệu đầu vào
      if (!doctor_id || !work_date || !start_time || !end_time) {
        return res.status(400).json({
          code: 400,
          msg: "Thiếu thông tin bắt buộc",
          status: "error",
        });
      }

      const updated = await ScheduleService.update(req.params.id, {
        doctor_id,
        work_date,
        start_time,
        end_time,
      });

      if (!updated)
        return res.status(404).json({
          code: 404,
          msg: "Không tìm thấy để cập nhật",
          status: "error",
        });

      res.json({ code: 200, msg: "Cập nhật thành công", status: "success" });
    } catch (error) {
      // Xử lý các loại lỗi khác nhau
      if (error.message.includes("Doctor không tồn tại")) {
        return res.status(400).json({
          code: 400,
          msg: "Doctor không tồn tại trong hệ thống",
          status: "error",
        });
      }
      
      if (error.message.includes("trùng lịch")) {
        return res.status(409).json({
          code: 409,
          msg: "Thời gian đã bị trùng lịch với một ca khác!",
          status: "error",
        });
      }

      res.status(400).json({ code: 400, msg: error.message, status: "error" });
    }
  }

  static async delete(req, res) {
    try {
      const deleted = await ScheduleService.remove(req.params.id);
      if (!deleted)
        return res
          .status(404)
          .json({ code: 404, msg: "Không tìm thấy để xóa", status: "error" });
      res.json({ code: 200, msg: "Xóa thành công", status: "success" });
    } catch (error) {
      res.status(500).json({ code: 500, msg: error.message, status: "error" });
    }
  }
}

module.exports = ScheduleController;