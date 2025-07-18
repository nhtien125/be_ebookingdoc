// src/service/NotificationService.js
const Notification = require("../model/Notification");
const { v4: uuidv4 } = require("uuid");
const db = require("../helper/database");
const { socketService } = require("../../index");

function getTypeByStatus(status) {
  switch (Number(status)) {
    case 0:
      return "appointment_completed";
    case 1:
      return "appointment_created";
    case 2:
      return "appointment_confirmed";
    case 3:
      return "appointment_rejected";
    case 4:
      return "appointment_cancelled";
    default:
      return "appointment_updated";
  }
}

class NotificationService {
  static async getNotifications(userId, page = 1, limit = 20) {
    try {
      if (!userId) throw new Error("Thiếu userId");
      const notifications = await Notification.findByUserId(
        userId,
        page,
        limit
      );
      const total = await Notification.countByUserId(userId);
      const totalPages = Math.ceil(total / limit);

      return {
        data: {
          notifications,
          pagination: {
            current_page: parseInt(page),
            total_pages: totalPages,
            total_items: total,
            has_more: page < totalPages,
          },
        },
      };
    } catch (error) {
      console.error("Lỗi lấy thông báo:", error);
      throw new Error(`Không thể lấy thông báo: ${error.message}`);
    }
  }

  static async createNotification(data) {
    try {
      if (!data.user_id || !data.title || !data.type) {
        throw new Error("Thiếu user_id, title hoặc type");
      }
      const [user] = await db.execute("SELECT uuid FROM user WHERE uuid = ?", [
        data.user_id,
      ]);
      if (user.length === 0)
        throw new Error(
          `user_id ${data.user_id} không tồn tại trong bảng user`
        );

      const uuid = uuidv4().replace(/-/g, "");
      const created_at = new Date();

      const notificationData = {
        uuid,
        title: data.title,
        content: data.content || null,
        user_id: data.user_id,
        doctor_id: data.doctor_id || null,
        appointment_id: data.appointment_id || null,
        payment_id: data.payment_id || null,
        type: data.type,
        is_read: 0,
        created_at,
      };

      const notification = await Notification.create(notificationData);

      if (
        socketService &&
        typeof socketService.sendNotificationToUser === "function"
      ) {
        socketService.sendNotificationToUser(data.user_id, notification);
      } else {
        console.warn("socketService chưa được khởi tạo");
      }

      return notification;
    } catch (error) {
      console.error("Lỗi tạo thông báo:", error);
      throw new Error(`Không thể tạo thông báo: ${error.message}`);
    }
  }

  static async markAsRead(notificationId) {
    try {
      if (!notificationId) throw new Error("Thiếu notificationId");
      const success = await Notification.markAsRead(notificationId);
      if (!success) throw new Error("Không tìm thấy thông báo");
      return true;
    } catch (error) {
      console.error("Lỗi đánh dấu đã đọc:", error);
      throw new Error(`Không thể đánh dấu thông báo đã đọc: ${error.message}`);
    }
  }

  static async markAllAsRead(userId) {
    try {
      if (!userId) throw new Error("Thiếu userId");
      const affectedRows = await Notification.markAllAsReadByUserId(userId);
      return affectedRows;
    } catch (error) {
      console.error("Lỗi đánh dấu tất cả đã đọc:", error);
      throw new Error(
        `Không thể đánh dấu tất cả thông báo đã đọc: ${error.message}`
      );
    }
  }

  static async getUnreadCount(userId) {
    try {
      if (!userId) throw new Error("Thiếu userId");
      const count = await Notification.countUnreadByUserId(userId);
      return { data: { count } };
    } catch (error) {
      console.error("Lỗi lấy số thông báo chưa đọc:", error);
      throw new Error(`Không thể lấy số thông báo chưa đọc: ${error.message}`);
    }
  }

  static async deleteNotification(notificationId) {
    try {
      if (!notificationId) throw new Error("Thiếu notificationId");
      const success = await Notification.deleteById(notificationId);
      if (!success) throw new Error("Không tìm thấy thông báo");
      return true;
    } catch (error) {
      console.error("Lỗi xóa thông báo:", error);
      throw new Error(`Không thể xóa thông báo: ${error.message}`);
    }
  }

