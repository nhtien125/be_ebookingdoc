const { v4: uuidv4 } = require('uuid');
const Specialization = require('./../model/specializationModel');

class SpecializationService {
  static async getAll() {
    try {
      const data = await Specialization.findAll();
      return { code: 200, data, message: 'Lấy danh sách chuyên môn thành công' };
    } catch (error) {
      console.error('Lỗi tại SpecializationService.layTatCa:', error);
      throw new Error('Không thể lấy danh sách chuyên môn');
    }
  }

  static async getById(uuid) {
    try {
      const data = await Specialization.findById(uuid);
      if (!data) {
        const error = new Error('Không tìm thấy chuyên môn');
        error.statusCode = 404;
        throw error;
      }
      return { code: 200, data, message: 'Lấy thông tin chuyên môn thành công' };
    } catch (error) {
      console.error('Lỗi tại SpecializationService.layTheoId:', error);
      throw error;
    }
  }

  static async create(body) {
    try {
      const checkname = await Specialization.findByName(body.name);
      if (checkname) {
        return {
          code: 300,
          message: 'Chuyên môn đã tồn tại',
          data: checkname
        };
      }
      const uuid = uuidv4().replace(/-/g, '');
      await Specialization.create({
        uuid,
        name: body.name
      });

      return { code: 200, message: 'Tạo chuyên môn thành công' };
    } catch (error) {
      console.error('Lỗi tại SpecializationService.create:', error);
      throw new Error('Không thể tạo chuyên môn');
    }
  }


  static async update(uuid, body) {
    try {
      const tonTai = await Specialization.findById(uuid);
      if (!tonTai) {
        const error = new Error('Không tìm thấy chuyên môn');
        error.statusCode = 404;
        throw error;
      }
      await Specialization.update(uuid, body);
      return { code: 200, message: 'Cập nhật chuyên môn thành công' };
    } catch (error) {
      console.error('Lỗi tại SpecializationService.capNhat:', error);
      throw error;
    }
  }

  static async delete(uuid) {
    try {
      const tonTai = await Specialization.findById(uuid);
      if (!tonTai) {
        const error = new Error('Không tìm thấy chuyên môn');
        error.statusCode = 404;
        throw error;
      }
      await Specialization.delete(uuid);
      return { code: 200, message: 'Xoá chuyên môn thành công' };
    } catch (error) {
      console.error('Lỗi tại SpecializationService.xoa:', error);
      throw error;
    }
  }
}

module.exports = SpecializationService;
