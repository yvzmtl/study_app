
import 'package:flutter_study_app/services/firebase_storage_service.dart';
import 'package:get/get.dart';

class QuestionPaperController extends GetxController {

  final allPaperImages = <String>[].obs;

  @override
  void onReady() {
    getAllPapers();
    super.onReady();
  }
  
  Future<void> getAllPapers() async {
    List<String> imgName = ["biology","chemistry","maths","physics"];
    try {
      for (var img in imgName) {
        final imgUrl = await Get.find<FirebaseStorageService>().getImage(img);
        allPaperImages.add(imgUrl!);
      }
    } catch (e) {
      print(e);
    }
  }
}