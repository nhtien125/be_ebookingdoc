const express = require("express");
const router = express.Router();

router.use("/user", require("./route/user"));

module.exports = router;
