const Package = require('./../model/packageModel');

module.exports = {
  async getAll() {
    try {
      return await Package.findAll();
    } catch (error) {
      throw new Error('Error fetching packages: ' + error.message);
    }
  },

  async getById(uuid) {
    try {
      const pkg = await Package.findById(uuid);
      if (!pkg) {
        throw new Error('Package not found');
      }
      return pkg;
    } catch (error) {
      throw new Error('Error fetching package: ' + error.message);
    }
  },

  async create(data) {
    try {
      return await Package.create(data);
    } catch (error) {
      throw new Error('Error creating package: ' + error.message);
    }
  },

  async update(uuid, data) {
    try {
      const pkg = await Package.findById(uuid);
      if (!pkg) {
        throw new Error('Package not found');
      }
      return await Package.update(uuid, data);
    } catch (error) {
      throw new Error('Error updating package: ' + error.message);
    }
  },

  async delete(uuid) {
    try {
      const pkg = await Package.findById(uuid);
      if (!pkg) {
        throw new Error('Package not found');
      }
      await Package.delete(uuid);
      return { message: 'Package deleted successfully' };
    } catch (error) {
      throw new Error('Error deleting package: ' + error.message);
    }
  }
};