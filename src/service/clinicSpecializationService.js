const ClinicSpecialization = require("../model/clinicSpecializationModel");
const Clinic = require("../model/clinicModel");

module.exports = {
  async addSpecialization(clinic_uuid, specialization_uuid) {
    try {
      const clinic = await Clinic.findById(clinic_uuid);
      if (!clinic) {
        throw new Error("Clinic not found");
      }
      await ClinicSpecialization.addSpecialization(clinic_uuid, specialization_uuid);
      return { message: "Specialization added to clinic successfully" };
    } catch (error) {
      throw new Error("Error adding specialization: " + error.message);
    }
  },

  async removeSpecialization(clinic_uuid, specialization_uuid) {
    try {
      const clinic = await Clinic.findById(clinic_uuid);
      if (!clinic) {
        throw new Error("Clinic not found");
      }
      await ClinicSpecialization.removeSpecialization(clinic_uuid, specialization_uuid);
      return { message: "Specialization removed from clinic successfully" };
    } catch (error) {
      throw new Error("Error removing specialization: " + error.message);
    }
  },

  async getSpecializationsByClinic(clinic_uuid) {
    try {
      const clinic = await Clinic.findById(clinic_uuid);
      if (!clinic) {
        throw new Error("Clinic not found");
      }
      return await ClinicSpecialization.getSpecializationsByClinic(clinic_uuid);
    } catch (error) {
      throw new Error("Error fetching specializations: " + error.message);
    }
  },
};