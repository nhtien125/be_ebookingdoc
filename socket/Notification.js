// src/model/Notification.js
const db = require("../helper/database");

class Notification {
  static async findByUserId(userId, page, limit) {
    try {
      if (!userId) throw new Error("Thiếu userId");
      const offset = (page - 1) * limit;
      const [rows] = await db.execute(
        `SELECT * FROM notifications WHERE user_id = ? ORDER BY created_at DESC LIMIT ? OFFSET ?`,
        [userId, parseInt(limit), parseInt(offset)]
      );
      return rows;
    } catch (error) {
      console.error('Lỗi lấy thông báo theo userId:', error);
      throw error;
    }
  }

  static async countByUserId(userId) {
    try {
      if (!userId) throw new Error("Thiếu userId");
      const [rows] = await db.execute(
        `SELECT COUNT(*) as count FROM notifications WHERE user_id = ?`,
        [userId]
      );
      return rows[0].count;
    } catch (error) {
      console.error('Lỗi đếm thông báo:', error);
      throw error;
    }
  }

  static async countUnreadByUserId(userId) {
    try {
      if (!userId) throw new Error("Thiếu userId");
      const [rows] = await db.execute(
        `SELECT COUNT(*) as count FROM notifications WHERE user_id = ? AND is_read = 0`,
        [userId]
      );
      return rows[0].count;
    } catch (error) {
      console.error('Lỗi đếm thông báo chưa đọc:', error);
      throw error;
    }
  }

  static async create(data) {
    try {
      const [result] = await db.execute(
        `INSERT INTO notifications 
         (uuid, user_id, doctor_id, appointment_id, payment_id, type, title, content, is_read, created_at)
         VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)`,
        [
          data.uuid,
          data.user_id,
          data.doctor_id || null,
          data.appointment_id || null,
          data.payment_id || null,
          data.type,
          data.title,
          data.content || null,
          data.is_read,
          data.created_at,
        ]
      );
      return { ...data, id: result.insertId };
    } catch (error) {
      console.error('Lỗi tạo thông báo:', error);
      throw error;
    }
  }

  static async markAsRead(notificationId) {
    try {
      if (!notificationId) throw new Error("Thiếu notificationId");
      const [result] = await db.execute(
        `UPDATE notifications SET is_read = 1 WHERE uuid = ?`,
        [notificationId]
      );
      return result.affectedRows > 0;
    } catch (error) {
      console.error('Lỗi đánh dấu đã đọc:', error);
      throw error;
    }
  }

  static async markAllAsReadByUserId(userId) {
    try {
      if (!userId) throw new Error("Thiếu userId");
      const [result] = await db.execute(
        `UPDATE notifications SET is_read = 1 WHERE user_id = ?`,
        [userId]
      );
      return result.affectedRows;
    } catch (error) {
      console.error('Lỗi đánh dấu tất cả đã đọc:', error);
      throw error;
    }
  }

  static async deleteById(notificationId) {
    try {
      if (!notificationId) throw new Error("Thiếu notificationId");
      const [result] = await db.execute(
        `DELETE FROM notifications WHERE uuid = ?`,
        [notificationId]
      );
      return result.affectedRows > 0;
    } catch (error) {
      console.error('Lỗi xóa thông báo:', error);
      throw error;
    }
  }
}

module.exports = Notification;