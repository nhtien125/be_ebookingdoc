// services/NotificationService.js
const Notification = require('../model/Notification');
const { v4: uuidv4 } = require('uuid');

class NotificationService {
  // Lấy danh sách thông báo
  static async getNotifications(userId, page = 1, limit = 20) {
    try {
      const notifications = await Notification.findByUserId(userId, page, limit);
      const total = await Notification.countByUserId(userId);
      const totalPages = Math.ceil(total / limit);

      return {
        notifications,
        pagination: {
          current_page: parseInt(page),
          total_pages: totalPages,
          total_items: total,
          has_more: page < totalPages
        }
      };
    } catch (error) {
      throw new Error(`Failed to get notifications: ${error.message}`);
    }
  }

  // Tạo thông báo mới
  static async createNotification(data) {
    try {
      const uuid = uuidv4().replace(/-/g, '');
      const created_at = new Date();

      const notificationData = {
        uuid,
        title: data.title,
        content: data.content,
        user_id: data.user_id,
        doctor_id: data.doctor_id,
        appointment_id: data.appointment_id,
        payment_id: data.payment_id,
        created_at
      };

      const notification = await Notification.create(notificationData);
      return notification;
    } catch (error) {
      throw new Error(`Failed to create notification: ${error.message}`);
    }
  }

  // Đánh dấu đã đọc
  static async markAsRead(notificationId) {
    try {
      const success = await Notification.markAsRead(notificationId);
      if (!success) {
        throw new Error('Notification not found');
      }
      return true;
    } catch (error) {
      throw new Error(`Failed to mark notification as read: ${error.message}`);
    }
  }

  // Đánh dấu tất cả đã đọc
  static async markAllAsRead(userId) {
    try {
      const affectedRows = await Notification.markAllAsReadByUserId(userId);
      return affectedRows;
    } catch (error) {
      throw new Error(`Failed to mark all notifications as read: ${error.message}`);
    }
  }

  // Đếm số thông báo chưa đọc
  static async getUnreadCount(userId) {
    try {
      const count = await Notification.countUnreadByUserId(userId);
      return count;
    } catch (error) {
      throw new Error(`Failed to get unread count: ${error.message}`);
    }
  }

  // Xóa thông báo
  static async deleteNotification(notificationId) {
    try {
      const success = await Notification.deleteById(notificationId);
      if (!success) {
        throw new Error('Notification not found');
      }
      return true;
    } catch (error) {
      throw new Error(`Failed to delete notification: ${error.message}`);
    }
  }

  // Tạo thông báo cho appointment
  static async createAppointmentNotification(appointmentId, userId, doctorId, type) {
    const titles = {
      'appointment_created': 'Lịch hẹn mới',
      'appointment_confirmed': 'Lịch hẹn đã xác nhận',
      'appointment_cancelled': 'Lịch hẹn đã hủy',
      'appointment_reminder': 'Nhắc nhở lịch hẹn'
    };

    const contents = {
      'appointment_created': 'Bạn có lịch hẹn mới vào lúc',
      'appointment_confirmed': 'Lịch hẹn của bạn đã được xác nhận',
      'appointment_cancelled': 'Lịch hẹn của bạn đã bị hủy',
      'appointment_reminder': 'Bạn có lịch hẹn trong 30 phút tới'
    };

    const notificationData = {
      title: titles[type],
      content: contents[type],
      user_id: userId,
      doctor_id: doctorId,
      appointment_id: appointmentId
    };

    return await this.createNotification(notificationData);
  }

  // Tạo thông báo cho payment
  static async createPaymentNotification(paymentId, userId, type) {
    const titles = {
      'payment_success': 'Thanh toán thành công',
      'payment_failed': 'Thanh toán thất bại',
      'payment_refund': 'Hoàn tiền'
    };

    const contents = {
      'payment_success': 'Thanh toán của bạn đã được xử lý thành công',
      'payment_failed': 'Thanh toán của bạn không thành công',
      'payment_refund': 'Bạn đã được hoàn tiền'
    };

    const notificationData = {
      title: titles[type],
      content: contents[type],
      user_id: userId,
      payment_id: paymentId
    };

    return await this.createNotification(notificationData);
  }
}

module.exports = NotificationService;