const hospitalSpecializationService = require("../service/hospitalSpecializationService");

module.exports = {
  async addSpecialization(req, res) {
    try {
      const { hospital_uuid, specialization_uuid } = req.body;
      if (!hospital_uuid || !specialization_uuid) {
        return res.status(400).json({ error: "Missing required fields: hospital_uuid, specialization_uuid" });
      }
      const result = await hospitalSpecializationService.addSpecialization(hospital_uuid, specialization_uuid);
      res.status(200).json({ code: 200, message: "Thành công", data: result });
    } catch (error) {
      res.status(400).json({ error: error.message });
    }
  },

  async removeSpecialization(req, res) {
    try {
      const { hospital_uuid, specialization_uuid } = req.body;
      if (!hospital_uuid || !specialization_uuid) {
        return res.status(400).json({ error: "Missing required fields: hospital_uuid, specialization_uuid" });
      }
      const result = await hospitalSpecializationService.removeSpecialization(hospital_uuid, specialization_uuid);
      res.status(200).json({ code: 200, message: "Thành công", data: result });
    } catch (error) {
      res.status(400).json({ error: error.message });
    }
  },

  async getSpecializationsByHospital(req, res) {
    try {
      const { hospital_uuid } = req.params;
      if (!hospital_uuid) {
        return res.status(400).json({ error: "Missing required field: hospital_uuid" });
      }
      const specializations = await hospitalSpecializationService.getSpecializationsByHospital(hospital_uuid);
      res.status(200).json({ code: 200, message: "Thành công", data: specializations });
    } catch (error) {
      res.status(400).json({ error: error.message });
    }
  },
};