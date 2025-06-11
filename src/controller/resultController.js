const resultService = require('./../service/resultService');

module.exports = {
  async getAll(req, res) {
    try {
      const results = await resultService.getAll();
      res.status(200).json(results);
    } catch (error) {
      res.status(500).json({ error: error.message });
    }
  },

  async getById(req, res) {
    try {
      const result = await resultService.getById(req.params.id);
      res.status(200).json(result);
    } catch (error) {
      res.status(404).json({ error: error.message });
    }
  },

  async create(req, res) {
    try {
      const result = await resultService.create(req.body);
      res.status(201).json(result);
    } catch (error) {
      res.status(400).json({ error: error.message });
    }
  },

  async update(req, res) {
    try {
      const result = await resultService.update(req.params.id, req.body);
      res.status(200).json(result);
    } catch (error) {
      res.status(400).json({ error: error.message });
    }
  },

  async delete(req, res) {
    try {
      const result = await resultService.delete(req.params.id);
      res.status(200).json(result);
    } catch (error) {
      res.status(404).json({ error: error.message });
    }
  }
};