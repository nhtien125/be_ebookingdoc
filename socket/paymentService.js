// services/paymentService.js
const db = require("../helper/database");
const { v4: uuidv4 } = require("uuid");
const Payment = require("../model/paymentModel");
const NotificationService = require("./NotificationService");

class PaymentService {
  static async getAll() {
    const [rows] = await db.execute("SELECT * FROM payments ORDER BY created_at DESC");
    return Payment.fromRows(rows);
  }

  static async getById(uuid) {
    const [rows] = await db.execute("SELECT * FROM payments WHERE uuid = ?", [uuid]);
    if (rows.length === 0) return null;
    return Payment.fromRow(rows[0]);
  }

  static async create({ user_id, appointment_id, amount, payment_method, status, payment_time }) {
    const uuid = uuidv4().replace(/-/g, "").slice(0, 32);
    await db.execute(
      `INSERT INTO payments 
      (uuid, user_id, appointment_id, amount, payment_method, status, payment_time, created_at, updated_at)
      VALUES (?, ?, ?, ?, ?, ?, ?, NOW(), NOW())`,
      [uuid, user_id, appointment_id, amount, payment_method, status, payment_time]
    );

    const paymentData = { uuid, user_id, appointment_id, amount, payment_method, status, payment_time };

    try {
      let notificationType;
      if (status === 0) notificationType = "payment_success";
      else if (status === 1) notificationType = "payment_pending";
      else if (status === 2) notificationType = "payment_confirmed";
      else if (status === 3) notificationType = "payment_refunded";
      else if (status === 4) notificationType = "payment_cancelled";

      if (notificationType) {
        await NotificationService.createPaymentNotification(uuid, user_id, notificationType);
      }
    } catch (notificationError) {
      console.error("Error creating payment notification:", notificationError);
    }

    return paymentData;
  }

  static async update(uuid, { user_id, appointment_id, amount, payment_method, status, payment_time }) {
    const oldPayment = await this.getById(uuid);

    const [result] = await db.execute(
      `UPDATE payments SET 
        user_id=?, appointment_id=?, amount=?, payment_method=?, status=?, payment_time=?, updated_at=NOW() 
      WHERE uuid=?`,
      [user_id, appointment_id, amount, payment_method, status, payment_time, uuid]
    );

    if (result.affectedRows > 0 && oldPayment && oldPayment.status !== status) {
      try {
        let notificationType;
        if (status === 0) notificationType = "payment_success";
        else if (status === 1) notificationType = "payment_pending";
        else if (status === 2) notificationType = "payment_confirmed";
        else if (status === 3) notificationType = "payment_refunded";
        else if (status === 4) notificationType = "payment_cancelled";

        if (notificationType) {
          await NotificationService.createPaymentNotification(uuid, user_id, notificationType);
        }
      } catch (notificationError) {
        console.error("Error creating payment update notification:", notificationError);
      }
    }

    return result.affectedRows > 0;
  }

  static async remove(uuid) {
    const [result] = await db.execute("DELETE FROM payments WHERE uuid = ?", [uuid]);
    return result.affectedRows > 0;
  }

  static async updateStatus(uuid, status) {
    const oldPayment = await this.getById(uuid);

    const [result] = await db.execute(
      `UPDATE payments SET status = ?, updated_at = NOW() WHERE uuid = ?`,
      [status, uuid]
    );

    if (result.affectedRows > 0 && oldPayment && oldPayment.status !== status) {
      try {
        let notificationType;
        if (status === 0) notificationType = "payment_success";
        else if (status === 1) notificationType = "payment_pending";
        else if (status === 2) notificationType = "payment_confirmed";
        else if (status === 3) notificationType = "payment_refunded";
        else if (status === 4) notificationType = "payment_cancelled";

        if (notificationType && oldPayment.user_id) {
          await NotificationService.createPaymentNotification(uuid, oldPayment.user_id, notificationType);
        }
      } catch (notificationError) {
        console.error("Error creating payment status notification:", notificationError);
      }
    }

    return result.affectedRows > 0;
  }

  static async getByUserId(userId) {
    const [rows] = await db.execute(
      `SELECT p.*, u.name AS user_name
       FROM payments p
       LEFT JOIN user u ON p.user_id = u.uuid
       WHERE p.user_id = ?
       ORDER BY p.payment_time DESC`,
      [userId]
    );
    return rows;
  }

