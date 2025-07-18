const ReviewService = require("../service/reviewService");

class ReviewController {
  static async getAll(req, res) {
    try {
      const data = await ReviewService.getAll();
      res.json({ code: 200, msg: "Thành công", status: "success", data });
    } catch (error) {
      res.status(500).json({ code: 500, msg: error.message, status: "error" });
    }
  }

  static async getById(req, res) {
    try {
      const data = await ReviewService.getById(req.params.id);
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
      const { user_id, doctor_id, appointment_id, stars, comment } = req.body;
      const result = await ReviewService.create({
        user_id,
        doctor_id,
        appointment_id,
        stars,
        comment,
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
      const { stars, comment } = req.body;
      const updated = await ReviewService.update(req.params.id, {
        stars,
        comment,
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
      const deleted = await ReviewService.remove(req.params.id);
      if (!deleted)
        return res
          .status(404)
          .json({ code: 404, msg: "Không tìm thấy để xóa", status: "error" });
      res.json({ code: 200, msg: "Xóa thành công", status: "success" });
    } catch (error) {
      res.status(500).json({ code: 500, msg: error.message, status: "error" });
    }
  }

  static async getByDoctorId(req, res) {
    try {
      const doctor_id = req.params.doctorId;
      if (!doctor_id)
        return res
          .status(400)
          .json({ code: 400, message: "Missing doctor_id" });
      const reviews = await ReviewService.getByDoctorId(doctor_id);
      res.json({ code: 200, data: reviews });
    } catch (e) {
      res.status(500).json({ code: 500, message: e.message });
    }
  }

  static async getByAppointmentId(req, res) {
    try {
      const appointment_id = req.params.appointmentId;
      if (!appointment_id) {
        return res
          .status(400)
          .json({
            code: 400,
            message: "Missing appointment_id",
            status: "error",
          });
      }
      const reviews = await ReviewService.getByAppointmentId(appointment_id);
      if (!reviews || reviews.length === 0) {
        // Không có review nào
        return res.json({
          code: 200,
          msg: "Không có bình luận",
          status: "success",
          data: [],
        });
      }
      // Có review
      res.json({
        code: 200,
        msg: "Thành công",
        status: "success",
        data: reviews,
      });
    } catch (error) {
      res.status(500).json({ code: 500, msg: error.message, status: "error" });
    }
  }
}
module.exports = ReviewController;
