
import 'package:flutter/material.dart';
import 'package:flutter_study_app/configs/themes/app_colors.dart';
import 'package:flutter_study_app/configs/themes/custom_text_style.dart';
import 'package:flutter_study_app/utils/dimensions.dart';

class MainButton extends StatelessWidget {

  final String title;
  final VoidCallback onTap;
  final bool enabled;
  final Widget? child;
  final Color? color;

  const MainButton({super.key, 
                    this.title = "", 
                    required this.onTap, 
                    this.enabled = true, 
                    this.child, 
                    this.color});

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: SizedBox(
        height: Dimensions.height10*5.5,
        child: InkWell(
          onTap: enabled == false ? null : onTap,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Dimensions.height10*1.5),
              color: color ?? Theme.of(context).cardColor,
            ),
            width: double.maxFinite,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: child ?? Center(
                child: CustomText(
                        text: title,
                        fontWeight: FontWeight.bold,
                        color: onSurfaceTextColor),
              ),
            )
          ),
        ),
      ),
    );
  }
}