const Clinic = require("./../model/clinicModel");
const { v4: uuidv4 } = require("uuid");
const { uploadImageToCloudinary } = require('./uploadimgame');
const validator = require("validator");
const fs = require("fs").promises;


const sanitizeInput = (value) => {
  if (typeof value !== 'string') return value;
  return value.replace(/[\n\r\t\x00-\x1F\x7F-\x9F]/g, '').trim();
};

module.exports = {
  async getAll() {
    try {
      return await Clinic.findAll();
    } catch (error) {
      throw new Error("Error fetching clinics: " + error.message);
    }
  },

  async getById(uuid) {
    try {
      const clinic = await Clinic.findById(uuid);
      if (!clinic) {
        throw new Error("Clinic not found");
      }
      return clinic;
    } catch (error) {
      throw new Error("Error fetching clinic: " + error.message);
    }
  },

  async create(data, file) {
    try {
      const { name, address, phone, email, image } = data;
      if (!name || !address || !phone || !email) {
        throw new Error("Missing required fields: name, address, phone, email");
      }
      let imageValue = null;
      if (file && file.path) {
        try {
          imageValue = await uploadImageToCloudinary(file.path, "Hospitals");
          console.log("Cloudinary upload result:", imageValue);
          await fs
            .unlink(file.path)
            .catch((err) => console.error("Error deleting local file:", err));
        } catch (uploadError) {
          console.error("Image upload error:", uploadError);
          const error = new Error("Lỗi khi upload ảnh đại diện!");
          error.statusCode = 500;
          throw error;
        }
      }
      // Trường hợp 2: Sử dụng URL trực tiếp
      else if (image && typeof image === "string") {
        console.log("Found image:", image); // Debug
        if (!validator.isURL(image)) {
          const error = new Error("URL ảnh không hợp lệ!");
          error.statusCode = 400;
          throw error;
        }
        imageValue = sanitizeInput(image);
        console.log("Assigned image from image:", imageValue); // Debug
      }
      const uuid = uuidv4().replace(/-/g, "");
      await Clinic.create({
        uuid,
        name,
        address,
        phone,
        email,
        image: imageValue,
      });
      const newClinic = await Clinic.findById(uuid);
      return newClinic;
    } catch (error) {
      throw new Error("Error creating clinic: " + error.message);
    }
  },

  async update(uuid, data) {
    try {
      const clinic = await Clinic.findById(uuid);
      if (!clinic) {
        throw new Error("Clinic not found");
      }
      return await Clinic.update(uuid, data);
    } catch (error) {
      throw new Error("Error updating clinic: " + error.message);
    }
  },

  async delete(uuid) {
    try {
      const clinic = await Clinic.findById(uuid);
      if (!clinic) {
        throw new Error("Clinic not found");
      }
      await Clinic.delete(uuid);
      return { message: "Clinic deleted successfully" };
    } catch (error) {
      throw new Error("Error deleting clinic: " + error.message);
    }
  },
};
