const News = require('../model/newsModel');

module.exports = {
  async getAll() {
    try {
      return await News.findAll();
    } catch (error) {
      throw new Error('Error fetching news: ' + error.message);
    }
  },

  async getById(uuid) {
    try {
      const news = await News.findById(uuid);
      if (!news) {
        throw new Error('News not found');
      }
      return news;
    } catch (error) {
      throw new Error('Error fetching news: ' + error.message);
    }
  },

  async create(data) {
    try {
      return await News.create(data);
    } catch (error) {
      throw new Error('Error creating news: ' + error.message);
    }
  },

  async update(uuid, data) {
    try {
      const news = await News.findById(uuid);
      if (!news) {
        throw new Error('News not found');
      }
      return await News.update(uuid, data);
    } catch (error) {
      throw new Error('Error updating news: ' + error.message);
    }
  },

  async delete(uuid) {
    try {
      const news = await News.findById(uuid);
      if (!news) {
        throw new Error('News not found');
      }
      await News.delete(uuid);
      return { message: 'News deleted successfully' };
    } catch (error) {
      throw new Error('Error deleting news: ' + error.message);
    }
  }
};