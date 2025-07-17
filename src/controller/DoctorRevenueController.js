const DoctorRevenueService = require('../service/DoctorRevenueService');

class DoctorRevenueController {
  static async getRevenueByDoctorId(req, res) {
    try {
      const { doctorId } = req.params;
      const data = await DoctorRevenueService.getRevenueByDoctorId(doctorId);

      if (data.totalRevenue === 0) {
        return res.status(404).json({
          code: 404,
          msg: 'Không tìm thấy dữ liệu thanh toán cho bác sĩ này',
          status: 'error',
        });
      }

      res.json({
        code: 200,
        msg: 'Thành công',
        status: 'success',
        data,
      });
    } catch (error) {
      res.status(500).json({
        code: 500,
        msg: error.message,
        status: 'error',
      });
    }
  }
}

module.exports = DoctorRevenueController;