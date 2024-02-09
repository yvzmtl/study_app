import 'package:flutter/material.dart';
import 'package:flutter_study_app/configs/themes/app_colors.dart';
import 'package:flutter_study_app/configs/themes/custom_text_style.dart';
import 'package:flutter_study_app/controllers/question_paper/question_paper_controller.dart';
import 'package:flutter_study_app/controllers/zoom_drawer_controller.dart';
import 'package:flutter_study_app/screens/home/menu_screen.dart';
import 'package:flutter_study_app/screens/home/question_card.dart';
import 'package:flutter_study_app/utils/dimensions.dart';
import 'package:flutter_study_app/widget/app_circle_button.dart';
import 'package:flutter_study_app/widget/content_area.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';

class HomeScreen extends GetView<MyDrawerController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    QuestionPaperController _questionPaperController = Get.find();
    return Scaffold(
      body: GetBuilder<MyDrawerController>(builder: (_) {
        return ZoomDrawer(
          borderRadius: Dimensions.height10*5,
          showShadow: true,
          angle: 0,
          // slideWidth: Dimensions.screenWidth*0.6,
          // openCurve: Curves.easeIn,
          // closeCurve: Curves.easeInBack,
          controller: _.zoomDrawerController,
          style: DrawerStyle.defaultStyle,
          menuScreen: MenuScreen(),
          mainScreen: Container(
            decoration: BoxDecoration(gradient: mainGradient()),
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(25),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppCircleButton(
                          child: Icon(Icons.menu, size: Dimensions.height10 * 2.5),
                          onTap: controller.toggleDrawer,
                        ),
                        SizedBox(height: Dimensions.height10),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          child: Row(children: [
                            Icon(Icons.perm_contact_calendar, size: Dimensions.height10 * 2.5),
                            SizedBox(width: Dimensions.width10),
                            CustomText(
                              text: "Merhabalar",
                              color: onSurfaceTextColor,
                              fontSize: Dimensions.height10 * 1.5,
                            ),
                          ]),
                        ),
                        CustomText(
                          text: "Bugün ne öğrenmek istiyorsun?",
                          color: onSurfaceTextColor,
                          fontSize: Dimensions.height10 * 2.5,
                          fontWeight: FontWeight.w700,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: ContentArea(
                        addPadding: false,
                        child: Obx(
                          () => ListView.separated(
                              padding: EdgeInsets.all(25),
                              shrinkWrap: true,
                              itemBuilder: (BuildContext context, int index) {
                                return QuestionCard(model: _questionPaperController.allPapers[index]);
                              },
                              separatorBuilder: (BuildContext context, int index) {
                                return SizedBox(height: Dimensions.height10 * 2);
                              },
                              itemCount: _questionPaperController.allPapers.length),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}