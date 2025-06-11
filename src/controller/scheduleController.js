const scheduleService = require('./../service/scheduleService');

module.exports = {
  async getAll(req, res) {
    try {
      const schedules = await scheduleService.getAll();
      res.status(200).json(schedules);
    } catch (error) {
      res.status(500).json({ error: error.message });
    }
  },

  async getById(req, res) {
    try {
      const schedule = await scheduleService.getById(req.params.id);
      res.status(200).json(schedule);
    } catch (error) {
      res.status(404).json({ error: error.message });
    }
  },

  async create(req, res) {
    try {
      const schedule = await scheduleService.create(req.body);
      res.status(201).json(schedule);
    } catch (error) {
      res.status(400).json({ error: error.message });
    }
  },

  async update(req, res) {
    try {
      const schedule = await scheduleService.update(req.params.id, req.body);
      res.status(200).json(schedule);
    } catch (error) {
      res.status(400).json({ error: error.message });
    }
  },

  async delete(req, res) {
    try {
      const result = await scheduleService.delete(req.params.id);
      res.status(200).json(result);
    } catch (error) {
      res.status(404).json({ error: error.message });
    }
  }
};