  static async cancelUnpaidPayosPayments() {
    try {
      const [payosRows] = await db.execute(
        `SELECT * FROM payos_payments 
         WHERE status = 1 
         AND created_at < NOW() - INTERVAL 5 MINUTE`
      );

      if (payosRows.length === 0) return 0;

      const paymentIds = payosRows.map((row) => row.payment_id);
      if (paymentIds.length === 0) return 0;

      const placeholders = paymentIds.map(() => "?").join(", ");
      const [paymentInfoRows] = await db.execute(
        `SELECT uuid, user_id, appointment_id FROM payments WHERE uuid IN (${placeholders})`,
        paymentIds
      );

      await db.execute(
        `UPDATE payos_payments SET status = 4 WHERE payment_id IN (${placeholders})`,
        paymentIds
      );
      await db.execute(
        `UPDATE payments SET status = 4 WHERE uuid IN (${placeholders}) AND status = 1`,
        paymentIds
      );

      const [paymentRows] = await db.execute(
        `SELECT appointment_id FROM payments WHERE uuid IN (${placeholders}) AND appointment_id IS NOT NULL`,
        paymentIds
      );
      const appointmentIds = paymentRows.map((row) => row.appointment_id);

      if (appointmentIds.length > 0) {
        const apptPlaceholders = appointmentIds.map(() => "?").join(", ");
        await db.execute(
          `UPDATE appointments SET status = 4 WHERE uuid IN (${apptPlaceholders})`,
          appointmentIds
        );

        for (const appointmentId of appointmentIds) {
          const [appointmentRows] = await db.execute(
            `SELECT user_id, doctor_id FROM appointments WHERE uuid = ?`,
            [appointmentId]
          );
          if (appointmentRows.length > 0) {
            const { user_id, doctor_id } = appointmentRows[0];
            if (user_id) {
              await NotificationService.createAppointmentNotification(
                appointmentId,
                user_id,
                null,
                "appointment_cancelled"
              );
            }
            if (doctor_id) {
              await NotificationService.createAppointmentNotification(
                appointmentId,
                null,
                doctor_id,
                "appointment_cancelled"
              );
            }
          }
        }
      }

      for (const paymentInfo of paymentInfoRows) {
        try {
          await NotificationService.createPaymentNotification(
            paymentInfo.uuid,
            paymentInfo.user_id,
            "payment_cancelled"
          );
        } catch (notificationError) {
          console.error(`Error sending cancellation notification for payment ${paymentInfo.uuid}:`, notificationError);
        }
      }

      return paymentIds.length;
    } catch (error) {
      console.error("Error checking and updating payments:", error);
      return 0;
    }
  }

  static async getByAppointmentId(appointmentId) {
    const [rows] = await db.execute(
      `SELECT p.*, u.name AS user_name
       FROM payments p
       LEFT JOIN user u ON p.user_id = u.uuid
       WHERE p.appointment_id = ?
       ORDER BY p.payment_time DESC`,
      [appointmentId]
    );
    return Payment.fromRows(rows);
  }

  static async handlePaymentSuccess(paymentData) {
    try {
      const { uuid, user_id } = paymentData;
      await this.updateStatus(uuid, 0);
      await NotificationService.createPaymentNotification(uuid, user_id, "payment_success");
      return { success: true, message: "Payment processed successfully" };
    } catch (error) {
      console.error("Error handling payment success:", error);
      throw error;
    }
  }

  static async handlePaymentFailure(paymentData) {
    try {
      const { uuid, user_id } = paymentData;
      await this.updateStatus(uuid, 4);
      await NotificationService.createPaymentNotification(uuid, user_id, "payment_cancelled");
      return { success: false, message: "Payment failed" };
    } catch (error) {
      console.error("Error handling payment failure:", error);
      throw error;
    }
  }

  static async processRefund(paymentData) {
    try {
      const { uuid, user_id } = paymentData;
      await this.updateStatus(uuid, 3);
      await NotificationService.createPaymentNotification(uuid, user_id, "payment_refunded");
      return { success: true, message: "Refund processed successfully" };
    } catch (error) {
      console.error("Error processing refund:", error);
      throw error;
    }
  }
}

module.exports = PaymentService;