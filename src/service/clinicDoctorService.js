const ClinicDoctor = require("../model/clinicDoctorModel");
const Clinic = require("../model/clinicModel");

module.exports = {
  async addDoctor(clinic_uuid, doctor_uuid) {
    try {
      const clinic = await Clinic.findById(clinic_uuid);
      if (!clinic) {
        throw new Error("Clinic not found");
      }
      await ClinicDoctor.addDoctor(clinic_uuid, doctor_uuid);
      return { message: "Doctor added to clinic successfully" };
    } catch (error) {
      throw new Error("Error adding doctor: " + error.message);
    }
  },

  async removeDoctor(clinic_uuid, doctor_uuid) {
    try {
      const clinic = await Clinic.findById(clinic_uuid);
      if (!clinic) {
        throw new Error("Clinic not found");
      }
      await ClinicDoctor.removeDoctor(clinic_uuid, doctor_uuid);
      return { message: "Doctor removed from clinic successfully" };
    } catch (error) {
      throw new Error("Error removing doctor: " + error.message);
    }
  },

  async getDoctorsByClinic(clinic_uuid) {
    try {
      const clinic = await Clinic.findById(clinic_uuid);
      if (!clinic) {
        throw new Error("Clinic not found");
      }
      return await ClinicDoctor.getDoctorsByClinic(clinic_uuid);
    } catch (error) {
      throw new Error("Error fetching doctors: " + error.message);
    }
  },
};