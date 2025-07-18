const express = require("express");
const router = express.Router();
const UserController = require("../src/controller/user_controller");
const { checkLogin } = require("../src/api/middleware/check_login");
const appointmentController = require("../src/controller/appointmentController");
const doctorController = require("../src/controller/doctorController");
const SpecializationController = require("../src/controller/specializationController");
const clinicController = require("../src/controller/clinicController");
const medicalRecordController = require("../src/controller/medicalRecordController");
const patientController = require("../src/controller/patientController");
const premissionController = require("../src/controller/premissionController");
const reviewController = require("../src/controller/reviewController");
const scheduleController = require("../src/controller/scheduleController");
const hospitalController = require("../src/controller/hospitalController");
const multer = require("multer");
const upload = multer({ dest: "uploads/" });
const MedicalServiceController = require("../src/controller/medicalserviceController");
const SelectProfileController = require("../src/controller/SelectProfileController");
const ArticleController = require("../src/controller/ArticleController");
const CarouselItemController = require("../src/controller/CarouselItemController");
const vaccinationCenterController = require("../src/controller/vaccinationCenterController");
const PaymentController = require("../src/controller/paymentController");
const notificationController = require("../src/controller/NotificationController");
const DoctorRevenueController = require('../src/controller/DoctorRevenueController');

const payment = require("./payment");
const asyncHandler = (fn) => (req, res, next) => {
  Promise.resolve(fn(req, res, next)).catch(next);
};

router.get("/", function (req, res, next) {
  res.render("index", { title: "Express" });
});

// Auth
const auth = "auth";
router.post(`/${auth}/login`, asyncHandler(UserController.login));
router.post(`/${auth}/register`, asyncHandler(UserController.register));
router.post(`/${auth}/me`, asyncHandler(UserController.getDetailInfo));
router.put(`/${auth}/update/:uuid`, asyncHandler(UserController.updateProfile));
router.get(`/${auth}/getById/:id`, asyncHandler(UserController.getById));
router.get(`/${auth}/getAll`, asyncHandler(UserController.getAll));

// Doctor
const doctor = "doctor";
router.get(`/${doctor}/getAll`, doctorController.getAll);
router.get(`/${doctor}/getById/:id`, doctorController.getById);
router.post(`/${doctor}/add`, doctorController.create);
router.put(`/${doctor}/update/:id`, doctorController.update);
router.delete(`/${doctor}/delete/:id`, doctorController.delete);
router.get(`/${doctor}/getByUserId/:userId`, doctorController.getByUserId);
router.put(`/${doctor}/updateStatus/:uuid`, doctorController.updateStatus);
router.get(`/${doctor}/getStatus/:status`, doctorController.getByStatus);

// Payment
const pay = "payment";
router.get(`/${pay}/getAll`, PaymentController.getAll);
router.get(`/${pay}/getById/:id`, PaymentController.getById);
router.post(`/${pay}/add`, PaymentController.create);
router.put(`/${pay}/update/:id`, PaymentController.update);
router.delete(`/${pay}/delete/:id`, PaymentController.delete);
router.post(`/${pay}/update-status/:uuid`, PaymentController.updateStatus);
router.get(`/${pay}/getByUserId/:userId`, PaymentController.getByUserId);
router.get(
  `/${pay}/getByAppointmentId/:appointmentId`,
  PaymentController.getByAppointmentId
);

// Specialization
const specialization = "specialization";
router.get(`/${specialization}/getAll`, SpecializationController.getAll);
router.get(`/${specialization}/getById/:id`, SpecializationController.getById);
router.post(`/${specialization}/add`, SpecializationController.create);
router.put(`/${specialization}/update/:id`, SpecializationController.update);
router.delete(`/${specialization}/delete/:id`, SpecializationController.delete);

// Clinic
const clinic = "clinic";
router.get(`/${clinic}/getAll`, clinicController.getAll);
router.get(`/${clinic}/getById/:id`, clinicController.getById);
router.post(`/${clinic}/add`, upload.single("image"), clinicController.create);
router.put(`/${clinic}/update/:id`, clinicController.update);
router.delete(`/${clinic}/delete/:id`, clinicController.delete);

// vaccinationCenter
const vc = "vaccination-center";
router.get(`/${vc}/getAll`, vaccinationCenterController.getAll);
router.get(`/${vc}/getById/:id`, vaccinationCenterController.getById);
router.post(
  `/${vc}/add`,
  upload.single("image"),
  vaccinationCenterController.create
);
router.put(
  `/${vc}/update/:uuid`,
  upload.single("image"),
  vaccinationCenterController.update
);
router.delete(`/${vc}/delete/:id`, vaccinationCenterController.delete);

// Appointment
const appointment = "appointment";
router.get(`/${appointment}/getAll`, appointmentController.getAll);
router.get(`/${appointment}/getById/:uuid`, appointmentController.getById);
router.post(`/${appointment}/add`, appointmentController.create);
router.put(`/${appointment}/update/:id`, appointmentController.update);
router.delete(`/${appointment}/delete/:id`, appointmentController.delete);
router.get(
  `/${appointment}/getByUserId/:userId`,
  appointmentController.getByUserId
);
router.get(
  `/${appointment}/getByDoctorId/:doctorId`,
  appointmentController.getByDoctorId
);
router.put(
  `/${appointment}/updateStatus/:uuid`,
  appointmentController.updateStatus
);

