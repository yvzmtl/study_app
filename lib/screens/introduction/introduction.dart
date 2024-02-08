
import 'package:flutter/material.dart';
import 'package:flutter_study_app/configs/themes/app_colors.dart';
import 'package:flutter_study_app/screens/home/home_screen.dart';
import 'package:flutter_study_app/utils/dimensions.dart';
import 'package:flutter_study_app/widget/app_circle_button.dart';
import 'package:get/get.dart';

class AppIntroductionScreen extends StatelessWidget {
  const AppIntroductionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(gradient: mainGradient()),
        alignment: Alignment.center,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: Dimensions.screenWidth*0.2),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.star,
                size: Dimensions.height10*6.5, 
                // color: Colors.amber
              ),
              SizedBox(height: Dimensions.height10*4),
              Text("Bu bir çalışma uygulamasıdır. Burdaki soruları çözerek kendi gelişimizi ölçebilirsiniz",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: Dimensions.height10*1.8,
                  color: onSurfaceTextColor,
                  fontWeight: FontWeight.bold
                ),  
              ),
              
              SizedBox(height: Dimensions.height10*4),
              AppCircleButton(
                onTap: ()=> Get.toNamed("/home"),
                child: Icon(Icons.arrow_forward,size: 35),
              )
            ],
          ),
        ),
      ),
    );
  }
}