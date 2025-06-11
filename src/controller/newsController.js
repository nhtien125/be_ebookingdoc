const newsService = require('./../service/newsService');

module.exports = {
  async getAll(req, res) {
    try {
      const news = await newsService.getAll();
      res.status(200).json(news);
    } catch (error) {
      res.status(500).json({ error: error.message });
    }
  },

  async getById(req, res) {
    try {
      const news = await newsService.getById(req.params.id);
      res.status(200).json(news);
    } catch (error) {
      res.status(404).json({ error: error.message });
    }
  },

  async create(req, res) {
    try {
      const news = await newsService.create(req.body);
      res.status(201).json(news);
    } catch (error) {
      res.status(400).json({ error: error.message });
    }
  },

  async update(req, res) {
    try {
      const news = await newsService.update(req.params.id, req.body);
      res.status(200).json(news);
    } catch (error) {
      res.status(400).json({ error: error.message });
    }
  },

  async delete(req, res) {
    try {
      const result = await newsService.delete(req.params.id);
      res.status(200).json(result);
    } catch (error) {
      res.status(404).json({ error: error.message });
    }
  }
};