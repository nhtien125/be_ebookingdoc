// src/cron/appointmentReminder.js
const cron = require("node-cron");
const db = require("../helper/database");
const NotificationService = require("../service/NotificationService");

class AppointmentReminderCron {
  static start() {
    cron.schedule("*/15 * * * *", async () => {
      console.log("Checking for upcoming appointments...");

      try {
        const upcomingAppointments = await this.getUpcomingAppointments();

        for (const appointment of upcomingAppointments) {
          if (appointment.user_id) {
            await NotificationService.createAppointmentNotification(
              appointment.uuid,
              appointment.user_id,
              null,
              "appointment_reminder"
            );
          }

          if (appointment.doctor_id) {
            await NotificationService.createAppointmentNotification(
              appointment.uuid,
              null,
              appointment.doctor_id,
              "appointment_reminder"
            );
          }

          await this.markReminderSent(appointment.uuid);
        }

        if (upcomingAppointments.length > 0) {
          console.log(
            `Created ${upcomingAppointments.length} reminder notifications`
          );
        }
      } catch (error) {
        console.error("Error in appointment reminder cron:", error);
      }
    });

    console.log("Appointment reminder cron job started");
  }

  static async getUpcomingAppointments(startDate, endDate) {
    const [rows] = await db.execute(
      `SELECT a.uuid, a.user_id, a.doctor_id, a.date, s.start_time, s.work_date
       FROM appointments a
       LEFT JOIN schedules s ON a.schedule_id = s.uuid
       WHERE a.status = 2
       AND a.reminder_sent = 0
       AND (
         (a.date IS NOT NULL AND a.date BETWEEN ? AND ?) OR
         (s.work_date IS NOT NULL AND s.start_time IS NOT NULL AND 
          STR_TO_DATE(CONCAT(s.work_date, ' ', s.start_time), '%Y-%m-%d %H:%i:%s') BETWEEN ? AND ?)
       )`,
      [startDate, endDate, startDate, endDate]
    );
    return rows;
  }

  static async markReminderSent(appointmentUuid) {
    try {
      await db.execute(
        "UPDATE appointments SET reminder_sent = 1 WHERE uuid = ?",
        [appointmentUuid]
      );
    } catch (error) {
      console.error("Error marking reminder sent:", error);
    }
  }
}

module.exports = AppointmentReminderCron;
