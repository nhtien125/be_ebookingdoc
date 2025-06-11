const clinicDoctorService = require("../service/clinicDoctorService");

module.exports = {
  async addDoctor(req, res) {
    try {
      const { clinic_uuid, doctor_uuid } = req.body;
      if (!clinic_uuid || !doctor_uuid) {
        return res.status(400).json({ error: "Missing required fields: clinic_uuid, doctor_uuid" });
      }
      const result = await clinicDoctorService.addDoctor(clinic_uuid, doctor_uuid);
      res.status(200).json({ code: 200, message: "Thành công", data: result });
    } catch (error) {
      res.status(400).json({ error: error.message });
    }
  },

  async removeDoctor(req, res) {
    try {
      const { clinic_uuid, doctor_uuid } = req.body;
      if (!clinic_uuid || !doctor_uuid) {
        return res.status(400).json({ error: "Missing required fields: clinic_uuid, doctor_uuid" });
      }
      const result = await clinicDoctorService.removeDoctor(clinic_uuid, doctor_uuid);
      res.status(200).json({ code: 200, message: "Thành công", data: result });
    } catch (error) {
      res.status(400).json({ error: error.message });
    }
  },

  async getDoctorsByClinic(req, res) {
    try {
      const { clinic_uuid } = req.params;
      if (!clinic_uuid) {
        return res.status(400).json({ error: "Missing required field: clinic_uuid" });
      }
      const doctors = await clinicDoctorService.getDoctorsByClinic(clinic_uuid);
      res.status(200).json({ code: 200, message: "Thành công", data: doctors });
    } catch (error) {
      res.status(400).json({ error: error.message });
    }
  },
};