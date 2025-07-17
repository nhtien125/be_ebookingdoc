const db = require("../helper/database");
const { v4: uuidv4 } = require("uuid");
const Schedule = require("../model/scheduleModel");

class ScheduleService {
  static async getAll() {
    const [rows] = await db.execute(
      "SELECT * FROM schedules ORDER BY work_date DESC, start_time ASC"
    );
    return Schedule.fromRows(rows);
  }

  static async getById(uuid) {
    const [rows] = await db.execute("SELECT * FROM schedules WHERE uuid = ?", [
      uuid,
    ]);
    if (rows.length === 0) return null;
    return Schedule.fromRow(rows[0]);
  }

  static async getByDoctorId(doctor_id) {
    const [rows] = await db.execute(
      "SELECT * FROM schedules WHERE doctor_id = ? ORDER BY work_date DESC, start_time ASC",
      [doctor_id]
    );
    return Schedule.fromRows(rows);
  }

  // Thêm method kiểm tra doctor tồn tại
  static async validateDoctor(doctor_id) {
    const [rows] = await db.execute("SELECT uuid FROM doctors WHERE uuid = ?", [doctor_id]);
    return rows.length > 0;
  }

  static async create({ doctor_id, work_date, start_time, end_time }) {
    // Kiểm tra doctor có tồn tại không
    const doctorExists = await this.validateDoctor(doctor_id);
    if (!doctorExists) {
      throw new Error("Doctor không tồn tại trong hệ thống");
    }

    // Kiểm tra overlap
    const isOverlap = await this.isOverlapped({
      doctor_id,
      work_date,
      start_time,
      end_time,
    });
    if (isOverlap) {
      throw new Error("Thời gian đã bị trùng lịch với một ca khác!");
    }

    const uuid = uuidv4().replace(/-/g, "").slice(0, 32);
    await db.execute(
      `INSERT INTO schedules (uuid, doctor_id, work_date, start_time, end_time, created_at, updated_at)
      VALUES (?, ?, ?, ?, ?, NOW(), NOW())`,
      [uuid, doctor_id, work_date, start_time, end_time]
    );
    return { uuid, doctor_id, work_date, start_time, end_time };
  }

  static async update(uuid, { doctor_id, work_date, start_time, end_time }) {
    // Kiểm tra doctor có tồn tại không
    const doctorExists = await this.validateDoctor(doctor_id);
    if (!doctorExists) {
      throw new Error("Doctor không tồn tại trong hệ thống");
    }

    // Kiểm tra overlap, loại trừ chính lịch này
    const isOverlap = await this.isOverlapped({
      doctor_id,
      work_date,
      start_time,
      end_time,
      exclude_uuid: uuid,
    });
    if (isOverlap) {
      throw new Error("Thời gian đã bị trùng lịch với một ca khác!");
    }

    const [result] = await db.execute(
      `UPDATE schedules SET doctor_id=?, work_date=?, start_time=?, end_time=?, updated_at=NOW() WHERE uuid=?`,
      [doctor_id, work_date, start_time, end_time, uuid]
    );
    return result.affectedRows > 0;
  }

  static async remove(uuid) {
    const [result] = await db.execute("DELETE FROM schedules WHERE uuid = ?", [
      uuid,
    ]);
    return result.affectedRows > 0;
  }

  /**
   * Kiểm tra lịch mới có bị overlap với lịch đã có không.
   * @param {Object} param0
   * @returns {Boolean} true nếu bị trùng, false nếu không trùng
   */
  static async isOverlapped({
    doctor_id,
    work_date,
    start_time,
    end_time,
    exclude_uuid = null,
  }) {
    let sql = `
      SELECT 1 FROM schedules
      WHERE doctor_id = ?
        AND work_date = ?
        AND (
          (start_time < ? AND end_time > ?) -- lịch mới bắt đầu trong 1 lịch đã có
          OR
          (start_time < ? AND end_time > ?) -- lịch mới kết thúc trong 1 lịch đã có
          OR
          (start_time >= ? AND end_time <= ?) -- lịch mới nằm hoàn toàn trong lịch đã có
          OR
          (start_time <= ? AND end_time >= ?) -- lịch đã có nằm hoàn toàn trong lịch mới
        )
    `;
    let params = [
      doctor_id,
      work_date,
      end_time,
      start_time,
      end_time,
      end_time,
      start_time,
      end_time,
      start_time,
      end_time,
    ];
    if (exclude_uuid) {
      sql += " AND uuid != ?";
      params.push(exclude_uuid);
    }
    const [rows] = await db.execute(sql, params);
    return rows.length > 0;
  }
}

module.exports = ScheduleService;