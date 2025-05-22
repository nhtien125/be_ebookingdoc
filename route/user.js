const express = require("express");
const router = express.Router();
const controller = require("../src/controller/appointment_controller");
const UserController = require("../src/controller/user_controller");
const { checkLogin } = require("../src/api/middleware/check_login");


router.post('/login', async (req, res) => {
  try {
    await UserController.login(req, res);
  } catch (error) {
    console.error('Lỗi', error);
    res.status(error.statusCode || 500).json({
      code: error.statusCode || 500,
      message: error.message || 'Đã xảy ra lỗi server khi đăng nhập!',
    });
  }
});

router.post('/register', async (req, res) => {
  try {
    await UserController.register(req, res);
  } catch (error) {
    console.error('Lỗi', error);
    res.status(error.statusCode || 500).json({
      code: error.statusCode || 500,
      message: error.message || 'Đã xảy ra lỗi server khi đăng ký!',
    });
  }
});

router.post("/me", checkLogin, async (req, res, next) => {
  try {
    res.json(await controller.getDetailInfo(req.payload.id));
  } catch (error) {
    next(error);
  }
});



router.post("/refresh-token", async (req, res, next) => {
  try {
    res.json(await controller.refreshToken(req.body));
  } catch (error) {
    next(error);
  }
});

router.put("/me", checkLogin, async (req, res, next) => {
  try {
    res.json(await controller.updateProfile(req.payload.id, req.body));
  } catch (error) {
    next(error);
  }
});

router.put("/change-password", checkLogin, async (req, res, next) => {
  try {
    res.json(await controller.changePassword(req.payload.id, req.body));
  } catch (error) {
    next(error);
  }
});

router.put("/change-status", checkLogin, async (req, res, next) => {
  try {
    res.json(await controller.changeStatus(req.payload.id, req.body));
  } catch (error) {
    next(error);
  }
});

module.exports = router;
