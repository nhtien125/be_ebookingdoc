// services/SocketService.js
class SocketService {
  constructor(io) {
    this.io = io;
    this.userSockets = new Map();
    this.setupSocketHandlers();
  }

  setupSocketHandlers() {
    this.io.on('connection', (socket) => {
      console.log('User connected:', socket.id);

      socket.on('join', (userId) => {
        socket.join(`user-${userId}`);
        this.userSockets.set(userId, socket.id);
        console.log(`User ${userId} joined room user-${userId}`);
      });

      socket.on('disconnect', () => {
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

  sendNotificationToUser(userId, notification) {
    this.io.to(`user-${userId}`).emit('new-notification', notification);
  }

  sendNotificationToAll(notification) {
    this.io.emit('new-notification', notification);
  }

  isUserOnline(userId) {
    return this.userSockets.has(userId);
  }

  getOnlineUsers() {
    return Array.from(this.userSockets.keys());
  }
}

module.exports = SocketService;