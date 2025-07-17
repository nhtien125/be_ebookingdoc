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

(async () => {
  try {
    const conn = await pool.getConnection();
    await conn.query('SELECT 1');  
    conn.release();
  } catch (error) {
    console.error("Lỗi kết nối MySQL:", error);
    process.exit(1); 
  }
})();

async function execute(sql, params = []) {
  try {
    if (!Array.isArray(params)) params = [];
    const result = await pool.execute(sql, params);
    return result; 
  } catch (error) {
    throw error; 
  }
}

module.exports = {
  execute,
};
