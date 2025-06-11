const express = require('express');
const router = express.Router();
const UserController = require("../src/controller/user_controller");
const { checkLogin } = require("../src/api/middleware/check_login");
const appointmentController = require("../src/controller/appointmentController");
const doctorController = require('../src/controller/doctorController');
const SpecializationController = require('../src/controller/specializationController');
const clinicController = require('../src/controller/clinicController');
const medicalRecordController = require('../src/controller/medicalRecordController');
const newsController = require('../src/controller/newsController');
const packageController = require('../src/controller/packageController');
const patientController = require('../src/controller/patientController');
const premissionController = require('../src/controller/premissionController');
const resultController = require('../src/controller/resultController');
const reviewController = require('../src/controller/reviewController');
const scheduleController = require('../src/controller/scheduleController');
const hospitalController = require('../src/controller/hospitalController');
const multer = require('multer');
const upload = multer({ dest: 'uploads/' });
const hospitalSpecializationController = require("../src/controller/hospitalSpecializationController");
const hospitalDoctorController = require("../src/controller/hospitalDoctorController");
const clinicSpecializationController = require("../src/controller/clinicSpecializationController");
const clinicDoctorController = require("../src/controller/clinicDoctorController");
const MedicalServiceController = require("../src/controller/medicalserviceController");
const SelectProfileController = require("../src/controller/SelectProfileController");
const ArticleController = require("../controllers/article.controller");
const asyncHandler = fn => (req, res, next) => {
  Promise.resolve(fn(req, res, next)).catch(next);
};

router.get('/', function(req, res, next) {
  res.render('index', { title: 'Express' });
});

// Auth
const auth = "auth";
router.post(`/${auth}/login`, asyncHandler(UserController.login));
router.post(`/${auth}/register`, upload.single('image'), asyncHandler(UserController.register));
router.post(`/${auth}/me`, checkLogin, asyncHandler(UserController.getDetailInfo));
router.post(`/${auth}/refresh-token`, asyncHandler(UserController.refreshToken));
router.put(`/${auth}/me`, checkLogin, asyncHandler(UserController.updateProfile));
// router.put(`/${auth}/change-password`, checkLogin, asyncHandler(UserController.changePassword));
// router.put(`/${auth}/change-status`, checkLogin, asyncHandler(UserController.changeStatus));
router.get(`/${auth}/getAll`, UserController.getAll);

// Doctor
const doctor = "doctor";
router.get(`/${doctor}/getAll`, doctorController.getAll);
router.get(`/${doctor}/getById/:id`, doctorController.getById);
router.post(`/${doctor}/add`, doctorController.create);
router.put(`/${doctor}/update/:id`, doctorController.update);
router.delete(`/${doctor}/delete/:id`, doctorController.delete);

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
router.post(`/${clinic}/add`,upload.single('image'), clinicController.create);
router.put(`/${clinic}/update/:id`, clinicController.update);
router.delete(`/${clinic}/delete/:id`, clinicController.delete);

// Appointment
const appointment = "appointment";
router.get(`/${appointment}/getAll`, appointmentController.getAll);
router.get(`/${appointment}/getById/:id`, appointmentController.getById);
router.post(`/${appointment}/add`, appointmentController.create);
router.put(`/${appointment}/update/:id`, appointmentController.update);
router.delete(`/${appointment}/delete/:id`, appointmentController.delete);

// Medical Record
const medicalRecord = "medicalRecord";
router.get(`/${medicalRecord}/getAll`, medicalRecordController.getAll);
router.get(`/${medicalRecord}/getById/:id`, medicalRecordController.getById);
router.post(`/${medicalRecord}/add`, medicalRecordController.create);
router.put(`/${medicalRecord}/update/:id`, medicalRecordController.update);
router.delete(`/${medicalRecord}/delete/:id`, medicalRecordController.delete);

// News
const news = "news";
router.get(`/${news}/getAll`, newsController.getAll);
router.get(`/${news}/getById/:id`, newsController.getById);
router.post(`/${news}/add`, newsController.create);
router.put(`/${news}/update/:id`, newsController.update);
router.delete(`/${news}/delete/:id`, newsController.delete);

//Package
const packageRoute = "package";
router.get(`/${packageRoute}/getAll`, packageController.getAll);
router.get(`/${packageRoute}/getById/:id`, packageController.getById);
router.post(`/${packageRoute}/add`, packageController.create);
router.put(`/${packageRoute}/update/:id`, packageController.update);
router.delete(`/${packageRoute}/delete/:id`, packageController.delete);

// Patient
const patient = "patient";
router.get(`/${patient}/getAll`, patientController.getAll);
router.get(`/${patient}/getById/:id`, patientController.getById);
router.post(`/${patient}/add`, patientController.create);
router.put(`/${patient}/update/:id`, patientController.update);
router.delete(`/${patient}/delete/:id`, patientController.delete);

