

import 'package:flutter_study_app/controllers/auth_controller.dart';
import 'package:flutter_study_app/controllers/question_paper/question_paper_controller.dart';
import 'package:flutter_study_app/controllers/theme_controller.dart';
import 'package:flutter_study_app/controllers/zoom_drawer_controller.dart';
import 'package:flutter_study_app/services/firebase_storage_service.dart';
import 'package:get/get.dart';

class InitialBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(AuthController(),permanent: true);
    Get.put(ThemeController());
    Get.put(QuestionPaperController());
    Get.put(FirebaseStorageService());
    Get.put(MyDrawerController());
  }

}