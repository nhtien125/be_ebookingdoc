const Schedule = require('./../model/scheduleModel');

module.exports = {
  async getAll() {
    try {
      return await Schedule.findAll();
    } catch (error) {
      throw new Error('Error fetching schedules: ' + error.message);
    }
  },

  async getById(uuid) {
    try {
      const schedule = await Schedule.findById(uuid);
      if (!schedule) {
        throw new Error('Schedule not found');
      }
      return schedule;
    } catch (error) {
      throw new Error('Error fetching schedule: ' + error.message);
    }
  },

  async create(data) {
    try {
      return await Schedule.create(data);
    } catch (error) {
      throw new Error('Error creating schedule: ' + error.message);
    }
  },

  async update(uuid, data) {
    try {
      const schedule = await Schedule.findById(uuid);
      if (!schedule) {
        throw new Error('Schedule not found');
      }
      return await Schedule.update(uuid, data);
    } catch (error) {
      throw new Error('Error updating schedule: ' + error.message);
    }
  },

  async delete(uuid) {
    try {
      const schedule = await Schedule.findById(uuid);
      if (!schedule) {
        throw new Error('Schedule not found');
      }
      await Schedule.delete(uuid);
      return { message: 'Schedule deleted successfully' };
    } catch (error) {
      throw new Error('Error deleting schedule: ' + error.message);
    }
  }
};