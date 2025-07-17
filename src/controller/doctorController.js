const DoctorService = require("../service/doctorService");

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
      if (!data) {
        return res
          .status(404)
          .json({ code: 404, msg: "Không tìm thấy", status: "error" });
      }
      res.json({ code: 200, msg: "Thành công", status: "success", data });
    } catch (error) {
      res.status(500).json({ code: 500, msg: error.message, status: "error" });
    }
  }

  static async create(req, res) {
    try {
      const {
        user_id,
        hospital_id,
        clinic_id,
        specialization_id,
        license,
        introduce,
        experience,
        status,
      } = req.body;

      // Validate required fields
      if (!user_id) {
        return res.status(400).json({
          code: 400,
          msg: "Thiếu trường user_id",
          status: "error",
        });
      }
      if (!specialization_id) {
        return res.status(400).json({
          code: 400,
          msg: "Thiếu trường specialization_id",
          status: "error",
        });
      }
      if (experience === undefined) {
        return res.status(400).json({
          code: 400,
          msg: "Thiếu trường experience",
          status: "error",
        });
      }

      const result = await DoctorService.create({
        user_id,
        hospital_id,
        clinic_id, // Optional, can be null
        specialization_id,
        license,
        introduce,
        experience,
        status,
      });
      res.status(201).json({
        code: 201,
        msg: "Tạo thành công",
        status: "success",
        data: result,
      });
    } catch (error) {
      // Handle specific database errors (e.g., foreign key violations)
      if (error.code === "ER_NO_REFERENCED_ROW_2") {
        return res.status(400).json({
          code: 400,
          msg: "Invalid user_id, hospital_id, clinic_id, or specialization_id",
          status: "error",
        });
      }
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
        clinic_id,
        specialization_id,
        license,
        introduce,
        experience,
        status,
      } = req.body;

      // Validate required fields
      if (!user_id) {
        return res.status(400).json({
          code: 400,
          msg: "Thiếu trường user_id",
          status: "error",
        });
      }
      if (!specialization_id) {
        return res.status(400).json({
          code: 400,
          msg: "Thiếu trường specialization_id",
          status: "error",
        });
      }
      if (experience === undefined) {
        return res.status(400).json({
          code: 400,
          msg: "Thiếu trường experience",
          status: "error",
        });
      }

      const updated = await DoctorService.update(req.params.id, {
        user_id,
        hospital_id,
        clinic_id, // Optional, can be null
        specialization_id,
        license,
        introduce,
        experience,
        status,
      });
      if (!updated) {
        return res.status(404).json({
          code: 404,
          msg: "Không tìm thấy để cập nhật",
          status: "error",
        });
      }
      res.json({ code: 200, msg: "Cập nhật thành công", status: "success" });
    } catch (error) {
      // Handle specific database errors (e.g., foreign key violations)
      if (error.code === "ER_NO_REFERENCED_ROW_2") {
        return res.status(400).json({
          code: 400,
          msg: "Invalid user_id, hospital_id, clinic_id, or specialization_id",
          status: "error",
        });
      }
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
      if (!deleted) {
        return res
          .status(404)
          .json({ code: 404, msg: "Không tìm thấy để xóa", status: "error" });
      }
      res.json({ code: 200, msg: "Xóa thành công", status: "success" });
    } catch (error) {
      res.status(500).json({ code: 500, msg: error.message, status: "error" });
    }
  }

  static async getByUserId(req, res) {
    try {
      const userId = req.params.userId;
      if (!userId) {
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

  static async updateStatus(req, res) {
    try {
      let status = req.body.status;
      if (typeof status === "string") status = Number(status);
      const uuid = req.params.uuid;

      console.log("REQ:", { uuid, status });

      if (![0, 1, 2].includes(status)) {
        return res.status(400).json({
          code: 400,
          msg: "Status phải là 0 (đã duyệt), 1 (chờ duyệt), hoặc 2 (từ chối)",
          status: "error",
        });
      }

      const updated = await DoctorService.updateStatus(uuid, status);
      console.log("RESULT:", updated);

      if (!updated) {
        return res.status(404).json({
          code: 404,
          msg: "Không tìm thấy bác sĩ để cập nhật status",
          status: "error",
        });
      }

      res.json({
        code: 200,
        msg: "Cập nhật trạng thái thành công",
        status: "success",
      });
    } catch (error) {
      console.error("LỖI UPDATE STATUS:", error); // Log đầy đủ stacktrace
      res.status(500).json({ code: 500, msg: error.message, status: "error" });
    }
  }

  static async getByStatus(req, res) {
    try {
      const status = parseInt(req.params.status);

      if (![0, 1, 2].includes(status)) {
        return res.status(400).json({
          code: 400,
          msg: "Status phải là 0 (đã duyệt), 1 (chờ duyệt), hoặc 2 (từ chối)",
          status: "error",
        });
      }

      const data = await DoctorService.getByStatus(status);
      res.json({ code: 200, msg: "Thành công", status: "success", data });
    } catch (error) {
      res.status(500).json({ code: 500, msg: error.message, status: "error" });
    }
  }
}

module.exports = DoctorController;
