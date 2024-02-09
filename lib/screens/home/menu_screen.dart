
import 'package:flutter/material.dart';
import 'package:flutter_study_app/configs/themes/app_colors.dart';
import 'package:flutter_study_app/utils/dimensions.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      // height: double.maxFinite,
      decoration: BoxDecoration(gradient: mainGradient()),
      // child: CustomText(text: "Merhaba", color: Colors.red),
    );
  }
}