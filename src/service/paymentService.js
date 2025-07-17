const db = require("../helper/database");
const { v4: uuidv4 } = require("uuid");
const Payment = require("../model/paymentModel");
const NotificationService = require("./NotificationService");

class PaymentService {
  // Lấy tất cả thanh toán
  static async getAll() {
    const [rows] = await db.execute(
      "SELECT * FROM payments ORDER BY created_at DESC"
    );
    return Payment.fromRows(rows);
  }

  // Lấy thanh toán theo UUID
  static async getById(uuid) {
    const [rows] = await db.execute("SELECT * FROM payments WHERE uuid = ?", [
      uuid,
    ]);
    if (rows.length === 0) return null;
    return Payment.fromRow(rows[0]);
  }

  // Tạo thanh toán mới
  static async create({
    user_id,
    appointment_id,
    amount,
    payment_method,
    status,
    payment_time,
  }) {
    const uuid = uuidv4().replace(/-/g, "").slice(0, 32);
    await db.execute(
      `INSERT INTO payments 
      (uuid, user_id, appointment_id, amount, payment_method, status, payment_time, created_at, updated_at)
      VALUES (?, ?, ?, ?, ?, ?, ?, NOW(), NOW())`,
      [
        uuid,
        user_id,
        appointment_id,
        amount,
        payment_method,
        status,
        payment_time,
      ]
    );

    const paymentData = {
      uuid,
      user_id,
      appointment_id,
      amount,
      payment_method,
      status,
      payment_time,
    };

    // Tạo thông báo dựa trên status
    try {
      if (status === 'pending' || status === 1) {
        await NotificationService.createPaymentNotification(
          uuid,
          user_id,
          'payment_pending'
        );
      } else if (status === 'completed' || status === 'success' || status === 0) {
        await NotificationService.createPaymentNotification(
          uuid,
          user_id,
          'payment_success'
        );
      }
    } catch (notificationError) {
      console.error('Error creating payment notification:', notificationError);
    }

    return paymentData;
  }

  // Cập nhật thanh toán theo UUID
  static async update(
    uuid,
    { user_id, appointment_id, amount, payment_method, status, payment_time }
  ) {
    // Lấy thông tin payment cũ để so sánh
    const oldPayment = await this.getById(uuid);
    
    const [result] = await db.execute(
      `UPDATE payments SET 
        user_id=?, 
        appointment_id=?, 
        amount=?, 
        payment_method=?, 
        status=?, 
        payment_time=?, 
        updated_at=NOW() 
      WHERE uuid=?`,
      [
        user_id,
        appointment_id,
        amount,
        payment_method,
        status,
        payment_time,
        uuid,
      ]
    );

    // Tạo thông báo khi status thay đổi
    if (result.affectedRows > 0 && oldPayment && oldPayment.status !== status) {
      try {
        let notificationType = null;
        
        if (status === 'completed' || status === 'success' || status === 0) {
          notificationType = 'payment_success';
        } else if (status === 'failed' || status === 'error' || status === 2) {
          notificationType = 'payment_failed';
        } else if (status === 'refunded' || status === 3) {
          notificationType = 'payment_refund';
        }

        if (notificationType) {
          await NotificationService.createPaymentNotification(
            uuid,
            user_id,
            notificationType
          );
        }
      } catch (notificationError) {
        console.error('Error creating payment update notification:', notificationError);
      }
    }

    return result.affectedRows > 0;
  }

  // Xóa thanh toán theo UUID
  static async remove(uuid) {
    const [result] = await db.execute("DELETE FROM payments WHERE uuid = ?", [
      uuid,
    ]);
    return result.affectedRows > 0;
  }

  // Cập nhật trạng thái thanh toán theo UUID
  static async updateStatus(uuid, status) {
    // Lấy thông tin payment cũ để so sánh
    const oldPayment = await this.getById(uuid);
    
    const [result] = await db.execute(
      `UPDATE payments SET status = ?, updated_at = NOW() WHERE uuid = ?`,
      [status, uuid]
    );

    // Tạo thông báo khi status thay đổi
    if (result.affectedRows > 0 && oldPayment && oldPayment.status !== status) {
      try {
        let notificationType = null;
        
        if (status === 'completed' || status === 'success' || status === 0) {
          notificationType = 'payment_success';
        } else if (status === 'failed' || status === 'error' || status === 2) {
          notificationType = 'payment_failed';
        } else if (status === 'refunded' || status === 3) {
          notificationType = 'payment_refund';
        }

        if (notificationType && oldPayment.user_id) {
          await NotificationService.createPaymentNotification(
            uuid,
            oldPayment.user_id,
            notificationType
          );
        }
      } catch (notificationError) {
        console.error('Error creating payment status notification:', notificationError);
      }
    }

    return result.affectedRows > 0;
  }

  // Lấy thanh toán của người dùng theo userId
  static async getByUserId(userId) {
    const [rows] = await db.execute(
      `SELECT 
      p.*, 
      u.name AS user_name
    FROM payments p
    LEFT JOIN user u ON p.user_id = u.uuid
    WHERE p.user_id = ?
    ORDER BY p.payment_time DESC`,
      [userId]
    );
    return rows;
  }

