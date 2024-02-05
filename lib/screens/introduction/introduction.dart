
import 'package:flutter/material.dart';
import 'package:flutter_study_app/utils/dimensions.dart';
import 'package:flutter_study_app/widget/app_circle_button.dart';
import 'package:get/get.dart';

class AppIntroductionScreen extends StatelessWidget {
  const AppIntroductionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: Dimensions.screenWidth*0.2),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.star,size: 65, color: Colors.amber),
              SizedBox(height: Dimensions.height10*4),
              Text("Bu bir çalışma uygulamasıdır. Burdaki soruları çözerek kendi gelişimizi ölçebilirsiniz"),
              SizedBox(height: Dimensions.height10*4),
              AppCircleButton(
                onTap: ()=> null,
                child: Icon(Icons.arrow_forward_ios,size: 35),
              )
            ],
          ),
        ),
      ),
    );
  }
}