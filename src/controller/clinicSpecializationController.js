const clinicSpecializationService = require("../service/clinicSpecializationService");

module.exports = {
  async addSpecialization(req, res) {
    try {
      const { clinic_uuid, specialization_uuid } = req.body;
      if (!clinic_uuid || !specialization_uuid) {
        return res.status(400).json({ error: "Missing required fields: clinic_uuid, specialization_uuid" });
      }
      const result = await clinicSpecializationService.addSpecialization(clinic_uuid, specialization_uuid);
      res.status(200).json({ code: 200, message: "Thành công", data: result });
    } catch (error) {
      res.status(400).json({ error: error.message });
    }
  },

  async removeSpecialization(req, res) {
    try {
      const { clinic_uuid, specialization_uuid } = req.body;
      if (!clinic_uuid || !specialization_uuid) {
        return res.status(400).json({ error: "Missing required fields: clinic_uuid, specialization_uuid" });
      }
      const result = await clinicSpecializationService.removeSpecialization(clinic_uuid, specialization_uuid);
      res.status(200).json({ code: 200, message: "Thành công", data: result });
    } catch (error) {
      res.status(400).json({ error: error.message });
    }
  },

  async getSpecializationsByClinic(req, res) {
    try {
      const { clinic_uuid } = req.params;
      if (!clinic_uuid) {
        return res.status(400).json({ error: "Missing required field: clinic_uuid" });
      }
      const specializations = await clinicSpecializationService.getSpecializationsByClinic(clinic_uuid);
      res.status(200).json({ code: 200, message: "Thành công", data: specializations });
    } catch (error) {
      res.status(400).json({ error: error.message });
    }
  },
};