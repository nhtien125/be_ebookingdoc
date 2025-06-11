const HospitalDoctor = require("../model/hospitalDoctorModel");
const Hospital = require("../model/hospitalModel");

module.exports = {
  async addDoctor(hospital_uuid, doctor_uuid) {
    try {
      const hospital = await Hospital.findById(hospital_uuid);
      if (!hospital) {
        throw new Error("Hospital not found");
      }
      await HospitalDoctor.addDoctor(hospital_uuid, doctor_uuid);
      return { message: "Doctor added to hospital successfully" };
    } catch (error) {
      throw new Error("Error adding doctor: " + error.message);
    }
  },

  async removeDoctor(hospital_uuid, doctor_uuid) {
    try {
      const hospital = await Hospital.findById(hospital_uuid);
      if (!hospital) {
        throw new Error("Hospital not found");
      }
      await HospitalDoctor.removeDoctor(hospital_uuid, doctor_uuid);
      return { message: "Doctor removed from hospital successfully" };
    } catch (error) {
      throw new Error("Error removing doctor: " + error.message);
    }
  },

  async getDoctorsByHospital(hospital_uuid) {
    try {
      const hospital = await Hospital.findById(hospital_uuid);
      if (!hospital) {
        throw new Error("Hospital not found");
      }
      return await HospitalDoctor.getDoctorsByHospital(hospital_uuid);
    } catch (error) {
      throw new Error("Error fetching doctors: " + error.message);
    }
  },
};