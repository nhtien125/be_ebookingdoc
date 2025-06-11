const Review = require('./../model/reviewModel');

module.exports = {
  async getAll() {
    try {
      return await Review.findAll();
    } catch (error) {
      throw new Error('Error fetching reviews: ' + error.message);
    }
  },

  async getById(uuid) {
    try {
      const review = await Review.findById(uuid);
      if (!review) {
        throw new Error('Review not found');
      }
      return review;
    } catch (error) {
      throw new Error('Error fetching review: ' + error.message);
    }
  },

  async create(data) {
    try {
      return await Review.create(data);
    } catch (error) {
      throw new Error('Error creating review: ' + error.message);
    }
  },

  async update(uuid, data) {
    try {
      const review = await Review.findById(uuid);
      if (!review) {
        throw new Error('Review not found');
      }
      return await Review.update(uuid, data);
    } catch (error) {
      throw new Error('Error updating review: ' + error.message);
    }
  },

  async delete(uuid) {
    try {
      const review = await Review.findById(uuid);
      if (!review) {
        throw new Error('Review not found');
      }
      await Review.delete(uuid);
      return { message: 'Review deleted successfully' };
    } catch (error) {
      throw new Error('Error deleting review: ' + error.message);
    }
  }
};