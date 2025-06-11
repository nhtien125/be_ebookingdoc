const Doctor = require('../../src/model/doctorModel');
const Specialization = require('../../src/model/specializationModel'); // Giả định model cho bảng specializations
const { v4: uuidv4 } = require('uuid');

module.exports = {
async createDoctor(data) {
  try {
    const { user_id, doctor_type, specialization_id, license, introduce } = data;
    if (!user_id || !doctor_type || !specialization_id || !license || !introduce) {
      throw new Error('Thiếu các trường bắt buộc');
    }
    const existingDoctor = await Doctor.findByUserId(user_id);
    if (existingDoctor) {
      throw new Error('Người dùng này đã được liên kết với một bác sĩ');
    }
    const specialization = await Specialization.findById(specialization_id);
    if (!specialization) {
      throw new Error('Chuyên khoa không tồn tại');
    }
    const existingLicense = await Doctor.findByLicense(license);
    if (existingLicense) {
      throw new Error('Giấy phép hành nghề đã được sử dụng');
    }
    const uuid = uuidv4().replace(/-/g, '');
    await Doctor.create({ uuid, user_id, doctor_type, specialization_id, license, introduce });
    const newDoctor = await Doctor.findById(uuid);
    return newDoctor;
  } catch (error) {
    console.error('Lỗi khi tạo bác sĩ:', error);
    throw new Error(error.message || 'Không thể tạo bác sĩ');
  }
},
  async getAllDoctors() {
    try {
      const doctors = await Doctor.findAll();
      return doctors;
    } catch (error) {
      console.error('Lỗi khi lấy danh sách bác sĩ:', error);
      throw new Error('Không thể lấy danh sách bác sĩ');
    }
  },

  async getDoctorById(uuid) {
    try {
      const doctor = await Doctor.findById(uuid);
      if (!doctor) {
        throw new Error('Không tìm thấy bác sĩ');
      }
      return doctor;
    } catch (error) {
      console.error(`Lỗi khi lấy thông tin bác sĩ với uuid ${uuid}:`, error);
      throw new Error(error.message || 'Không thể lấy thông tin bác sĩ');
    }
  },

  async updateDoctor(uuid, data) {
    try {
      const doctor = await Doctor.findById(uuid);
      if (!doctor) {
        throw new Error('Không tìm thấy bác sĩ');
      }
      await Doctor.update(uuid, data);
      const updatedDoctor = await Doctor.findById(uuid);
      return updatedDoctor;
    } catch (error) {
      console.error(`Lỗi khi cập nhật bác sĩ với uuid ${uuid}:`, error);
      throw new Error(error.message || 'Không thể cập nhật bác sĩ');
    }
  },

  async deleteDoctor(uuid) {
    try {
      const doctor = await Doctor.findById(uuid);
      if (!doctor) {
        throw new Error('Không tìm thấy bác sĩ');
      }
      await Doctor.delete(uuid);
      return doctor;
    } catch (error) {
      console.error(`Lỗi khi xóa bác sĩ với uuid ${uuid}:`, error);
      throw new Error(error.message || 'Không thể xóa bác sĩ');
    }
  },
};