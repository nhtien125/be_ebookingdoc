const mysql = require("mysql2/promise");
require("dotenv").config();

const pool = mysql.createPool({
  host: process.env.MYSQL_HOST,
  user: process.env.MYSQL_USER,
  password: process.env.MYSQL_PASSWORD,
  database: process.env.MYSQL_DATABASE,
  connectionLimit: 10,
  timezone: process.env.MYSQL_TIMEZONE,
});

// Kiểm tra kết nối ngay khi khởi tạo pool
(async () => {
  try {
    const conn = await pool.getConnection();
    console.log("Kết nối MySQL thành công!");
    conn.release();
  } catch (error) {
    console.error("Lỗi kết nối MySQL:", error);
    throw error;
  }
})();

async function execute(sql, params = []) {
  try {
    // Phải log params luôn là array
    if (!Array.isArray(params)) params = [];
    console.log('==> db.execute nhận params:', params);
    const result = await pool.execute(sql, params);
    // Log ra dạng thực tế trả về
    console.log('==> db.execute trả về:', result);
    // Bảo đảm result là mảng có 2 phần tử (rows, fields)
    if (!Array.isArray(result) || result.length < 2) {
      throw new Error("Kết quả execute không hợp lệ!");
    }
    return result; // chính là [rows, fields]
  } catch (error) {
    console.error('Database execute error:', error);
    throw error;
  }
}


async function queryMultiple(sqlList, params) {
  const conn = await pool.getConnection();
  const result = [];
  try {
    for (let i = 0; i < sqlList.length; i++) {
      const [element] = await conn.query(sqlList[i], params);
      result.push(element);
    }
  } catch (error) {
    console.error("Database queryMultiple error:", error);
    throw error;
  } finally {
    conn.release();
  }
  return result;
}

module.exports = {
  execute,
  queryMultiple,
};
