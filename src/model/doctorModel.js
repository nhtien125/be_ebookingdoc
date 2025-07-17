class Doctor {
  constructor({
    uuid,
    user_id,
    hospital_id,
    clinic_id,
    specialization_id,
    license,
    introduce,
    experience,
    status,
    created_at,
    updated_at,
  }) {
    this.uuid = uuid || null;
    this.user_id = user_id || null;
    this.hospital_id = hospital_id || null;
    this.clinic_id = clinic_id || null;
    this.specialization_id = specialization_id || null;
    this.license = license || null;
    this.introduce = introduce || null;
    this.experience = experience || 0;
    this.status = status; // 0: approved, 1: pending, 2: rejected
    this.created_at = created_at || null;
    this.updated_at = updated_at || null;
  }

  static fromRow(row) {
    return new Doctor(row);
  }

  static fromRows(rows) {
    return rows.map(row => Doctor.fromRow(row));
  }
}

module.exports = Doctor;