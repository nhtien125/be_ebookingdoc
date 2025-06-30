// service/paymentService.js
const db = require("../helper/database");
const { v4: uuidv4 } = require("uuid");
const Payment = require("../model/paymentModel");

class PaymentService {
  static async getAll() {
    const [rows] = await db.execute(
      "SELECT * FROM payments ORDER BY created_at DESC"
    );
    return Payment.fromRows(rows);
  }
  static async getById(uuid) {
    const [rows] = await db.execute("SELECT * FROM payments WHERE uuid = ?", [
      uuid,
    ]);
    if (rows.length === 0) return null;
    return Payment.fromRow(rows[0]);
  }
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
  static async remove(uuid) {
    const [result] = await db.execute("DELETE FROM payments WHERE uuid = ?", [
      uuid,
    ]);
    return result.affectedRows > 0;
  }
  static async updateStatus(uuid, status) {
    const [result] = await db.execute(
      `UPDATE payments SET status = ?, updated_at = NOW() WHERE uuid = ?`,
      [status, uuid]
    );
    return result.affectedRows > 0;
  }
  static async getByUserId(userId) {
    const [rows] = await db.execute(
      `SELECT 
        p.*, 
        u.name AS user_name, 
        h.name AS hospital_name, 
        c.name AS clinic_name, 
        s.name AS specialization_name
     FROM payments p
     LEFT JOIN user u ON p.user_id = u.uuid
     LEFT JOIN hospitals h ON p.hospital_id = h.uuid
     LEFT JOIN clinics c ON p.clinic_id = c.uuid
     LEFT JOIN specialization s ON p.specialization_id = s.uuid
     WHERE p.user_id = ?
     ORDER BY p.payment_time DESC`,
      [userId]
    );
    return rows;
  }
  static async cancelUnpaidPayosPayments() {
    try {
      // Truy vấn các đơn hàng "đang chờ" thanh toán trong hơn 5 phút trong bảng payos_payments
      const [payosRows] = await db.execute(
        `SELECT * FROM payos_payments 
       WHERE status = 1 
       AND created_at < NOW() - INTERVAL 5 MINUTE`
      );

      // Nếu có đơn hàng cần hủy trong bảng payos_payments
      if (payosRows.length > 0) {
        const paymentIds = payosRows.map((row) => row.payment_id);

        // Nếu không có paymentIds thì return luôn
        if (paymentIds.length === 0) return 0;

        // Tạo chuỗi dấu ? động cho IN
        const placeholders = paymentIds.map(() => "?").join(", ");

        // Cập nhật trạng thái của các đơn hàng này thành "hủy" (status = 2) trong bảng payos_payments
        await db.execute(
          `UPDATE payos_payments 
         SET status = 2 
         WHERE payment_id IN (${placeholders})`,
          paymentIds
        );

        // Cập nhật trạng thái của các đơn hàng này thành "hủy" (status = 2) trong bảng payments
        // Chỉ cập nhật nếu uuid khớp và status = 1
        await db.execute(
          `UPDATE payments 
         SET status = 2 
         WHERE uuid IN (${placeholders}) AND status = 1`,
          paymentIds
        );

        console.log(
          `Updated ${paymentIds.length} payments to canceled in both tables.`
        );
        return paymentIds.length;
      }

      return 0; // Không có đơn hàng nào cần hủy
    } catch (error) {
      console.error("Error checking and updating payments:", error);
      return 0; // Nếu có lỗi trong quá trình xử lý
    }
  }
}
module.exports = PaymentService;
