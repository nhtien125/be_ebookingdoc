const express = require("express");
const router = express.Router();
const controller = require("../controller/test_controller");
const { checkLogin } = require("../../middleware/check_login");

router.get("/", async (req, res, next) => {
  try {
    res.json(await controller.testapi());
  } catch (error) {
    next(error);
  }
});

router.post("/check", checkLogin, async (req, res, next) => {
    try {
      res.json(await controller.testapi());
    } catch (error) {
      next(error);
    }
  });

module.exports = router;