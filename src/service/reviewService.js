const db = require("../helper/database");
const { v4: uuidv4 } = require("uuid");
const Review = require("../model/reviewModel");

class ReviewService {
  static async getAll() {
    const [rows] = await db.execute(
      "SELECT * FROM reviews ORDER BY created_at DESC"
    );
    return Review.fromRows(rows);
  }

  static async getById(uuid) {
    const [rows] = await db.execute("SELECT * FROM reviews WHERE uuid = ?", [
      uuid,
    ]);
    if (rows.length === 0) return null;
    return Review.fromRow(rows[0]);
  }

  static async create({ user_id, doctor_id, appointment_id, stars, comment }) {
    console.log("Received create review request with:", {
      user_id,
      doctor_id,
      appointment_id,
      stars,
      comment,
    });

    if (!user_id || !doctor_id || !appointment_id || !stars) {
      console.log("Missing required fields:", {
        user_id,
        doctor_id,
        appointment_id,
        stars,
      });
      throw new Error("Missing required fields");
    }

    const normalized_appointment_id = appointment_id.replace(/-/g, "");
    const normalized_user_id = user_id.replace(/-/g, "");
    const normalized_doctor_id = doctor_id.replace(/-/g, "");

    console.log("Normalized values:", {
      normalized_user_id,
      normalized_doctor_id,
      normalized_appointment_id,
    });

    const uuid = uuidv4().replace(/-/g, "").slice(0, 32);

    try {
      const result = await db.execute(
        "INSERT INTO reviews (uuid, user_id, doctor_id, appointment_id, stars, comment, created_at, updated_at) VALUES (?, ?, ?, ?, ?, ?, NOW(), NOW())",
        [
          uuid,
          normalized_user_id,
          normalized_doctor_id,
          normalized_appointment_id,
          stars,
          comment || "",
        ]
      );
      console.log("Inserted review:", {
        uuid,
        normalized_user_id,
        normalized_doctor_id,
        normalized_appointment_id,
        stars,
        comment,
      });
      return { uuid, user_id, doctor_id, appointment_id, stars, comment };
    } catch (error) {
      console.log("Error inserting review:", error.message);
      throw error;
    }
  }

  static async update(uuid, { stars, comment }) {
    const [result] = await db.execute(
      "UPDATE reviews SET stars=?, comment=?, updated_at=NOW() WHERE uuid=?",
      [stars, comment, uuid]
    );
    return result.affectedRows > 0;
  }

  static async remove(uuid) {
    const [result] = await db.execute("DELETE FROM reviews WHERE uuid = ?", [
      uuid,
    ]);
    return result.affectedRows > 0;
  }
  static async getByDoctorId(doctor_id) {
    const [rows] = await db.execute(
      `SELECT r.*, u.name AS patient_name, u.image AS patient_avatar
FROM reviews r
JOIN user u ON r.user_id = u.uuid
WHERE r.doctor_id = ?
ORDER BY r.created_at DESC
`,
      [doctor_id]
    );
    return Review.fromRows(rows);
  }

  static async getByAppointmentId(appointment_id) {
    const normalized_appointment_id = appointment_id.replace(/-/g, "");
    const [rows] = await db.execute(
      `SELECT r.*, u.name AS patient_name, u.image AS patient_avatar
FROM reviews r
JOIN user u ON r.user_id = u.uuid
WHERE r.appointment_id = ?
ORDER BY r.created_at DESC
`,
      [normalized_appointment_id]
    );
    return Review.fromRows(rows);
  }
}
module.exports = ReviewService;
