class Patient {
  constructor({
    uuid,
    user_id,
    name,
    dob,
    gender,
    phone,
    relationship,
    address,
    created_at,
    updated_at,
  }) {
    this.uuid = uuid || null;
    this.user_id = user_id || null;
    this.name = name || null;
    this.dob = dob || null;
    this.gender = gender || null;
    this.phone = phone || null;
    this.relationship = relationship || null;
    this.address = address || null;
    this.created_at = created_at || null;
    this.updated_at = updated_at || null;
  }
  static fromRow(row) {
    return new Patient(row);
  }
  static fromRows(rows) {
    return rows.map(row => Patient.fromRow(row));
  }
}
module.exports = Patient;
