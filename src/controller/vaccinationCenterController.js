const VaccinationCenterService = require("../service/vaccinationCenterService");
const { getImageValue } = require("../helper/image.helper");

class VaccinationCenterController {
  static async getAll(req, res) {
    try {
      const data = await VaccinationCenterService.getAll();
      res.json({ code: 200, msg: "Thành công", status: "success", data });
    } catch (error) {
      res.status(500).json({ code: 500, msg: error.message, status: "error" });
    }
  }

  static async getById(req, res) {
    try {
      const data = await VaccinationCenterService.getById(req.params.id);
      if (!data)
        return res.status(404).json({ code: 404, msg: "Không tìm thấy", status: "error" });
      res.json({ code: 200, msg: "Thành công", status: "success", data });
    } catch (error) {
      res.status(500).json({ code: 500, msg: error.message, status: "error" });
    }
  }

  static async create(req, res) {
    try {
      const { name, address, phone, email, description, status, working_hours } = req.body;
      const imageValue = await getImageValue(req.file, req.body.image, "vaccination_centers");
      const result = await VaccinationCenterService.create({
        name,
        address,
        phone,
        email,
        image: imageValue,
        description,
        status,
        working_hours,
      });
      res.status(201).json({ code: 201, msg: "Tạo thành công", status: "success", data: result });
    } catch (error) {
      res.status(error.statusCode || 400).json({ code: error.statusCode || 400, msg: error.message, status: "error" });
    }
  }

  static async update(req, res) {
    try {
      const {
        name = null,
        address = null,
        phone = null,
        email = null,
        image = null,
        description = null,
        status = null,
        working_hours = null,
      } = req.body;

      const imageValue = await getImageValue(req.file, image, "vaccination_centers");
      const updated = await VaccinationCenterService.update(req.params.uuid, {
        name,
        address,
        phone,
        email,
        image: imageValue ?? null,
        description,
        status,
        working_hours,
      });

      if (!updated)
        return res.status(404).json({
          code: 404,
          msg: "Không tìm thấy để cập nhật",
          status: "error",
        });

      res.json({
        code: 200,
        msg: "Cập nhật thành công",
        status: "success",
      });
    } catch (error) {
      console.error("Update lỗi:", error);
      res.status(error.statusCode || 400).json({
        code: error.statusCode || 400,
        msg: error.message,
        status: "error",
      });
    }
  }

  static async delete(req, res) {
    try {
      const deleted = await VaccinationCenterService.remove(req.params.id);
      if (!deleted)
        return res.status(404).json({ code: 404, msg: "Không tìm thấy để xóa", status: "error" });
      res.json({ code: 200, msg: "Xóa thành công", status: "success" });
    } catch (error) {
      res.status(500).json({ code: 500, msg: error.message, status: "error" });
    }
  }
}
module.exports = VaccinationCenterController;
