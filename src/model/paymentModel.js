// model/paymentModel.js
class Payment {
  constructor({
    uuid,
    user_id,
    appointment_id,
    amount,
    payment_method,
    status,
    payment_time,
    created_at,
    updated_at,
  }) {
    this.uuid = uuid || null;
    this.user_id = user_id || null;
    this.appointment_id = appointment_id || null;
    this.amount = amount || null;
    this.payment_method = payment_method || null;
    this.status = status || null;
    this.payment_time = payment_time || null;
    this.created_at = created_at || null;
    this.updated_at = updated_at || null;
  }
  static fromRow(row) {
    return new Payment(row);
  }
  static fromRows(rows) {
    return rows.map(row => Payment.fromRow(row));
  }
}
module.exports = Payment;
