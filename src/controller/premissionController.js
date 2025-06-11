const permissionService = require('../service/premissionService');

module.exports = {
  async getAll(req, res) {
    try {
      const permissions = await permissionService.getAll();
      res.status(200).json(permissions);
    } catch (error) {
      res.status(500).json({ error: error.message });
    }
  },

  async getById(req, res) {
    try {
      const permission = await permissionService.getById(req.params.id);
      res.status(200).json(permission);
    } catch (error) {
      res.status(404).json({ error: error.message });
    }
  },

  async create(req, res) {
    try {
      const permission = await permissionService.create(req.body);
      res.status(201).json(permission);
    } catch (error) {
      res.status(400).json({ error: error.message });
    }
  },

  async update(req, res) {
    try {
      const permission = await permissionService.update(req.params.id, req.body);
      res.status(200).json(permission);
    } catch (error) {
      res.status(400).json({ error: error.message });
    }
  },

  async delete(req, res) {
    try {
      const result = await permissionService.delete(req.params.id);
      res.status(200).json(result);
    } catch (error) {
      res.status(404).json({ error: error.message });
    }
  }
};