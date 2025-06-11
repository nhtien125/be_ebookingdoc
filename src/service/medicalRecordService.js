const MedicalRecord = require('./../model/medicalRecordModel');

module.exports = {
  async getAll() {
    try {
      return await MedicalRecord.findAll();
    } catch (error) {
      throw new Error('Error fetching medical records: ' + error.message);
    }
  },

  async getById(uuid) {
    try {
      const medicalRecord = await MedicalRecord.findById(uuid);
      if (!medicalRecord) {
        throw new Error('Medical record not found');
      }
      return medicalRecord;
    } catch (error) {
      throw new Error('Error fetching medical record: ' + error.message);
    }
  },

  async create(data) {
    try {
      return await MedicalRecord.create(data);
    } catch (error) {
      throw new Error('Error creating medical record: ' + error.message);
    }
  },

  async update(uuid, data) {
    try {
      const medicalRecord = await MedicalRecord.findById(uuid);
      if (!medicalRecord) {
        throw new Error('Medical record not found');
      }
      return await MedicalRecord.update(uuid, data);
    } catch (error) {
      throw new Error('Error updating medical record: ' + error.message);
    }
  },

  async delete(uuid) {
    try {
      const medicalRecord = await MedicalRecord.findById(uuid);
      if (!medicalRecord) {
        throw new Error('Medical record not found');
      }
      await MedicalRecord.delete(uuid);
      return { message: 'Medical record deleted successfully' };
    } catch (error) {
      throw new Error('Error deleting medical record: ' + error.message);
    }
  }
};