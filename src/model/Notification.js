// models/Notification.js
const pool = require('../helper/database');

class Notification {
  constructor(data) {
    this.uuid = data.uuid;
    this.title = data.title;
    this.content = data.content;
    this.created_at = data.created_at;
    this.status = data.status;
    this.user_id = data.user_id;
    this.doctor_id = data.doctor_id;
    this.appointment_id = data.appointment_id;
    this.payment_id = data.payment_id;
  }

  // Lấy thông báo theo user ID
  static async findByUserId(userId, page = 1, limit = 20) {
    const offset = (page - 1) * limit;
    
    const [notifications] = await pool.execute(
      `SELECT * FROM notifications 
       WHERE user_id = ? OR doctor_id = ? 
       ORDER BY created_at DESC 
       LIMIT ? OFFSET ?`,
      [userId, userId, parseInt(limit), offset]
    );

    return notifications.map(notification => new Notification(notification));
  }

  // Đếm tổng số thông báo
  static async countByUserId(userId) {
    const [result] = await pool.execute(
      `SELECT COUNT(*) as total FROM notifications 
       WHERE user_id = ? OR doctor_id = ?`,
      [userId, userId]
    );
    return result[0].total;
  }

  // Đếm số thông báo chưa đọc
  static async countUnreadByUserId(userId) {
    const [result] = await pool.execute(
      `SELECT COUNT(*) as count FROM notifications 
       WHERE (user_id = ? OR doctor_id = ?) AND status = 1`,
      [userId, userId]
    );
    return result[0].count;
  }

  // Tạo thông báo mới
  static async create(data) {
    const [result] = await pool.execute(
      `INSERT INTO notifications 
       (uuid, title, content, user_id, doctor_id, appointment_id, payment_id, created_at, status) 
       VALUES (?, ?, ?, ?, ?, ?, ?, ?, 1)`,
      [
        data.uuid,
        data.title,
        data.content,
        data.user_id,
        data.doctor_id,
        data.appointment_id,
        data.payment_id,
        data.created_at
      ]
    );

    return new Notification({
      ...data,
      status: 1
    });
  }

  // Đánh dấu đã đọc
  static async markAsRead(notificationId) {
    const [result] = await pool.execute(
      'UPDATE notifications SET status = 0 WHERE uuid = ?',
      [notificationId]
    );
    return result.affectedRows > 0;
  }

  // Đánh dấu tất cả đã đọc
  static async markAllAsReadByUserId(userId) {
    const [result] = await pool.execute(
      'UPDATE notifications SET status = 0 WHERE user_id = ? OR doctor_id = ?',
      [userId, userId]
    );
    return result.affectedRows;
  }

  // Tìm theo ID
  static async findById(notificationId) {
    const [result] = await pool.execute(
      'SELECT * FROM notifications WHERE uuid = ?',
      [notificationId]
    );
    
    if (result.length > 0) {
      return new Notification(result[0]);
    }
    return null;
  }

  // Xóa thông báo
  static async deleteById(notificationId) {
    const [result] = await pool.execute(
      'DELETE FROM notifications WHERE uuid = ?',
      [notificationId]
    );
    return result.affectedRows > 0;
  }
}

module.exports = Notification;