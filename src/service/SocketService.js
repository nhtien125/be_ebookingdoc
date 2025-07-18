// src/service/SocketService.js
class SocketService {
  constructor(io) {
    this.io = io;
    this.userSockets = new Map();
    this.setupSocketHandlers();
  }

  setupSocketHandlers() {
    this.io.on("connection", (socket) => {
      console.log("User connected:", socket.id);

      // Khi client gửi sự kiện join với userId
      socket.on("join", (userId) => {
        // Cho user join phòng riêng, phòng tên 'user-{userId}'
        socket.join(`user-${userId}`);
        this.userSockets.set(userId, socket.id);
        console.log(`User ${userId} joined room user-${userId}`);
      });

      socket.on("disconnect", () => {
        for (let [userId, socketId] of this.userSockets.entries()) {
          if (socketId === socket.id) {
            this.userSockets.delete(userId);
            break;
          }
        }
        console.log("User disconnected:", socket.id);
      });
    });
  }

  // Gửi notification cho đúng user qua phòng user-{userId}
  sendNotificationToUser(userId, notification) {
    this.io.to(`user-${userId}`).emit("new-notification", notification);
  }

  // Broadcast notification cho tất cả user (ít dùng, thường chỉ cho admin)
  sendNotificationToAll(notification) {
    this.io.emit("new-notification", notification);
  }

  // Check user có online không
  isUserOnline(userId) {
    return this.userSockets.has(userId);
  }

  // Lấy list user đang online
  getOnlineUsers() {
    return Array.from(this.userSockets.keys());
  }
}

module.exports = SocketService;
