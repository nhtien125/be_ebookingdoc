// services/SocketService.js
class SocketService {
  constructor(io) {
    this.io = io;
    this.userSockets = new Map(); // Lưu mapping userId -> socketId
    this.setupSocketHandlers();
  }

  setupSocketHandlers() {
    this.io.on('connection', (socket) => {
      console.log('User connected:', socket.id);

      // User join room với userId
      socket.on('join', (userId) => {
        socket.join(`user-${userId}`);
        this.userSockets.set(userId, socket.id);
        console.log(`User ${userId} joined room user-${userId}`);
      });

      socket.on('disconnect', () => {
        // Remove user from userSockets map
        for (let [userId, socketId] of this.userSockets.entries()) {
          if (socketId === socket.id) {
            this.userSockets.delete(userId);
            break;
          }
        }
        console.log('User disconnected:', socket.id);
      });
    });
  }

  // Gửi thông báo cho một user cụ thể
  sendNotificationToUser(userId, notification) {
    this.io.to(`user-${userId}`).emit('new-notification', notification);
  }

  // Gửi thông báo cho tất cả users
  sendNotificationToAll(notification) {
    this.io.emit('new-notification', notification);
  }

  // Kiểm tra user có online không
  isUserOnline(userId) {
    return this.userSockets.has(userId);
  }

  // Lấy danh sách users online
  getOnlineUsers() {
    return Array.from(this.userSockets.keys());
  }
}

module.exports = SocketService;