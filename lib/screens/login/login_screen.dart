
import 'package:flutter/material.dart';
import 'package:flutter_study_app/configs/themes/app_colors.dart';
import 'package:flutter_study_app/configs/themes/custom_text_style.dart';
import 'package:flutter_study_app/controllers/auth_controller.dart';
import 'package:flutter_study_app/utils/dimensions.dart';
import 'package:flutter_study_app/widget/common/main_button.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class LoginScreen extends GetView<AuthController> {
  const LoginScreen({super.key});

static const String routeName = "/login";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 30),
        alignment: Alignment.center,
        decoration: BoxDecoration(gradient: mainGradient()),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/app_splash_logo.png",
              width: Dimensions.width10*20,
              height: Dimensions.height10*20
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 60),
              child: CustomText(
                text: "Bu bir çalışma uygulamasıdır. Burdaki soruları çözerek kendi gelişimizi ölçebilirsiniz",
                fontWeight: FontWeight.bold,
                color: onSurfaceTextColor,
                textAlign: TextAlign.center,
              ),
            ),
            MainButton(
              onTap: (){
                controller.signInWithGoogle();
              },
              child: Stack(
                children: [
                  Positioned(
                    child: SvgPicture.asset("assets/icons/google.svg")
                  ),
                  Center(
                    child: CustomText(
                      text: "Google ile giriş yap",
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.bold, 
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}