// src/service/NotificationService.js
const Notification = require("../model/Notification");
const { v4: uuidv4 } = require("uuid");
const db = require("../helper/database");
const { socketService } = require("../../index");

class NotificationService {
  static async getNotifications(userId, page = 1, limit = 20) {
    try {
      if (!userId) throw new Error("Thiếu userId");
      const notifications = await Notification.findByUserId(userId, page, limit);
      const total = await Notification.countByUserId(userId);
      const totalPages = Math.ceil(total / limit);

      return {
        notifications,
        pagination: {
          current_page: parseInt(page),
          total_pages: totalPages,
          total_items: total,
          has_more: page < totalPages,
        },
      };
    } catch (error) {
      console.error('Lỗi lấy thông báo:', error);
      throw new Error(`Không thể lấy thông báo: ${error.message}`);
    }
  }

  static async createNotification(data) {
    try {
      if (!data.user_id || !data.title || !data.type) {
        throw new Error("Thiếu user_id, title hoặc type");
      }

      // Kiểm tra doctor_id tồn tại trong bảng user
      let doctorId = null;
      if (data.doctor_id) {
        const [user] = await db.execute('SELECT uuid FROM user WHERE uuid = ?', [data.doctor_id]);
        if (user.length > 0) {
          doctorId = data.doctor_id;
        }
      }

      const uuid = uuidv4().replace(/-/g, "");
      const created_at = new Date();

      const notificationData = {
        uuid,
        title: data.title,
        content: data.content || null,
        user_id: data.user_id,
        doctor_id: doctorId,
        appointment_id: data.appointment_id || null,
        payment_id: data.payment_id || null,
        type: data.type,
        is_read: 0,
        created_at,
      };

      const notification = await Notification.create(notificationData);

      // Kiểm tra socketService trước khi gửi
      if (socketService && typeof socketService.sendNotificationToUser === 'function') {
        if (data.user_id) socketService.sendNotificationToUser(data.user_id, notification);
        if (doctorId) socketService.sendNotificationToUser(doctorId, notification);
      } else {
        console.warn('socketService chưa được khởi tạo, không gửi thông báo qua Socket.IO');
      }

      return notification;
    } catch (error) {
      console.error('Lỗi tạo thông báo:', error);
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
      console.error('Lỗi đánh dấu đã đọc:', error);
      throw new Error(`Không thể đánh dấu thông báo đã đọc: ${error.message}`);
    }
  }

  static async markAllAsRead(userId) {
    try {
      if (!userId) throw new Error("Thiếu userId");
      const affectedRows = await Notification.markAllAsReadByUserId(userId);
      return affectedRows;
    } catch (error) {
      console.error('Lỗi đánh dấu tất cả đã đọc:', error);
      throw new Error(`Không thể đánh dấu tất cả thông báo đã đọc: ${error.message}`);
    }
  }

  static async getUnreadCount(userId) {
    try {
      if (!userId) throw new Error("Thiếu userId");
      const count = await Notification.countUnreadByUserId(userId);
      return count;
    } catch (error) {
      console.error('Lỗi lấy số thông báo chưa đọc:', error);
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
      console.error('Lỗi xóa thông báo:', error);
      throw new Error(`Không thể xóa thông báo: ${error.message}`);
    }
  }

  static async createAppointmentNotification(appointmentId, userId, doctorId, type) {
    try {
      if (!appointmentId || !userId || !type) throw new Error("Thiếu appointmentId, userId hoặc type");

      const [appointmentRows] = await db.execute(
        `SELECT a.date, a.status, s.start_time, s.work_date, u.name AS patient_name, d.name AS doctor_name
         FROM appointments a
         LEFT JOIN schedules s ON a.schedule_id = s.uuid
         LEFT JOIN user u ON a.user_id = u.uuid
         LEFT JOIN user d ON a.doctor_id = d.uuid
         WHERE a.uuid = ?`,
        [appointmentId]
      );

      if (appointmentRows.length === 0) throw new Error("Không tìm thấy cuộc hẹn");

      const appointment = appointmentRows[0];
      const appointmentTime = appointment.start_time
        ? `${appointment.work_date} ${appointment.start_time}`
        : appointment.date;

      const titles = {
        appointment_created: "Lịch hẹn mới",
        appointment_confirmed: "Lịch hẹn đã xác nhận",
        appointment_cancelled: "Lịch hẹn đã hủy",
        appointment_rejected: "Lịch hẹn bị từ chối",
        appointment_reminder: "Nhắc nhở lịch hẹn",
      };

      const contents = {
        appointment_created: `Bạn có lịch hẹn mới với ${appointment.doctor_name || "bác sĩ"} vào ${appointmentTime}`,
        appointment_confirmed: `Lịch hẹn với ${appointment.doctor_name || "bác sĩ"} vào ${appointmentTime} đã được xác nhận`,
        appointment_cancelled: `Lịch hẹn với ${appointment.doctor_name || "bác sĩ"} vào ${appointmentTime} đã bị hủy`,
        appointment_rejected: `Lịch hẹn với ${appointment.doctor_name || "bác sĩ"} vào ${appointmentTime} đã bị từ chối`,
        appointment_reminder: `Bạn có lịch hẹn với ${appointment.doctor_name || "bác sĩ"} vào ${appointmentTime} trong 30 phút tới`,
      };

      const notificationData = {
        title: titles[type] || "Thông báo lịch hẹn",
        content: contents[type] || "Có cập nhật mới về lịch hẹn",
        user_id: userId,
        doctor_id: doctorId || null,
        appointment_id: appointmentId,
        type,
      };

      return await this.createNotification(notificationData);
    } catch (error) {
      console.error('Lỗi tạo thông báo cuộc hẹn:', error);
      throw new Error(`Không thể tạo thông báo cuộc hẹn: ${error.message}`);
    }
  }

  static async createPaymentNotification(paymentId, userId, type) {
    try {
      if (!paymentId || !userId || !type) throw new Error("Thiếu paymentId, userId hoặc type");

      const [paymentRows] = await db.execute(
        `SELECT amount, payment_time FROM payments WHERE uuid = ?`,
        [paymentId]
      );

      if (paymentRows.length === 0) throw new Error("Không tìm thấy thanh toán");

      const payment = paymentRows[0];

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
      console.error('Lỗi tạo thông báo thanh toán:', error);
      throw new Error(`Không thể tạo thông báo thanh toán: ${error.message}`);
    }
  }
}

module.exports = NotificationService;