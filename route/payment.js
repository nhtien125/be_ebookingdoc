const express = require("express");
const PayOS = require("@payos/node");
const router = express.Router();
const db = require("../src/helper/database");

const payos = new PayOS(
  "9643ef8f-e07f-4405-8248-211f9b59adb2",
  "607fff9d-d752-441e-b55c-4d712afbe0fa",
  "2094e0b06f2b8f9f1aa9b7155f2126f1ee0d2fa90d461c2dcf77abb4dd586418"
);

const YOUR_DOMAIN = "http://192.168.1.17:3210/api";
const fixedAmount = 10000;

// Tạo payment link
router.post("/create-payment-link", async (req, res) => {
  const { amount, orderId, description, fullname, phone, email ,payment_id} = req.body;
  const orderCode = Number(orderId);
  if (!orderId || isNaN(orderCode) || orderCode <= 0) {
    return res
      .status(400)
      .json({ message: "orderId must be a positive number." });
  }

  const order = {
    amount: fixedAmount, // Chỉ truyền đúng 10k
    description: description || "No description provided",
    orderCode: orderCode,
    returnUrl: `${YOUR_DOMAIN}/payment/success?orderId=${orderCode}`,
    cancelUrl: `${YOUR_DOMAIN}/payment/cancel?orderId=${orderCode}`,
    redirectUrl: `${YOUR_DOMAIN}/payment/success?orderId=${orderCode}`,
  };

  try {
    console.log("Order details:", order);
    const paymentLink = await payos.createPaymentLink(order);
    console.log("Payment link created:", paymentLink);

    if (
      paymentLink &&
      typeof paymentLink === "object" &&
      paymentLink.checkoutUrl
    ) {
      const sql = `
        INSERT INTO payos_payments
        (amount, payment_code, description, redirectUrl, status, fullname, phone, email,payment_id)
        VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)
      `;
      const params = [
        amount,
        orderCode,
        description || "No description provided",
        order.redirectUrl,
        1, // 1 = đang chờ/thanh toán
        fullname,
        phone,
        email,
        payment_id, 
      ];
      await db.execute(sql, params);

      res.status(201).json({ paymentLink: paymentLink.checkoutUrl });
    } else {
      res.status(500).json({ message: "Không tạo được payment link!" });
    }
  } catch (error) {
    console.error("Error creating payment link:", error);
    res
      .status(500)
      .json({ message: "Failed to create payment link", error: error.message });
  }
});

// Thanh toán thành công
router.get("/success", async (req, res) => {
  const { orderId } = req.query;

  if (!orderId) {
    return res.status(400).send("orderId is required.");
  }

  try {
    const [rows] = await db.execute(
      "SELECT * FROM payos_payments WHERE payment_code = ? LIMIT 1",
      [orderId]
    );

    if (rows.length > 0) {
      await db.execute(
        "UPDATE payos_payments SET status = 0 WHERE payment_code = ?",
        [orderId]
      );

      res
        .status(200)
        .send(`Thanh toán thành công với số tiền: ${rows[0].amount} VNĐ.`);
    } else {
      res.status(404).send("Không tìm thấy đơn hàng.");
    }
  } catch (error) {
    console.error("Error updating payment status:", error);
    res.status(500).send("Có lỗi xảy ra khi cập nhật trạng thái thanh toán.");
  }
});

// Thanh toán hủy/bỏ
router.get("/cancel", async (req, res) => {
  const { orderId } = req.query;
  if (!orderId) {
    return res.status(400).send("orderId is required.");
  }

  try {
    const [rows] = await db.execute(
      "SELECT * FROM payos_payments WHERE payment_code = ? LIMIT 1",
      [orderId]
    );

    if (rows.length > 0) {
      await db.execute(
        "UPDATE payos_payments SET status = 2 WHERE payment_code = ?",
        [orderId]
      );

      res.status(200).send("Thanh toán đã bị hủy.");
    } else {
      res.status(404).send("Không tìm thấy đơn hàng.");
    }
  } catch (error) {
    console.error("Error updating payment status:", error);
    res.status(500).send("Có lỗi xảy ra khi cập nhật trạng thái thanh toán.");
  }
});

module.exports = router;
