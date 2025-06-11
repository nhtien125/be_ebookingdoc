const doctorService = require("../../src/service/doctorService");

module.exports = {
  async getAll(req, res) {
    try {
      const doctors = await doctorService.getAllDoctors();
      res.status(200).json(doctors);
    } catch (error) {
      console.error("Lỗi khi lấy danh sách bác sĩ:", error);
      return res.status(500).json({
        message: "Không thể lấy danh sách bác sĩ",
      });
    }
  },

  async getById(req, res) {
    try {
      const doctor = await doctorService.getDoctorById(req.params.id);
      res.status(200).json(doctor);
    } catch (error) {
      console.error(
        `Lỗi khi lấy thông tin bác sĩ với uuid ${req.params.id}:`,
        error
      );
      return res
        .status(error.message === "Không tìm thấy bác sĩ" ? 404 : 500)
        .json({
          message: error.message || "Không thể lấy thông tin bác sĩ",
        });
    }
  },

  async create(req, res) {
    try {
      const doctor = await doctorService.createDoctor(req.body);
      res.status(200).json({ code: 200, message: "Thành công", doctor });

    } catch (error) {
      console.error("Lỗi khi tạo bác sĩ:", error);
      return res
        .status(
          error.message === "Giấy phép hành nghề đã được sử dụng" ||
            error.message ===
            "Người dùng này đã được liên kết với một bác sĩ" ||
            error.message === "Chuyên khoa không tồn tại" ||
            error.message === "Thiếu các trường bắt buộc"
            ? 400
            : 500
        )
        .json({
          message: error.message || "Không thể tạo bác sĩ",
        });
    }
  },

  async update(req, res) {
    try {
      const doctor = await doctorService.updateDoctor(req.params.id, req.body);
      res.status(200).json(doctor);
    } catch (error) {
      console.error(
        `Lỗi khi cập nhật bác sĩ với uuid ${req.params.id}:`,
        error
      );
      return res
        .status(error.message === "Không tìm thấy bác sĩ" ? 404 : 500)
        .json({
          message: error.message || "Không thể cập nhật bác sĩ",
        });
    }
  },

  async delete(req, res) {
    try {
      const doctor = await doctorService.deleteDoctor(req.params.id);
      res.status(200).json(doctor);
    } catch (error) {
      console.error(`Lỗi khi xóa bác sĩ với uuid ${req.params.id}:`, error);
      return res
        .status(error.message === "Không tìm thấy bác sĩ" ? 404 : 500)
        .json({
          message: error.message || "Không thể xóa bác sĩ",
        });
    }
  },
};
