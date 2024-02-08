
import 'package:flutter/material.dart';
import 'package:flutter_study_app/utils/dimensions.dart';

class AppIconText extends StatelessWidget {
  final Icon icon;
  final Widget text;

  const AppIconText({
      super.key, 
      required this.icon, 
      required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        icon,
        SizedBox(width: Dimensions.height10*0.4),
        text
      ],
    );
  }
}