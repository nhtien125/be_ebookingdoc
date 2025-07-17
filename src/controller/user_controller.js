const UserService = require("../service/authservice");

class UserController {
  static async login(req, res) {
    try {
      const result = await UserService.login(req.body);
      res.status(200).json(result);
    } catch (error) {
      return res.status(error.statusCode || 500).json({
        code: error.statusCode || 500,
        message: error.message,
      });
    }
  }

  static async register(req, res) {
    try {
      const result = await UserService.register(req.body);
      return res.status(200).json(result);
    } catch (error) {
      return res.status(200).json({
        code: error.statusCode || 500,
        message: error.message,
      });
    }
  }

  static async getDetailInfo(req, res) {
    try {
      const { id } = req.params;
      const result = await UserService.getDetailInfo(id);
      return res.status(result.code).json({
        code: result.code,
        data: result.data,
        message: result.message,
      });
    } catch (error) {
      return res.status(500).json({
        code: 500,
        data: null,
        message: "Internal server error",
      });
    }
  }

  static async updateProfile(req, res) {
    try {
      const uuid = req.params.uuid;
      if (!uuid) {
        return res.status(400).json({
          code: 400,
          message: "Thiếu uuid!",
          status: "error",
        });
      }
      const result = await UserService.updateProfile(uuid, req.body);
      res.status(200).json({
        code: 200,
        message: result.message || "Sửa thành công",
        status: "success",
        data: result.data,
      });
    } catch (error) {
      res.status(error.statusCode || 500).json({
        code: error.statusCode || 500,
        message: error.message || "Đã có lỗi xảy ra!",
        status: "error",
      });
    }
  }

  static async getAll(req, res) {
    try {
      const premission_id = req.query.premission_id
        ? parseInt(req.query.premission_id)
        : null;

      if (premission_id !== null && isNaN(premission_id)) {
        return res.status(400).json({
          code: 400,
          message: "premission_id phải là một số nguyên!",
        });
      }

      const result = await UserService.getAll(premission_id);

      return res.status(result.code).json({
        code: result.code,
        data: result.data,
        message: result.message,
      });
    } catch (error) {
      return res.status(error.statusCode || 500).json({
        code: error.statusCode || 500,
        message: error.message || "Lỗi server khi lấy danh sách người dùng",
      });
    }
  }

  static async getById(req, res) {
    try {
      const { id } = req.params;
      const result = await UserService.getById(id);
      return res.status(result.code).json(result);
    } catch (error) {
      return res.status(error.statusCode || 500).json({
        code: error.statusCode || 500,
        message: error.message || "Lỗi server khi lấy thông tin user",
      });
    }
  }
}

module.exports = UserController;
