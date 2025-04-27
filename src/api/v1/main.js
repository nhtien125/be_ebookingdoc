const express = require("express");
const router = express.Router();

router.use("/user", require("./route/user"));
router.use("/test", require("./route/test"));
router.use("/permission", require("./route/permission"));

module.exports = router;
