

import 'package:flutter_study_app/controllers/question_paper/auth_controller.dart';
import 'package:get/get.dart';

class InitialBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(AuthController(),permanent: true);
  }

}