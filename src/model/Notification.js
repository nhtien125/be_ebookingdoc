
const db = require("../helper/database");

class Notification {
  static async findByUserId(userId, page = 1, limit = 20) {
    try {
      const offset = (page - 1) * limit;
      const [rows] = await db.execute(
        `SELECT uuid, title, content, user_id, doctor_id, appointment_id, payment_id, type, is_read, created_at
         FROM notifications
         WHERE user_id = ?
         ORDER BY created_at DESC
         LIMIT ? OFFSET ?`,
        [userId, limit, offset]
      );
      return rows;
    } catch (error) {
      console.error("Lỗi findByUserId:", error);
      throw error;
    }
  }

  static async countByUserId(userId) {
    try {
      const [rows] = await db.execute(
        `SELECT COUNT(*) as count FROM notifications WHERE user_id = ?`,
        [userId]
      );
      return rows[0].count || 0;
    } catch (error) {
      console.error("Lỗi countByUserId:", error);
      throw error;
    }
  }

  static async countUnreadByUserId(userId) {
    try {
      const [rows] = await db.execute(
        `SELECT COUNT(*) as count FROM notifications WHERE user_id = ? AND is_read = 0`,
        [userId]
      );
      return rows[0].count || 0;
    } catch (error) {
      console.error("Lỗi countUnreadByUserId:", error);
      throw error;
    }
  }

  static async create(data) {
    try {
      const { uuid, title, content, user_id, doctor_id, appointment_id, payment_id, type, is_read, created_at } = data;
      const [result] = await db.execute(
        `INSERT INTO notifications (uuid, title, content, user_id, doctor_id, appointment_id, payment_id, type, is_read, created_at)
         VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)`,
        [uuid, title, content, user_id, doctor_id, appointment_id, payment_id, type, is_read, created_at]
      );
      return { ...data, id: result.insertId };
    } catch (error) {
      console.error("Lỗi create:", error);
      throw error;
    }
  }

  static async markAsRead(notificationId) {
    try {
      const [result] = await db.execute(
        `UPDATE notifications SET is_read = 1 WHERE uuid = ?`,
        [notificationId]
      );
      return result.affectedRows > 0;
    } catch (error) {
      console.error("Lỗi markAsRead:", error);
      throw error;
    }
  }

  static async markAllAsReadByUserId(userId) {
    try {
      const [result] = await db.execute(
        `UPDATE notifications SET is_read = 1 WHERE user_id = ? AND is_read = 0`,
        [userId]
      );
      return result.affectedRows;
    } catch (error) {
      console.error("Lỗi markAllAsReadByUserId:", error);
      throw error;
    }
  }

  static async deleteById(notificationId) {
    try {
      const [result] = await db.execute(
        `DELETE FROM notifications WHERE uuid = ?`,
        [notificationId]
      );
      return result.affectedRows > 0;
    } catch (error) {
      console.error("Lỗi deleteById:", error);
      throw error;
    }
  }
}

module.exports = Notification;