  // Hàm hủy các thanh toán chưa thanh toán trong hơn 5 phút
  static async cancelUnpaidPayosPayments() {
    try {
      // 1. Lấy danh sách payment_id chưa thanh toán quá 5 phút
      const [payosRows] = await db.execute(
        `SELECT * FROM payos_payments 
       WHERE status = 1 
       AND created_at < NOW() - INTERVAL 5 MINUTE`
      );

      if (payosRows.length === 0) return 0;

      const paymentIds = payosRows.map((row) => row.payment_id);
      if (paymentIds.length === 0) return 0;

      // Lấy thông tin user_id cho từng payment trước khi update
      const placeholders = paymentIds.map(() => "?").join(", ");
      const [paymentInfoRows] = await db.execute(
        `SELECT uuid, user_id FROM payments WHERE uuid IN (${placeholders})`,
        paymentIds
      );

      // 2. Cập nhật trạng thái bảng payos_payments và payments
      await db.execute(
        `UPDATE payos_payments SET status = 2 WHERE payment_id IN (${placeholders})`,
        paymentIds
      );
      await db.execute(
        `UPDATE payments SET status = 2 WHERE uuid IN (${placeholders}) AND status = 1`,
        paymentIds
      );

      // 3. Tìm tất cả appointment_id liên quan các payment này
      const [paymentRows] = await db.execute(
        `SELECT appointment_id FROM payments WHERE uuid IN (${placeholders}) AND appointment_id IS NOT NULL`,
        paymentIds
      );
      const appointmentIds = paymentRows.map((row) => row.appointment_id);

      if (appointmentIds.length > 0) {
        const apptPlaceholders = appointmentIds.map(() => "?").join(", ");
        // 4. Update status = 4 cho các lịch hẹn liên quan
        await db.execute(
          `UPDATE appointments SET status = 4 WHERE uuid IN (${apptPlaceholders})`,
          appointmentIds
        );
        console.log(
          `Cập nhật ${appointmentIds.length} lịch hẹn thành huỷ do thanh toán thất bại.`
        );
      }

      // 5. Gửi thông báo cho users về payments bị hủy
      for (const paymentInfo of paymentInfoRows) {
        try {
          await NotificationService.createCustomNotification(
            paymentInfo.user_id,
            null,
            'Thanh toán bị hủy',
            'Thanh toán của bạn đã bị hủy do quá thời gian thanh toán. Vui lòng thực hiện thanh toán lại.',
            null,
            paymentInfo.uuid
          );
        } catch (notificationError) {
          console.error(`Error sending cancellation notification for payment ${paymentInfo.uuid}:`, notificationError);
        }
      }

      console.log(
        `Updated ${paymentIds.length} payments to canceled in both tables and appointments.`
      );
      console.log(`Sent ${paymentInfoRows.length} payment cancellation notifications.`);
      
      return paymentIds.length;
    } catch (error) {
      console.error("Error checking and updating payments:", error);
      return 0;
    }
  }

  // Lấy thanh toán theo appointment_id
  static async getByAppointmentId(appointmentId) {
    const [rows] = await db.execute(
      `SELECT 
      p.*, 
      u.name AS user_name
    FROM payments p
    LEFT JOIN user u ON p.user_id = u.uuid
    WHERE p.appointment_id = ?
    ORDER BY p.payment_time DESC`,
      [appointmentId]
    );
    return Payment.fromRows(rows);
  }

  // Xử lý thanh toán thành công (webhook từ payment gateway)
  static async handlePaymentSuccess(paymentData) {
    try {
      const { uuid, user_id } = paymentData;
      
      // Update payment status
      await this.updateStatus(uuid, 'success');
      
      // Gửi thông báo thành công
      await NotificationService.createPaymentNotification(
        uuid,
        user_id,
        'payment_success'
      );
      
      console.log(`Payment success notification sent for payment ${uuid}`);
      return { success: true, message: 'Payment processed successfully' };
    } catch (error) {
      console.error('Error handling payment success:', error);
      throw error;
    }
  }

  // Xử lý thanh toán thất bại (webhook từ payment gateway)
  static async handlePaymentFailure(paymentData) {
    try {
      const { uuid, user_id } = paymentData;
      
      // Update payment status
      await this.updateStatus(uuid, 'failed');
      
      // Gửi thông báo thất bại
      await NotificationService.createPaymentNotification(
        uuid,
        user_id,
        'payment_failed'
      );
      
      console.log(`Payment failure notification sent for payment ${uuid}`);
      return { success: false, message: 'Payment failed' };
    } catch (error) {
      console.error('Error handling payment failure:', error);
      throw error;
    }
  }

  // Xử lý hoàn tiền
  static async processRefund(paymentData) {
    try {
      const { uuid, user_id } = paymentData;
      
      // Update payment status
      await this.updateStatus(uuid, 'refunded');
      
      // Gửi thông báo hoàn tiền
      await NotificationService.createPaymentNotification(
        uuid,
        user_id,
        'payment_refund'
      );
      
      console.log(`Refund notification sent for payment ${uuid}`);
      return { success: true, message: 'Refund processed successfully' };
    } catch (error) {
      console.error('Error processing refund:', error);
      throw error;
    }
  }
}

module.exports = PaymentService;