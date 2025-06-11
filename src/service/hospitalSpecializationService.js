const HospitalSpecialization = require("../model/hospitalSpecializationModel");
const Hospital = require("../model/hospitalModel"); 

module.exports = {
  async addSpecialization(hospital_uuid, specialization_uuid) {
    try {
      const hospital = await Hospital.findById(hospital_uuid);
      if (!hospital) {
        throw new Error("Hospital not found");
      }
      await HospitalSpecialization.addSpecialization(hospital_uuid, specialization_uuid);
      return { message: "Specialization added to hospital successfully" };
    } catch (error) {
      throw new Error("Error adding specialization: " + error.message);
    }
  },

  async removeSpecialization(hospital_uuid, specialization_uuid) {
    try {
      const hospital = await Hospital.findById(hospital_uuid);
      if (!hospital) {
        throw new Error("Hospital not found");
      }
      await HospitalSpecialization.removeSpecialization(hospital_uuid, specialization_uuid);
      return { message: "Specialization removed from hospital successfully" };
    } catch (error) {
      throw new Error("Error removing specialization: " + error.message);
    }
  },

  async getSpecializationsByHospital(hospital_uuid) {
    try {
      const hospital = await Hospital.findById(hospital_uuid);
      if (!hospital) {
        throw new Error("Hospital not found");
      }
      return await HospitalSpecialization.getSpecializationsByHospital(hospital_uuid);
    } catch (error) {
      throw new Error("Error fetching specializations: " + error.message);
    }
  },
};