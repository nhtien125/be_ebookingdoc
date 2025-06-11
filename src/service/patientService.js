const Patient = require('./../model/patientModel');

module.exports = {
  async getAll() {
    try {
      return await Patient.findAll();
    } catch (error) {
      throw new Error('Error fetching patients: ' + error.message);
    }
  },

  async getById(uuid) {
    try {
      const patient = await Patient.findById(uuid);
      if (!patient) {
        throw new Error('Patient not found');
      }
      return patient;
    } catch (error) {
      throw new Error('Error fetching patient: ' + error.message);
    }
  },

  async create(data) {
    try {
      return await Patient.create(data);
    } catch (error) {
      throw new Error('Error creating patient: ' + error.message);
    }
  },

  async update(uuid, data) {
    try {
      const patient = await Patient.findById(uuid);
      if (!patient) {
        throw new Error('Patient not found');
      }
      return await Patient.update(uuid, data);
    } catch (error) {
      throw new Error('Error updating patient: ' + error.message);
    }
  },

  async delete(uuid) {
    try {
      const patient = await Patient.findById(uuid);
      if (!patient) {
        throw new Error('Patient not found');
      }
      await Patient.delete(uuid);
      return { message: 'Patient deleted successfully' };
    } catch (error) {
      throw new Error('Error deleting patient: ' + error.message);
    }
  }
};