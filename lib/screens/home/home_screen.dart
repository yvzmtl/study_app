

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_study_app/controllers/question_paper/question_paper_controller.dart';
import 'package:flutter_study_app/screens/home/question_card.dart';
import 'package:flutter_study_app/utils/dimensions.dart';
import 'package:flutter_study_app/widget/content_area.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    QuestionPaperController _questionPaperController = Get.find();
    return Scaffold(
      body: ContentArea(
        addPadding: false,
        child: Obx(()=>ListView.separated(
          padding: EdgeInsets.all(25),
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index){
            return QuestionCard(model: _questionPaperController.allPapers[index],);
          }, 
          separatorBuilder: (BuildContext context, int index){
              return SizedBox(height: Dimensions.height10 * 2);
          }, 
            itemCount: _questionPaperController.allPapers.length
        ),
        ),
      )
    );
  }
}