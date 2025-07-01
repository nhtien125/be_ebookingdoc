const db = require("../helper/database");
const { v4: uuidv4 } = require("uuid");
const Payment = require("../model/paymentModel");

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
    return {
      uuid,
      user_id,
      appointment_id,
      amount,
      payment_method,
      status,
      payment_time,
    };
  }

  // Cập nhật thanh toán theo UUID
  static async update(
    uuid,
    { user_id, appointment_id, amount, payment_method, status, payment_time }
  ) {
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
    const [result] = await db.execute(
      `UPDATE payments SET status = ?, updated_at = NOW() WHERE uuid = ?`,
      [status, uuid]
    );
    return result.affectedRows > 0;
  }

  // Lấy thanh toán của người dùng theo userId
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
      const [payosRows] = await db.execute(
        `SELECT * FROM payos_payments 
         WHERE status = 1 
         AND created_at < NOW() - INTERVAL 5 MINUTE`
      );

      if (payosRows.length > 0) {
        const paymentIds = payosRows.map((row) => row.payment_id);

        if (paymentIds.length === 0) return 0;

        const placeholders = paymentIds.map(() => "?").join(", ");

        await db.execute(
          `UPDATE payos_payments SET status = 2 WHERE payment_id IN (${placeholders})`,
          paymentIds
        );

        await db.execute(
          `UPDATE payments SET status = 2 WHERE uuid IN (${placeholders}) AND status = 1`,
          paymentIds
        );

        console.log(
          `Updated ${paymentIds.length} payments to canceled in both tables.`
        );
        return paymentIds.length;
      }

      return 0;
    } catch (error) {
      console.error("Error checking and updating payments:", error);
      return 0;
    }
  }
}

module.exports = PaymentService;
