const express = require("express");
const router = express.Router();
const controller = require("../controller/permission_controller");
const { checkLogin } = require("../../middleware/check_login");

router.get("/", checkLogin, async (req, res, next) => {
    try {
      res.json(await controller.getPermission());
    } catch (error) {
      next(error);
    }
  });

  router.post("/create-permission", checkLogin, async (req, res, next) => {
    try {
      res.json(await controller.createPermission(req.body));
    } catch (error) {
      next(error);
    }
  });



  

module.exports = router;