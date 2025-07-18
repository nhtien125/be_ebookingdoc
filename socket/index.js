const express = require("express");
const cors = require("cors");
const fs = require("fs").promises;
const path = require("path");
require("dotenv").config();
const main = require("./route/router");
const logger = require("morgan");
const cookieParser = require("cookie-parser");
const { Server } = require("socket.io");
const SocketService = require("./src/service/SocketService");
const updateUnpaidPayments = require("./src/service/paymentService").cancelUnpaidPayosPayments;
const AppointmentReminderCron = require("./src/cron/appointmentReminder");

const app = express();
const server = require("http").createServer(app);
const io = new Server(server, {
  cors: {
    origin: "*", // Cấu hình CORS phù hợp với frontend
    methods: ["GET", "POST"],
  },
});
const socketService = new SocketService(io); // Khởi tạo SocketService

app.use(express.json());
app.use(cors());
app.set("views", path.join(__dirname, "views"));
app.set("view engine", "hbs");
app.use(logger("dev"));
app.use(express.json());
app.use(express.urlencoded({ extended: true }));
app.use(cookieParser());
app.use(express.static(path.join(__dirname, "public")));

const logDir = path.join(__dirname, "src", "api", "log");
const logFile = path.join(logDir, "log.txt");

async function ensureLogFile() {
  try {
    await fs.mkdir(logDir, { recursive: true });
    try {
      await fs.access(logFile);
    } catch (error) {
      if (error.code === "ENOENT") {
        await fs.writeFile(logFile, "");
        console.log("Created log.txt");
      } else {
        throw error;
      }
    }
  } catch (error) {
    console.error("Error setting up log file:", error);
    throw error;
  }
}

// Cron job cho payment
const cron = require("node-cron");
cron.schedule("* * * * *", async () => {
  console.log("Checking for unpaid payments...");
  await updateUnpaidPayments();
});

// Khởi tạo log file và server
ensureLogFile()
  .then(() => {
    app.get("/", (req, res) => {
      res.json({ code: 200, message: "ok" });
    });

    app.use("/resources", express.static(path.join(__dirname, "resources")));
    app.use("/api", main);

    // Error handling middleware
    app.use(async (err, req, res, next) => {
      const statusCode = err.statusCode || 500;
      try {
        await fs.appendFile(
          logFile,
          `============================================================================
${new Date().toISOString()}
message: ${err.message}
stack: ${err.stack}\n`
        );
      } catch (logError) {
        console.error("Error writing to log file:", logError);
      }
      res.status(statusCode).json({
        code: statusCode,
        message: err.message,
      });
    });

    const port = process.env.PORT || 3000;
    server.listen(port, () => {
      console.log(`Server is running at http://localhost:${port}/`);
      AppointmentReminderCron.start();
    });
  })
  .catch((err) => {
    console.error("Failed to initialize log file:", err);
    process.exit(1);
  });

module.exports = { app, socketService }; // Export socketService để sử dụng ở NotificationService