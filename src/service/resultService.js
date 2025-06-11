const Result = require('./../model/resultModel');

module.exports = {
  async getAll() {
    try {
      return await Result.findAll();
    } catch (error) {
      throw new Error('Error fetching results: ' + error.message);
    }
  },

  async getById(uuid) {
    try {
      const result = await Result.findById(uuid);
      if (!result) {
        throw new Error('Result not found');
      }
      return result;
    } catch (error) {
      throw new Error('Error fetching result: ' + error.message);
    }
  },

  async create(data) {
    try {
      return await Result.create(data);
    } catch (error) {
      throw new Error('Error creating result: ' + error.message);
    }
  },

  async update(uuid, data) {
    try {
      const result = await Result.findById(uuid);
      if (!result) {
        throw new Error('Result not found');
      }
      return await Result.update(uuid, data);
    } catch (error) {
      throw new Error('Error updating result: ' + error.message);
    }
  },

  async delete(uuid) {
    try {
      const result = await Result.findById(uuid);
      if (!result) {
        throw new Error('Result not found');
      }
      await Result.delete(uuid);
      return { message: 'Result deleted successfully' };
    } catch (error) {
      throw new Error('Error deleting result: ' + error.message);
    }
  }
};