  static async createAppointmentNotification(appointmentId) {
    try {
      if (!appointmentId) throw new Error("Thiếu appointmentId");

      const [appointmentRows] = await db.execute(
        `SELECT a.*, s.start_time, s.work_date
         FROM appointments a
         LEFT JOIN schedules s ON a.schedule_id = s.uuid
         WHERE a.uuid = ?`,
        [appointmentId]
      );
      if (!appointmentRows || appointmentRows.length === 0) {
        throw new Error("Không tìm thấy cuộc hẹn");
      }

      const appointment = appointmentRows[0];
      const patientUserId = appointment.user_id;
      const doctorUuid = appointment.doctor_id;

      let doctorUserId = null;
      if (doctorUuid) {
        const [doctorRows] = await db.execute(
          "SELECT user_id FROM doctors WHERE uuid = ?",
          [doctorUuid]
        );
        if (doctorRows.length > 0 && doctorRows[0].user_id) {
          doctorUserId = doctorRows[0].user_id;
        }
      }

      let doctorName = "bác sĩ";
      let patientName = "bạn";
      if (doctorUserId) {
        const [docRows] = await db.execute(
          "SELECT name FROM user WHERE uuid = ?",
          [doctorUserId]
        );
        if (docRows.length > 0) doctorName = docRows[0].name || "bác sĩ";
      }
      if (patientUserId) {
        const [patRows] = await db.execute(
          "SELECT name FROM user WHERE uuid = ?",
          [patientUserId]
        );
        if (patRows.length > 0) patientName = patRows[0].name || "bạn";
      }

      const appointmentTime = appointment.start_time
        ? `${appointment.work_date} ${appointment.start_time}`
        : appointment.date || "không xác định";

      const type = getTypeByStatus(appointment.status);

      const titles = {
        appointment_created: "Lịch hẹn mới",
        appointment_confirmed: "Lịch hẹn đã xác nhận",
        appointment_cancelled: "Lịch hẹn đã hủy",
        appointment_rejected: "Lịch hẹn bị từ chối",
        appointment_completed: "Lịch hẹn đã khám",
        appointment_updated: "Cập nhật lịch hẹn",
      };

      const contents = {
        appointment_created: `Bạn (${patientName}) vừa đặt lịch hẹn mới với ${doctorName} vào ${appointmentTime}`,
        appointment_confirmed: `Lịch hẹn với ${doctorName} vào ${appointmentTime} đã được xác nhận`,
        appointment_cancelled: `Lịch hẹn với ${doctorName} vào ${appointmentTime} đã bị hủy`,
        appointment_rejected: `Lịch hẹn với ${doctorName} vào ${appointmentTime} đã bị từ chối`,
        appointment_completed: `Lịch hẹn với ${doctorName} vào ${appointmentTime} đã hoàn thành (đã khám)`,
        appointment_updated: `Lịch hẹn với ${doctorName} vào ${appointmentTime} đã được cập nhật`,
      };

      if (patientUserId) {
        await this.createNotification({
          title: titles[type] || "Thông báo lịch hẹn",
          content: contents[type] || "Có cập nhật mới về lịch hẹn",
          user_id: patientUserId,
          appointment_id: appointmentId,
          type,
        });
      }

      if (doctorUserId) {
        await this.createNotification({
          title: titles[type] || "Thông báo lịch hẹn",
          content: contents[type] || "Có cập nhật mới về lịch hẹn",
          user_id: doctorUserId,
          appointment_id: appointmentId,
          type,
        });
      }

      return true;
    } catch (error) {
      console.error("Lỗi tạo thông báo cuộc hẹn:", error);
      throw new Error(`Không thể tạo thông báo cuộc hẹn: ${error.message}`);
    }
  }

  static async createPaymentNotification(paymentId, userId, type) {
    try {
      if (!paymentId || !userId || !type) {
        throw new Error("Thiếu paymentId, userId hoặc type");
      }
      const [paymentRows] = await db.execute(
        `SELECT amount, payment_time, payment_method FROM payments WHERE uuid = ?`,
        [paymentId]
      );
      if (!paymentRows || paymentRows.length === 0) {
        throw new Error("Không tìm thấy thanh toán");
      }
      const payment = paymentRows[0];

      // Skip creating "payment_pending" notification for cash payments
      if (type === "payment_pending" && payment.payment_method === "cash") {
        return null; // No notification created for cash payments in pending state
      }

      const titles = {
        payment_success: "Thanh toán thành công",
        payment_pending: "Thanh toán đang chờ xử lý",
        payment_confirmed: "Thanh toán đã xác nhận",
        payment_refunded: "Hoàn tiền",
        payment_cancelled: "Thanh toán đã hủy",
      };

      const contents = {
        payment_success: `Thanh toán ${payment.amount} VNĐ vào ${payment.payment_time} đã thành công`,
        payment_pending: `Thanh toán ${payment.amount} VNĐ vào ${payment.payment_time} đang chờ xử lý`,
        payment_confirmed: `Thanh toán ${payment.amount} VNĐ vào ${payment.payment_time} đã được xác nhận`,
        payment_refunded: `Đã hoàn ${payment.amount} VNĐ vào ${payment.payment_time}`,
        payment_cancelled: `Thanh toán ${payment.amount} VNĐ vào ${payment.payment_time} đã bị hủy`,
      };

      const notificationData = {
        title: titles[type] || "Thông báo thanh toán",
        content: contents[type] || "Có cập nhật mới về thanh toán",
        user_id: userId,
        payment_id: paymentId,
        type,
      };

      return await this.createNotification(notificationData);
    } catch (error) {
      console.error("Lỗi tạo thông báo thanh toán:", error);
      throw new Error(`Không thể tạo thông báo thanh toán: ${error.message}`);
    }
  }
}

module.exports = NotificationService;
