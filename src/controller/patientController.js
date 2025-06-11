const patientService = require('./../service/patientService');

module.exports = {
  async getAll(req, res) {
    try {
      const patients = await patientService.getAll();
      res.status(200).json(patients);
    } catch (error) {
      res.status(500).json({ error: error.message });
    }
  },

  async getById(req, res) {
    try {
      const patient = await patientService.getById(req.params.id);
      res.status(200).json(patient);
    } catch (error) {
      res.status(404).json({ error: error.message });
    }
  },

  async create(req, res) {
    try {
      const patient = await patientService.create(req.body);
      res.status(201).json(patient);
    } catch (error) {
      res.status(400).json({ error: error.message });
    }
  },

  async update(req, res) {
    try {
      const patient = await patientService.update(req.params.id, req.body);
      res.status(200).json(patient);
    } catch (error) {
      res.status(400).json({ error: error.message });
    }
  },

  async delete(req, res) {
    try {
      const result = await patientService.delete(req.params.id);
      res.status(200).json(result);
    } catch (error) {
      res.status(404).json({ error: error.message });
    }
  }
};