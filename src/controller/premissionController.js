const PremissionService = require("../service/premissionService");

class PremissionController {
  static async getAll(req, res) {
    try {
      const data = await PremissionService.getAll();
      res.json({ code: 200, msg: "Thành công", status: "success", data });
    } catch (error) {
      res.status(500).json({ code: 500, msg: error.message, status: "error" });
    }
  }
  static async getById(req, res) {
    try {
      const data = await PremissionService.getById(req.params.id);
      if (!data)
        return res.status(404).json({ code: 404, msg: "Không tìm thấy", status: "error" });
      res.json({ code: 200, msg: "Thành công", status: "success", data });
    } catch (error) {
      res.status(500).json({ code: 500, msg: error.message, status: "error" });
    }
  }
  static async create(req, res) {
    try {
      const { name } = req.body;
      const result = await PremissionService.create({ name });
      res.status(201).json({ code: 201, msg: "Tạo thành công", status: "success", data: result });
    } catch (error) {
      res.status(400).json({ code: 400, msg: error.message, status: "error" });
    }
  }
  static async update(req, res) {
    try {
      const { name } = req.body;
      const updated = await PremissionService.update(req.params.id, { name });
      if (!updated)
        return res.status(404).json({ code: 404, msg: "Không tìm thấy để cập nhật", status: "error" });
      res.json({ code: 200, msg: "Cập nhật thành công", status: "success" });
    } catch (error) {
      res.status(400).json({ code: 400, msg: error.message, status: "error" });
    }
  }
  static async delete(req, res) {
    try {
      const deleted = await PremissionService.remove(req.params.id);
      if (!deleted)
        return res.status(404).json({ code: 404, msg: "Không tìm thấy để xóa", status: "error" });
      res.json({ code: 200, msg: "Xóa thành công", status: "success" });
    } catch (error) {
      res.status(500).json({ code: 500, msg: error.message, status: "error" });
    }
  }
}
module.exports = PremissionController;
