
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_study_app/models/question_paper_model.dart';
import 'package:get/get.dart';

class DataUploader extends GetxController {
  @override
  void onReady() {
    uploadData();
    super.onReady();
  }
  
  Future<void> uploadData() async {
    final fireStore = FirebaseFirestore.instance;
    final manifestContent = await DefaultAssetBundle.of(Get.context!).loadString("AssetManifest.json");

    final Map<String, dynamic> manifestMap = json.decode(manifestContent);

    // json dosyasını yükleme ve yolunu yazdırma
    final papersInassets = manifestMap.keys.where((path) => 
        path.startsWith("assets/DB/paper") && path.contains(".json")).toList();
      
    List<QuestionPaperModel> questionPapers = [];
    for (var paper in papersInassets) {
      String stringPaperContent = await rootBundle.loadString(paper);
      questionPapers.add(QuestionPaperModel.fromJson(json.decode(stringPaperContent)));
      // print(stringPaperContent);
    }

    var batch = fireStore.batch();
    
    // print(papersInassets);
    print("Items number = ${questionPapers[0].description}");
    print("Items number = ${questionPapers.length}");
  }
}