// Medical Record
const medicalRecord = "medicalRecord";
router.get(`/${medicalRecord}/getAll`, medicalRecordController.getAll);
router.get(`/${medicalRecord}/getById/:id`, medicalRecordController.getById);
router.post(`/${medicalRecord}/add`, medicalRecordController.create);
router.put(`/${medicalRecord}/update/:id`, medicalRecordController.update);
router.delete(`/${medicalRecord}/delete/:id`, medicalRecordController.delete);

// Patient
const patient = "patient";
router.get(`/${patient}/getAll`, patientController.getAll);
router.get(`/${patient}/getById/:id`, patientController.getById);
router.post(`/${patient}/add`, patientController.create);
router.put(`/${patient}/update/:id`, patientController.update);
router.delete(`/${patient}/delete/:id`, patientController.delete);
router.get(`/${patient}/byUser/:userId`, patientController.getByUserId);

// Permission
const permission = "premission";
router.get(`/${permission}/getAll`, premissionController.getAll);
router.get(`/${permission}/getById/:id`, premissionController.getById);
router.post(`/${permission}/add`, premissionController.create);
router.put(`/${permission}/update/:id`, premissionController.update);
router.delete(`/${permission}/delete/:id`, premissionController.delete);

// Review
const review = "review";
router.get(`/${review}/getAll`, reviewController.getAll);
router.get(`/${review}/getById/:id`, reviewController.getById);
router.post(`/${review}/add`, reviewController.create);
router.put(`/${review}/update/:id`, reviewController.update);
router.delete(`/${review}/delete/:id`, reviewController.delete);
router.get(
  `/${review}/getByDoctorId/:doctorId`,
  reviewController.getByDoctorId
);
router.get(
  `/${review}/getByAppointmentId/:appointmentId`,
  reviewController.getByAppointmentId
)

// Schedule
const schedule = "schedule";
router.get(`/${schedule}/getAll`, scheduleController.getAll);
router.get(`/${schedule}/getById/:id`, scheduleController.getById);
router.post(`/${schedule}/add`, scheduleController.create);
router.put(`/${schedule}/update/:id`, scheduleController.update);
router.delete(`/${schedule}/delete/:id`, scheduleController.delete);
router.get(`/${schedule}/doctor/:doctor_id`, scheduleController.getByDoctorId);

// hospital
const hospital = "hospital";
router.get(`/${hospital}/getAll`, hospitalController.getAll);
router.get(`/${hospital}/getById/:uuid`, hospitalController.getById);
router.post(
  `/${hospital}/add`,
  upload.single("image"),
  hospitalController.create
);
router.put(
  "/hospital/update/:uuid",
  upload.single("image"),
  hospitalController.update
);
// router.delete(`/${hospital}/delete/:id`, hospitalController.delete);
router.delete("/hospital/delete/:uuid", hospitalController.delete);

const medical_service = "medical_service";
router.get(`/${medical_service}/getAll`, MedicalServiceController.getAll);
router.get(
  `/${medical_service}/getById/:uuid`,
  MedicalServiceController.getById
);
router.post(
  `/${medical_service}/add`,
  upload.single("image"),
  MedicalServiceController.create
);
router.put(
  `/${medical_service}/update/:uuid`,
  upload.single("image"),
  MedicalServiceController.update
);
router.delete(
  `/${medical_service}/delete/:uuid`,
  MedicalServiceController.delete
);

const select_profile = "select_profile";
router.get(`/${select_profile}/getAll`, SelectProfileController.getAll);
router.get(`/${select_profile}/getById/:id`, SelectProfileController.getById);
router.post(
  `/${select_profile}/add`,
  upload.single("image"),
  SelectProfileController.create
);
router.put(
  `/${select_profile}/update/:id`,
  upload.single("image"),
  SelectProfileController.update
);
router.delete(`/${select_profile}/delete/:id`, SelectProfileController.delete);

const article = "article";
router.get(`/${article}/getAll`, ArticleController.getAll);
router.get(`/${article}/getById/:id`, ArticleController.getById);
router.post(
  `/${article}/add`,
  upload.single("image"),
  ArticleController.create
);
router.put(
  `/${article}/update/:id`,
  upload.single("image"),
  ArticleController.update
);
router.delete(`/${article}/delete/:id`, ArticleController.delete);

const carousel_item = "carousel_item";
router.get(`/${carousel_item}/getAll`, CarouselItemController.getAll);
router.get(`/${carousel_item}/getById/:id`, CarouselItemController.getById);
router.post(
  `/${carousel_item}/add`,
  upload.single("image"),
  CarouselItemController.create
);
router.put(
  `/${carousel_item}/update/:id`,
  upload.single("image"),
  CarouselItemController.update
);
router.delete(`/${carousel_item}/delete/:id`, CarouselItemController.delete);

//
router.use("/payment", payment);

const notifications = "notifications";
router.get(`/${notifications}`, asyncHandler(notificationController.getNotifications));
router.post(`/${notifications}`, asyncHandler(notificationController.createNotification));
router.put(`/${notifications}/markAsRead/:notificationId`, asyncHandler(notificationController.markAsRead));
router.put(`/${notifications}/markAllAsRead/:userId`, asyncHandler(notificationController.markAllAsRead));
router.get(`/${notifications}/unreadCount/:userId`, asyncHandler(notificationController.getUnreadCount));
router.delete(`/${notifications}/delete/:notificationId`, asyncHandler(notificationController.deleteNotification));

router.get('/:doctorId/revenue', DoctorRevenueController.getRevenueByDoctorId);

module.exports = router;