// Permission
const permission = "premission";
router.get(`/${permission}/getAll`, premissionController.getAll);
router.get(`/${permission}/getById/:id`, premissionController.getById);
router.post(`/${permission}/add`, premissionController.create);
router.put(`/${permission}/update/:id`, premissionController.update);
router.delete(`/${permission}/delete/:id`, premissionController.delete);

// Result
const result = "result";
router.get(`/${result}/getAll`, resultController.getAll);
router.get(`/${result}/getById/:id`, resultController.getById);
router.post(`/${result}/add`, resultController.create);
router.put(`/${result}/update/:id`, resultController.update);
router.delete(`/${result}/delete/:id`, resultController.delete);

// Review
const review = "review";
router.get(`/${review}/getAll`, reviewController.getAll);
router.get(`/${review}/getById/:id`, reviewController.getById);
router.post(`/${review}/add`, reviewController.create);
router.put(`/${review}/update/:id`, reviewController.update);
router.delete(`/${review}/delete/:id`, reviewController.delete);

// Schedule
const schedule = "schedule";
router.get(`/${schedule}/getAll`, scheduleController.getAll);
router.get(`/${schedule}/getById/:id`, scheduleController.getById);
router.post(`/${schedule}/add`, scheduleController.create);
router.put(`/${schedule}/update/:id`, scheduleController.update);
router.delete(`/${schedule}/delete/:id`, scheduleController.delete);

// hospital
const hospital = "hospital";
router.get(`/${hospital}/getAll`, hospitalController.getAll);
router.get(`/${hospital}/getById/:id`, hospitalController.getById);
router.post(`/${hospital}/add`, upload.single('image'), hospitalController.create);
router.put(`/${hospital}/update/:id`, upload.single('image'), hospitalController.update);
router.delete(`/${hospital}/delete/:id`, hospitalController.delete);

const hospital_specializations = "hospital_specializations";
router.post(`/${hospital_specializations}/add`, hospitalSpecializationController.addSpecialization);
router.delete(`/${hospital_specializations}/delete`, hospitalSpecializationController.removeSpecialization);
router.get(`/${hospital_specializations}/getById/:hospital_uuid`, hospitalSpecializationController.getSpecializationsByHospital);

const hospital_doctors = "hospital_doctors";
router.post(`/${hospital_doctors}/add`, hospitalDoctorController.addDoctor);
router.delete(`/${hospital_doctors}/delete`, hospitalDoctorController.removeDoctor);
router.get(`/${hospital_doctors}/getById/:hospital_uuid`, hospitalDoctorController.getDoctorsByHospital);

const clinic_specializations = "clinic_specializations";
router.post(`/${clinic_specializations}/add`, clinicSpecializationController.addSpecialization);
router.delete(`/${clinic_specializations}/delete`, clinicSpecializationController.removeSpecialization);
router.get(`/${clinic_specializations}/getById/:clinic_uuid`, clinicSpecializationController.getSpecializationsByClinic);

const clinic_doctors = "clinic_doctors";
router.post(`/${clinic_doctors}/add`, clinicDoctorController.addDoctor);
router.delete(`/${clinic_doctors}/delete`, clinicDoctorController.removeDoctor);
router.get(`/${clinic_doctors}/getById/:clinic_uuid`, clinicDoctorController.getDoctorsByClinic);


const medical_service = "medical_service";
router.get(`/${medical_service}/getAll`, MedicalServiceController.getAll);
router.get(`/${medical_service}/getById/:id`, MedicalServiceController.getById);
router.post(`/${medical_service}/add`, upload.single('image'), MedicalServiceController.create);
router.put(`/${medical_service}/update/:id`, upload.single('image'), MedicalServiceController.update);
router.delete(`/${medical_service}/delete/:id`, MedicalServiceController.delete);


const select_profile = "select_profile";
router.get(`/${select_profile}/getAll`, SelectProfileController.getAll);
router.get(`/${select_profile}/getById/:id`, SelectProfileController.getById);
router.post(`/${select_profile}/add`, upload.single('image'), SelectProfileController.create);
router.put(`/${select_profile}/update/:id`, upload.single('image'), SelectProfileController.update);
router.delete(`/${select_profile}/delete/:id`, SelectProfileController.delete);


const article = "article";
router.get(`/${article}/getAll`, ArticleController.getAll);
router.get(`/${article}/getById/:id`, ArticleController.getById);
router.post(`/${article}/add`, upload.single('image'), ArticleController.create);
router.put(`/${article}/update/:id`, upload.single('image'), ArticleController.update);
router.delete(`/${article}/delete/:id`, ArticleController.delete);
module.exports = router;