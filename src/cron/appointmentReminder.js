// src/cron/appointmentReminder.js
const cron = require('node-cron');
const db = require('../helper/database');
const NotificationService = require('../service/NotificationService');

class AppointmentReminderCron {
  
  // Chạy mỗi 15 phút để kiểm tra appointments sắp tới
  static start() {
    cron.schedule('*/15 * * * *', async () => {
      console.log('Checking for upcoming appointments...');
      
      try {
        const upcomingAppointments = await this.getUpcomingAppointments();
        
        for (const appointment of upcomingAppointments) {
          // Tạo thông báo nhắc nhở cho user
          if (appointment.user_id) {
            await NotificationService.createAppointmentNotification(
              appointment.uuid,
              appointment.user_id,
              null,
              'appointment_reminder'
            );
          }
          
          // Tạo thông báo nhắc nhở cho doctor
          if (appointment.doctor_id) {
            await NotificationService.createAppointmentNotification(
              appointment.uuid,
              null,
              appointment.doctor_id,
              'appointment_reminder'
            );
          }
          
          // Đánh dấu đã gửi reminder
          await this.markReminderSent(appointment.uuid);
        }
        
        if (upcomingAppointments.length > 0) {
          console.log(`Created ${upcomingAppointments.length} reminder notifications`);
        }
      } catch (error) {
        console.error('Error in appointment reminder cron:', error);
      }
    });
    
    console.log('Appointment reminder cron job started');
  }
  
  // Lấy appointments sắp tới trong 30 phút và chưa gửi reminder
  static async getUpcomingAppointments() {
    try {
      const thirtyMinutesFromNow = new Date(Date.now() + 30 * 60 * 1000);
      const now = new Date();
      
      const query = `
        SELECT a.uuid, a.user_id, a.doctor_id, a.date, s.start_time, s.work_date
        FROM appointments a
        LEFT JOIN schedules s ON a.schedule_id = s.uuid
        WHERE a.status = 'confirmed' 
        AND a.reminder_sent = 0
        AND (
          (a.date IS NOT NULL AND a.date BETWEEN ? AND ?) OR
          (s.work_date IS NOT NULL AND s.start_time IS NOT NULL AND 
           STR_TO_DATE(CONCAT(s.work_date, ' ', s.start_time), '%Y-%m-%d %H:%i:%s') BETWEEN ? AND ?)
        )
      `;
      
      const [appointments] = await db.execute(query, [
        now.toISOString().slice(0, 19).replace('T', ' '),
        thirtyMinutesFromNow.toISOString().slice(0, 19).replace('T', ' '),
        now.toISOString().slice(0, 19).replace('T', ' '),
        thirtyMinutesFromNow.toISOString().slice(0, 19).replace('T', ' ')
      ]);
      
      return appointments;
    } catch (error) {
      console.error('Error getting upcoming appointments:', error);
      return [];
    }
  }
  
  // Đánh dấu đã gửi reminder
  static async markReminderSent(appointmentUuid) {
    try {
      await db.execute(
        'UPDATE appointments SET reminder_sent = 1 WHERE uuid = ?',
        [appointmentUuid]
      );
    } catch (error) {
      console.error('Error marking reminder sent:', error);
    }
  }
}

module.exports = AppointmentReminderCron;