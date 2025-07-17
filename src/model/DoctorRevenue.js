class DoctorRevenue {
  constructor({ totalRevenue, breakdown }) {
    this.totalRevenue = totalRevenue ?? 0;
    this.breakdown = {
      cash: breakdown?.cash ?? 0,
      online: breakdown?.online ?? 0,
    };
  }

  static fromData({ totalRevenue, breakdown }) {
    return new DoctorRevenue({ totalRevenue, breakdown });
  }
}

module.exports = DoctorRevenue;