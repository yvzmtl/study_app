
import 'package:flutter/material.dart';
import 'package:flutter_study_app/configs/themes/ui_parameters.dart';
import 'package:flutter_study_app/utils/dimensions.dart';

class ContentArea extends StatelessWidget {
  final bool addPadding;
  final Widget child;
  const ContentArea({super.key, 
            this.addPadding = true, 
            required this.child});

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.vertical(top: Radius.circular(Dimensions.height10*2)),
      clipBehavior: Clip.hardEdge,
      type: MaterialType.transparency,
      child: Ink(
        decoration: BoxDecoration(
          color: UIParameters.customScaffoldColor(context),
        ),
        padding: addPadding 
                      ? EdgeInsets.only(top: 25,left: 25,right: 25)
                      :EdgeInsets.zero,
        child: child,
      ),
    );
  }
}