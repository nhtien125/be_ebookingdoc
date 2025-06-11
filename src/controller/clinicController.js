
const clinicService = require('../../src/service/clinicService');

module.exports = {

  async getAll(req, res) {
    try {
      const clinics = await clinicService.getAll();
     res
        .status(200)
        .json({ code: 200, message: "Thành công", data: clinics });
    } catch (error) {
      res.status(500).json({ error: error.message });
    }
  },
  async getById(req, res) {
    try {
      const clinic = await clinicService.getById(req.params.id);
      res.status(200).json(clinic);
    } catch (error) {
      res.status(404).json({ error: error.message });
    }
  },

  async create(req, res) {
  try {
    const { name, address, phone, email, image } = req.body;
    if (!name || !address || !phone || !email) {
      return res.status(400).json({ error: 'Missing required fields: name, address, phone, email' });
    }

    console.log("req.body:", req.body);
    console.log("req.file:", req.file);

    const clinic = await clinicService.create({ name, address, phone, email, image }, req.file);

    console.log("Created clinic:", clinic); // Log kiểm tra

    res.status(200).json({ code: 200, message: "Thành công", data: clinic });
  } catch (error) {
    console.error("Error in create:", error);
    res.status(400).json({ error: error.message });
  }
},

  async update(req, res) {
    try {
      const clinic = await clinicService.update(req.params.id, req.body);
      res.status(200).json(clinic);
    } catch (error) {
      res.status(400).json({ error: error.message });
    }
  },

  async delete(req, res) {
    try {
      const result = await clinicService.delete(req.params.id);
      res.status(200).json(result);
    } catch (error) {
      res.status(404).json({ error: error.message });
    }
  }
};