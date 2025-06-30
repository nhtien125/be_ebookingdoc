const DoctorService = require("../service/doctorService");
const { getImageValue } = require("../helper/image.helper");

class DoctorController {
  static async getAll(req, res) {
    try {
      const data = await DoctorService.getAll();
      res.json({ code: 200, msg: "Thành công", status: "success", data });
    } catch (error) {
      res.status(500).json({ code: 500, msg: error.message, status: "error" });
    }
  }

  static async getById(req, res) {
    try {
      const data = await DoctorService.getById(req.params.id);
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
      // Lấy thêm hospital_id
      const {
        user_id,
        hospital_id,
        doctor_type,
        specialization_id,
        license,
        introduce,
        experience,
        patient_count,
        image,
      } = req.body;

      if (!hospital_id) {
        return res.status(400).json({
          code: 400,
          msg: "Thiếu trường hospital_id",
          status: "error",
        });
      }
      if (experience === undefined || patient_count === undefined) {
        return res.status(400).json({
          code: 400,
          msg: "Thiếu trường experience hoặc patient_count",
          status: "error",
        });
      }

      const imageValue = await getImageValue(req.file, image, "doctors");
      const result = await DoctorService.create({
        user_id,
        hospital_id, // BẮT BUỘC truyền xuống Service
        doctor_type,
        specialization_id,
        license,
        introduce,
        experience,
        patient_count,
        image: imageValue,
      });
      res.status(201).json({
        code: 201,
        msg: "Tạo thành công",
        status: "success",
        data: result,
      });
    } catch (error) {
      res.status(error.statusCode || 400).json({
        code: error.statusCode || 400,
        msg: error.message,
        status: "error",
      });
    }
  }

  static async update(req, res) {
    try {
      const {
        user_id,
        hospital_id,
        doctor_type,
        specialization_id,
        license,
        introduce,
        experience,
        patient_count,
        image,
      } = req.body;

      if (!hospital_id) {
        return res.status(400).json({
          code: 400,
          msg: "Thiếu trường hospital_id",
          status: "error",
        });
      }
      if (experience === undefined || patient_count === undefined) {
        return res.status(400).json({
          code: 400,
          msg: "Thiếu trường experience hoặc patient_count",
          status: "error",
        });
      }

      const imageValue = await getImageValue(req.file, image, "doctors");
      const updated = await DoctorService.update(req.params.id, {
        user_id,
        hospital_id,
        doctor_type,
        specialization_id,
        license,
        introduce,
        experience,
        patient_count,
        image: imageValue,
      });
      if (!updated)
        return res.status(404).json({
          code: 404,
          msg: "Không tìm thấy để cập nhật",
          status: "error",
        });
      res.json({ code: 200, msg: "Cập nhật thành công", status: "success" });
    } catch (error) {
      res.status(error.statusCode || 400).json({
        code: error.statusCode || 400,
        msg: error.message,
        status: "error",
      });
    }
  }

  static async delete(req, res) {
    try {
      const deleted = await DoctorService.remove(req.params.id);
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
      if (!userId) {
        // Check rỗng hoặc undefined
        return res.status(400).json({
          code: 400,
          msg: "Thiếu userId trong URL",
          status: "error",
        });
      }

      const data = await DoctorService.getByUserId(userId);

      if (!data || data.length === 0) {
        return res.status(404).json({
          code: 404,
          msg: "Không tìm thấy bác sĩ với user_id này",
          status: "error",
        });
      }
      res.json({ code: 200, msg: "Thành công", status: "success", data });
    } catch (error) {
      res.status(500).json({ code: 500, msg: error.message, status: "error" });
    }
  }
}

module.exports = DoctorController;
