const appointmentService = require('./../service/appointmentService');

module.exports = {
  async getAll(req, res) {
    try {
      const appointments = await appointmentService.getAll();
      res.status(200).json(appointments);
    } catch (error) {
      res.status(500).json({ error: error.message });
    }
  },

  async getById(req, res) {
    try {
      const appointment = await appointmentService.getById(req.params.id);
      res.status(200).json(appointment);
    } catch (error) {
      res.status(404).json({ error: error.message });
    }
  },

  async create(req, res) {
    try {
      const appointment = await appointmentService.create(req.body);
      res.status(201).json(appointment);
    } catch (error) {
      res.status(400).json({ error: error.message });
    }
  },

  async update(req, res) {
    try {
      const appointment = await appointmentService.update(req.params.id, req.body);
      res.status(200).json(appointment);
    } catch (error) {
      res.status(400).json({ error: error.message });
    }
  },

  async delete(req, res) {
    try {
      const result = await appointmentService.delete(req.params.id);
      res.status(200).json(result);
    } catch (error) {
      res.status(404).json({ error: error.message });
    }
  }
};