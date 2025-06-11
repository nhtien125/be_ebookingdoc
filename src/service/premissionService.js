const Permission = require('../model/premissionModel');

module.exports = {
  async getAll() {
    try {
      return await Permission.findAll();
    } catch (error) {
      throw new Error('Error fetching permission: ' + error.message);
    }
  },

  async getById(uuid) {
    try {
      const permission = await Permission.findById(uuid);
      if (!permission) {
        throw new Error('Permission not found');
      }
      return permission;
    } catch (error) {
      throw new Error('Error fetching permission: ' + error.message);
    }
  },

  async create(data) {
    try {
      return await Permission.create(data);
    } catch (error) {
      throw new Error('Error creating permission: ' + error.message);
    }
  },

  async update(uuid, data) {
    try {
      const permission = await Permission.findById(uuid);
      if (!permission) {
        throw new Error('Permission not found');
      }
      return await Permission.update(uuid, data);
    } catch (error) {
      throw new Error('Error updating permission: ' + error.message);
    }
  },

  async delete(uuid) {
    try {
      const permission = await Permission.findById(uuid);
      if (!permission) {
        throw new Error('Permission not found');
      }
      await Permission.delete(uuid);
      return { message: 'Permission deleted successfully' };
    } catch (error) {
      throw new Error('Error deleting permission: ' + error.message);
    }
  }
};