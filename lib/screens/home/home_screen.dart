

import 'package:flutter/material.dart';
import 'package:flutter_study_app/controllers/question_paper/question_paper_controller.dart';
import 'package:flutter_study_app/utils/dimensions.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    QuestionPaperController _questionPaperController = Get.find();
    return Scaffold(
      body: Obx(()=>ListView.separated(
        itemBuilder: (BuildContext context, int index){
          return ClipRRect(
            child: SizedBox(height: Dimensions.height10*2),
          );
        }, 
        separatorBuilder: (BuildContext context, int index){
          return SizedBox(
            height: Dimensions.height10*20,
            width: Dimensions.height10*20,
            child: FadeInImage(
              image: NetworkImage(_questionPaperController.allPaperImages[index]),
              placeholder: AssetImage("assets/images/app_splash_logo.png"),
            ),  
          );
        }, 
        itemCount: _questionPaperController.allPaperImages.length
      ),
      )
    );
  }
}