class VaccinationCenter {
  constructor({
    uuid,
    name,
    address,
    phone,
    email,
    image,
    description,
    status,
    working_hours,
    created_at,
    updated_at,
  }) {
    this.uuid = uuid || null;
    this.name = name || null;
    this.address = address || null;
    this.phone = phone || null;
    this.email = email || null;
    this.image = image || null;
    this.description = description || null;
    this.status = status || "open";
    this.working_hours = working_hours || null;
    this.created_at = created_at || null;
    this.updated_at = updated_at || null;
  }
  static fromRow(row) {
    return new VaccinationCenter(row);
  }
  static fromRows(rows) {
    return rows.map(row => VaccinationCenter.fromRow(row));
  }
}
module.exports = VaccinationCenter;
