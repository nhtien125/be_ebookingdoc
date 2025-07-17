// controllers/NotificationController.js
const NotificationService = require('../service/NotificationService');

class NotificationController {
  constructor(socketService) {
    this.socketService = socketService;
  }

  // GET /api/notifications
  async getNotifications(req, res) {
    try {
      const { user_id, page = 1, limit = 20 } = req.query;

      if (!user_id) {
        return res.status(400).json({
          success: false,
          message: 'user_id is required'
        });
      }

      const result = await NotificationService.getNotifications(user_id, page, limit);

      res.json({
        success: true,
        data: result.notifications,
        pagination: result.pagination
      });
    } catch (error) {
      console.error('Error in getNotifications:', error);
      res.status(500).json({
        success: false,
        message: error.message
      });
    }
  }

  // POST /api/notifications
  async createNotification(req, res) {
    try {
      const {
        title,
        content,
        user_id,
        doctor_id,
        appointment_id,
        payment_id
      } = req.body;

      if (!title || !content) {
        return res.status(400).json({
          success: false,
          message: 'title and content are required'
        });
      }

      if (!user_id && !doctor_id) {
        return res.status(400).json({
          success: false,
          message: 'user_id or doctor_id is required'
        });
      }

      const notification = await NotificationService.createNotification({
        title,
        content,
        user_id,
        doctor_id,
        appointment_id,
        payment_id
      });

      // Gửi real-time notification
      const targetUserId = user_id || doctor_id;
      if (targetUserId) {
        this.socketService.sendNotificationToUser(targetUserId, notification);
      }

      res.json({
        success: true,
        data: notification
      });
    } catch (error) {
      console.error('Error in createNotification:', error);
      res.status(500).json({
        success: false,
        message: error.message
      });
    }
  }

  // POST /api/notifications/mark-read
  async markAsRead(req, res) {
    try {
      const { notification_id } = req.body;

      if (!notification_id) {
        return res.status(400).json({
          success: false,
          message: 'notification_id is required'
        });
      }

      await NotificationService.markAsRead(notification_id);

      res.json({
        success: true,
        message: 'Notification marked as read'
      });
    } catch (error) {
      console.error('Error in markAsRead:', error);
      if (error.message.includes('not found')) {
        return res.status(404).json({
          success: false,
          message: error.message
        });
      }
      res.status(500).json({
        success: false,
        message: error.message
      });
    }
  }

  // POST /api/notifications/mark-all-read
  async markAllAsRead(req, res) {
    try {
      const { user_id } = req.body;

      if (!user_id) {
        return res.status(400).json({
          success: false,
          message: 'user_id is required'
        });
      }

      const affectedRows = await NotificationService.markAllAsRead(user_id);

      res.json({
        success: true,
        message: 'All notifications marked as read',
        affected_rows: affectedRows
      });
    } catch (error) {
      console.error('Error in markAllAsRead:', error);
      res.status(500).json({
        success: false,
        message: error.message
      });
    }
  }

  // GET /api/notifications/unread-count
  async getUnreadCount(req, res) {
    try {
      const { user_id } = req.query;

      if (!user_id) {
        return res.status(400).json({
          success: false,
          message: 'user_id is required'
        });
      }

      const count = await NotificationService.getUnreadCount(user_id);

      res.json({
        success: true,
        unread_count: count
      });
    } catch (error) {
      console.error('Error in getUnreadCount:', error);
      res.status(500).json({
        success: false,
        message: error.message
      });
    }
  }

  // DELETE /api/notifications/:id
  async deleteNotification(req, res) {
    try {
      const { id } = req.params;

      if (!id) {
        return res.status(400).json({
          success: false,
          message: 'notification id is required'
        });
      }

      await NotificationService.deleteNotification(id);

      res.json({
        success: true,
        message: 'Notification deleted successfully'
      });
    } catch (error) {
      console.error('Error in deleteNotification:', error);
      if (error.message.includes('not found')) {
        return res.status(404).json({
          success: false,
          message: error.message
        });
      }
      res.status(500).json({
        success: false,
        message: error.message
      });
    }
  }
}

module.exports = NotificationController;