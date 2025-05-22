const express = require("express");
const cors = require("cors");
const { writeFileSync } = require("fs");
require("dotenv").config();
const main = require("./route/router");
const setupSwagger = require('./route/swagger');

const app = express();
app.use(express.json());
app.use(cors());

app.get("/", (req, res) => {
  res.json({ code: 200, message: "ok" });
});

app.use("/resources", express.static(__dirname + "/resources"));
app.use("/",main);
setupSwagger(app);

// Error handler
app.use((err, req, res, next) => {
  const statusCode = err.statusCode || 500;
  writeFileSync(
    "./src/api/log/log.txt",
    `============================================================================
${new Date()}
message: ${err.message}
stack: ${err.stack}\n`,
    { flag: "a" }
  );
  res.status(statusCode).json({
    code: statusCode,
    message: err.message,
  });
});

// Start server
const port = process.env.PORT || 3000;
app.listen(port, () => {
  console.log(`Server is running at http://localhost:${port}/`);
});
