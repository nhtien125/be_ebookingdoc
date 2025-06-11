const hospitalDoctorService = require("../service/hospitalDoctorService");

module.exports = {
  async addDoctor(req, res) {
    try {
      const { hospital_uuid, doctor_uuid } = req.body;
      if (!hospital_uuid || !doctor_uuid) {
        return res.status(400).json({ error: "Missing required fields: hospital_uuid, doctor_uuid" });
      }
      const result = await hospitalDoctorService.addDoctor(hospital_uuid, doctor_uuid);
      res.status(200).json({ code: 200, message: "Thành công", data: result });
    } catch (error) {
      res.status(400).json({ error: error.message });
    }
  },

  async removeDoctor(req, res) {
    try {
      const { hospital_uuid, doctor_uuid } = req.body;
      if (!hospital_uuid || !doctor_uuid) {
        return res.status(400).json({ error: "Missing required fields: hospital_uuid, doctor_uuid" });
      }
      const result = await hospitalDoctorService.removeDoctor(hospital_uuid, doctor_uuid);
      res.status(200).json({ code: 200, message: "Thành công", data: result });
    } catch (error) {
      res.status(400).json({ error: error.message });
    }
  },

  async getDoctorsByHospital(req, res) {
    try {
      const { hospital_uuid } = req.params;
      if (!hospital_uuid) {
        return res.status(400).json({ error: "Missing required field: hospital_uuid" });
      }
      const doctors = await hospitalDoctorService.getDoctorsByHospital(hospital_uuid);
      res.status(200).json({ code: 200, message: "Thành công", data: doctors });
    } catch (error) {
      res.status(400).json({ error: error.message });
    }
  },
};