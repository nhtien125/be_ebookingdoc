// src/controller/notificationController.js
const NotificationService = require("../service/NotificationService");

exports.getNotifications = async (req, res) => {
  try {
    const { userId, page, limit } = req.query;
    const result = await NotificationService.getNotifications(userId, page, limit);
    res.status(200).json(result);
  } catch (error) {
    console.error("Lỗi trong getNotifications:", error);
    res.status(500).json({ message: error.message });
  }
};

exports.createNotification = async (req, res) => {
  try {
    const notification = await NotificationService.createNotification(req.body);
    res.status(201).json({ data: notification });
  } catch (error) {
    console.error("Lỗi trong createNotification:", error);
    res.status(500).json({ message: error.message });
  }
};

exports.markAsRead = async (req, res) => {
  try {
    await NotificationService.markAsRead(req.params.notificationId);
    res.status(200).json({ message: "Đánh dấu đã đọc thành công" });
  } catch (error) {
    console.error("Lỗi trong markAsRead:", error);
    res.status(500).json({ message: error.message });
  }
};

exports.markAllAsRead = async (req, res) => {
  try {
    await NotificationService.markAllAsRead(req.params.userId);
    res.status(200).json({ message: "Đánh dấu tất cả đã đọc thành công" });
  } catch (error) {
    console.error("Lỗi trong markAllAsRead:", error);
    res.status(500).json({ message: error.message });
  }
};

exports.getUnreadCount = async (req, res) => {
  try {
    const result = await NotificationService.getUnreadCount(req.params.userId);
    res.status(200).json(result);
  } catch (error) {
    console.error("Lỗi trong getUnreadCount:", error);
    res.status(500).json({ message: error.message });
  }
};

exports.deleteNotification = async (req, res) => {
  try {
    await NotificationService.deleteNotification(req.params.notificationId);
    res.status(200).json({ message: "Xóa thông báo thành công" });
  } catch (error) {
    console.error("Lỗi trong deleteNotification:", error);
    res.status(500).json({ message: error.message });
  }
};