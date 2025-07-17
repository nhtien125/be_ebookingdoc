const db = require('../helper/database');
const DoctorRevenue = require('../model/DoctorRevenue');

class DoctorRevenueService {
  static async getRevenueByDoctorId(doctorId) {
    const [rows] = await db.execute(
      `
      SELECT 
          p.payment_method,
          COALESCE(SUM(p.amount), 0) as total_amount
      FROM appointments a
      LEFT JOIN payments p ON a.uuid = p.appointment_id
      WHERE a.doctor_id = ? AND p.status = 2
      GROUP BY p.payment_method WITH ROLLUP
      `,
      [doctorId]
    );

    let totalRevenue = 0;
    const breakdown = {
      cash: 0,
      online: 0,
    };

    rows.forEach(row => {
      if (row.payment_method === null) {
        totalRevenue = row.total_amount;
      } else if (row.payment_method.toLowerCase() === 'cash') {
        breakdown.cash = row.total_amount;
      } else if (row.payment_method.toLowerCase() === 'online') {
        breakdown.online = row.total_amount;
      }
    });

    return DoctorRevenue.fromData({ totalRevenue, breakdown });
  }
}

module.exports = DoctorRevenueService;