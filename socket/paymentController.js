
const PaymentService = require("../service/paymentService");

class PaymentController {
  static async getAll(req, res) {
    try {
      const data = await PaymentService.getAll();
      res.json({ code: 200, msg: "Thành công", status: "success", data });
    } catch (error) {
      res.status(500).json({ code: 500, msg: error.message, status: "error" });
    }
  }

  static async getById(req, res) {
    try {
      const uuid = req.params.uuid;
      const data = await PaymentService.getById(uuid);
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
        user_id,
        appointment_id,
        amount,
        payment_method,
        status,
        payment_time,
      } = req.body;

      const result = await PaymentService.create({
        user_id,
        appointment_id,
        amount,
        payment_method,
        status,
        payment_time,
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
        user_id,
        appointment_id,
        amount,
        payment_method,
        status,
        payment_time,
      } = req.body;

      const updated = await PaymentService.update(req.params.id, {
        user_id,
        appointment_id,
        amount,
        payment_method,
        status,
        payment_time,
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
      const deleted = await PaymentService.remove(req.params.id);
      if (!deleted)
        return res
          .status(404)
          .json({ code: 404, msg: "Không tìm thấy để xóa", status: "error" });
      res.json({ code: 200, msg: "Xóa thành công", status: "success" });
    } catch (error) {
      res.status(500).json({ code: 500, msg: error.message, status: "error" });
    }
  }

  static async updateStatus(req, res) {
    try {
      const { status } = req.body;
      const uuid = req.params.uuid;

      if (typeof status === "undefined")
        return res
          .status(400)
          .json({ code: 400, msg: "Thiếu status", status: "error" });

      const updated = await PaymentService.updateStatus(uuid, status);

      if (!updated)
        return res.status(404).json({
          code: 404,
          msg: "Không tìm thấy để cập nhật",
          status: "error",
        });

      res.json({
        code: 200,
        msg: "Cập nhật trạng thái thành công",
        status: "success",
      });
    } catch (error) {
      res.status(400).json({ code: 400, msg: error.message, status: "error" });
    }
  }

  static async getByUserId(req, res) {
    try {
      const userId = req.params.userId;
      const data = await PaymentService.getByUserId(userId); // Sửa lỗi: thay purchases bằng PaymentService
      if (data.length === 0) {
        return res.status(404).json({
          code: 404,
          msg: "Không có thanh toán cho người dùng này",
          status: "error",
        });
      }
      res.json({ code: 200, msg: "Thành công", status: "success", data });
    } catch (error) {
      res.status(500).json({ code: 500, msg: error.message, status: "error" });
    }
  }

  static async getByAppointmentId(req, res) {
    try {
      const appointmentId = req.params.appointmentId;
      const data = await PaymentService.getByAppointmentId(appointmentId);
      if (data.length === 0) {
        return res.status(404).json({
          code: 404,
          msg: "Không có thanh toán cho lịch hẹn này",
          status: "error",
        });
      }
      res.json({ code: 200, msg: "Thành công", status: "success", data });
    } catch (error) {
      res.status(500).json({ code: 500, msg: error.message, status: "error" });
    }
  }

  static async handlePaymentSuccess(req, res) {
    try {
      const paymentData = req.body;
      const result = await PaymentService.handlePaymentSuccess(paymentData);

      res.json({
        code: 200,
        msg: "Payment success handled",
        status: "success",
        data: result,
      });
    } catch (error) {
      res.status(500).json({ code: 500, msg: error.message, status: "error" });
    }
  }

  static async handlePaymentFailure(req, res) {
    try {
      const paymentData = req.body;
      const result = await PaymentService.handlePaymentFailure(paymentData);

      res.json({
        code: 200,
        msg: "Payment failure handled",
        status: "success",
        data: result,
      });
    } catch (error) {
      res.status(500).json({ code: 500, msg: error.message, status: "error" });
    }
  }

  static async processRefund(req, res) {
    try {
      const paymentData = req.body;
      const result = await PaymentService.processRefund(paymentData);

      res.json({
        code: 200,
        msg: "Refund processed successfully",
        status: "success",
        data: result,
      });
    } catch (error) {
      res.status(500).json({ code: 500, msg: error.message, status: "error" });
    }
  }
}

module.exports = PaymentController;