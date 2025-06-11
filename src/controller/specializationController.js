const SpecializationService = require('../service/specializationService');

class SpecializationController {
  static async getAll(req, res, next) {
    try {
      const result = await SpecializationService.getAll();
      res.status(result.code).json(result);
    } catch (err) {
      next(err);
    }
  }

  static async getById(req, res, next) {
    try {
      const result = await SpecializationService.getById(req.params.id);
      res.status(result.code).json(result);
    } catch (err) {
      next(err);
    }
  }

  static async create(req, res, next) {
    try {
      const result = await SpecializationService.create(req.body);
      res.status(result.code).json(result);
    } catch (err) {
      next(err);
    }
  }

  static async update(req, res, next) {
    try {
      const result = await SpecializationService.update(req.params.id, req.body);
      res.status(result.code).json(result);
    } catch (err) {
      next(err);
    }
  }

  static async delete(req, res, next) {
    try {
      const result = await SpecializationService.delete(req.params.id);
      res.status(result.code).json(result);
    } catch (err) {
      next(err);
    }
  }
}

module.exports = SpecializationController;
