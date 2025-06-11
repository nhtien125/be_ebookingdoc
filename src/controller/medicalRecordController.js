const medicalRecordService = require('./../service/medicalRecordService');

module.exports = {
  async getAll(req, res) {
    try {
      const medicalRecords = await medicalRecordService.getAll();
      res.status(200).json(medicalRecords);
    } catch (error) {
      res.status(500).json({ error: error.message });
    }
  },

  async getById(req, res) {
    try {
      const medicalRecord = await medicalRecordService.getById(req.params.id);
      res.status(200).json(medicalRecord);
    } catch (error) {
      res.status(404).json({ error: error.message });
    }
  },

  async create(req, res) {
    try {
      const medicalRecord = await medicalRecordService.create(req.body);
      res.status(201).json(medicalRecord);
    } catch (error) {
      res.status(400).json({ error: error.message });
    }
  },

  async update(req, res) {
    try {
      const medicalRecord = await medicalRecordService.update(req.params.id, req.body);
      res.status(200).json(medicalRecord);
    } catch (error) {
      res.status(400).json({ error: error.message });
    }
  },

  async delete(req, res) {
    try {
      const result = await medicalRecordService.delete(req.params.id);
      res.status(200).json(result);
    } catch (error) {
      res.status(404).json({ error: error.message });
    }
  }
};