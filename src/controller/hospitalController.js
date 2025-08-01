const HospitalService = require("../service/hospitalService");
const { getImageValue } = require("../helper/image.helper");

class HospitalController {
  static async getAll(req, res) {
    try {
      const data = await HospitalService.getAll();
      res.json({ code: 200, msg: "Thành công", status: "success", data });
    } catch (error) {
      console.error("[HospitalController][getAll] error:", error);
      res.status(500).json({
        code: 500,
        msg: error?.message || "Internal server error",
        status: "error",
      });
    }
  }

  static async getById(req, res) {
    const { uuid } = req.params;

    if (!uuid) {
      return res.status(400).json({
        code: 400,
        msg: "UUID is required",
        status: "error",
      });
    }

    try {
      const data = await HospitalService.getById(uuid);
      if (!data)
        return res.status(404).json({
          code: 404,
          msg: "Không tìm thấy",
          status: "error",
        });
      res.json({ code: 200, msg: "Thành công", status: "success", data });
    } catch (error) {
      console.error("[HospitalController][getById] error:", error);
      res.status(500).json({
        code: 500,
        msg: error?.message || "Internal server error",
        status: "error",
      });
    }
  }

  static async create(req, res) {
    try {
      const { name, address, image, description } = req.body;
      const file = req.file;
      const imageValue = await getImageValue(file, image, "hospitals");
      const result = await HospitalService.create({
        name,
        address,
        image: imageValue,
        description, // truyền xuống service
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
      const { name, address, image, description } = req.body;
      const file = req.file;
      const imageValue = await getImageValue(file, image, "hospitals");
      const updated = await HospitalService.update(req.params.uuid, {
        name,
        address,
        image: imageValue,
        description,
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
      const deleted = await HospitalService.remove(req.params.uuid);
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

module.exports = HospitalController;
