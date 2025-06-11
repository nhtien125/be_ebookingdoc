const packageService = require('./../service/packageService');

module.exports = {
  async getAll(req, res) {
    try {
      const packages = await packageService.getAll();
      res.status(200).json(packages);
    } catch (error) {
      res.status(500).json({ error: error.message });
    }
  },

  async getById(req, res) {
    try {
      const pkg = await packageService.getById(req.params.id);
      res.status(200).json(pkg);
    } catch (error) {
      res.status(404).json({ error: error.message });
    }
  },

  async create(req, res) {
    try {
      const pkg = await packageService.create(req.body);
      res.status(201).json(pkg);
    } catch (error) {
      res.status(400).json({ error: error.message });
    }
  },

  async update(req, res) {
    try {
      const pkg = await packageService.update(req.params.id, req.body);
      res.status(200).json(pkg);
    } catch (error) {
      res.status(400).json({ error: error.message });
    }
  },

  async delete(req, res) {
    try {
      const result = await packageService.delete(req.params.id);
      res.status(200).json(result);
    } catch (error) {
      res.status(404).json({ error: error.message });
    }
  }
};