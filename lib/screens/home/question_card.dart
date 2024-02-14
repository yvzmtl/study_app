
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_study_app/configs/themes/app_icon_text.dart';
import 'package:flutter_study_app/configs/themes/custom_text_style.dart';
import 'package:flutter_study_app/configs/themes/ui_parameters.dart';
import 'package:flutter_study_app/controllers/question_paper/question_paper_controller.dart';
import 'package:flutter_study_app/models/question_paper_model.dart';
import 'package:flutter_study_app/utils/dimensions.dart';
import 'package:get/get.dart';

class QuestionCard extends GetView<QuestionPaperController> {

  final QuestionPaperModel model;

  const QuestionCard({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Theme.of(context).cardColor
      ),
      child: InkWell(
        onTap: (){
          print("${model.title}");
          controller.navigateToQuestions(paper: model);
        },
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(Dimensions.height10),
                  child: Container(
                    color: Theme.of(context).primaryColor.withOpacity(0.1),
                    child: SizedBox(
                      height: Dimensions.height10 * 6,
                      width: Dimensions.height10 * 6,
                      child: CachedNetworkImage(
                        imageUrl: model.image_url!,
                        placeholder: (context, url) {
                          return Container(
                            alignment: Alignment.center,
                            child: CircularProgressIndicator(),
                          );
                        },
                        errorWidget: (context, url, error) => Image.asset("assets/images/app_splash_logo.png"),
                      )),
                  )
                ),
                  SizedBox(width: Dimensions.height10*1.2),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          text: model.title!,
                          color: UIParameters.isDarkMode()?Theme.of(context).textTheme.bodyText1!.color
                              :Theme.of(context).primaryColor,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 10,bottom: 5),
                          child: Text(model.description!)
                        ),
                        Row(
                          children: [
                            AppIconText(
                              icon: Icon(Icons.help_outline_sharp,
                                      color: Get.isDarkMode?Colors.white:Theme.of(context).primaryColor),
                              text: CustomText(
                                text: '${model.questions_count} soru',
                                color: Get.isDarkMode?Colors.white:Theme.of(context).primaryColor),
                            ),
                            SizedBox(width: Dimensions.width10*2),
                            AppIconText(
                              icon: Icon(Icons.timer,
                                      color: Get.isDarkMode?Colors.white:Theme.of(context).primaryColor),
                              text: CustomText(
                                text: (model.timeSeconds!/60).ceil().toString()+" dk",
                                color: Get.isDarkMode?Colors.white:Theme.of(context).primaryColor),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
              Positioned(
                bottom: -Dimensions.height10*2,
                right: -Dimensions.width10*2,
                child: GestureDetector(
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: Dimensions.height10*1.2,horizontal: Dimensions.height10*2),
                    child: Icon(Icons.library_books),
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(Dimensions.height10),
                        bottomRight: Radius.circular(Dimensions.height10)
                      )
                    ),
                  ),
                )
              ),
            ],
          ),
        ),
      ),
    );
  }
}