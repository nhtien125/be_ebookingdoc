const express = require('express');
const router = express.Router();

const index = require('./index');
const auth = require('./user');
/**
 * @swagger
 * /:
 *   get:
 *     summary: Home
 *     tags: [Root]
 *     responses:
 *       200:
 *         description: Trang chủ
 */
router.get('/', index);

router.use('/auth', auth);

module.exports = router;
