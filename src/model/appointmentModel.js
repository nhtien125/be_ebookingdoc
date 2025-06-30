// model/appointmentModel.js
class Appointment {
  constructor({
    uuid,
    doctor_id,
    patient_id,
    clinic_id,
    hospital_id,
    schedule_id,
    vaccination_center_id,
    medical_service_id,
    date,
    status,
    health_status,
    created_at,
    updated_at,
    user_id, 
  }) {
    this.uuid = uuid || null;
    this.doctor_id = doctor_id || null;
    this.patient_id = patient_id || null;
    this.clinic_id = clinic_id || null;
    this.hospital_id = hospital_id || null;
    this.schedule_id = schedule_id || null;
    this.vaccination_center_id = vaccination_center_id || null;
    this.medical_service_id = medical_service_id || null;
    this.date = date || null;
    this.status = status || null;
    this.health_status = health_status || null;
    this.created_at = created_at || null;
    this.updated_at = updated_at || null;
    this.user_id = user_id || null; 
  }

  static fromRow(row) {
    return new Appointment(row);
  }

  static fromRows(rows) {
    return rows.map(row => Appointment.fromRow(row));
  }
}

module.exports = Appointment;
