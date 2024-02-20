

import 'package:flutter/material.dart';
import 'package:flutter_study_app/configs/themes/custom_text_style.dart';
import 'package:flutter_study_app/utils/dimensions.dart';

class Dialogs {
  static final Dialogs _singleton = Dialogs._internal();
  Dialogs._internal();

  factory Dialogs(){
    return _singleton;
  }

  static Widget questionStartDialogue({required VoidCallback onTap}){
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(
            text: "Merhaba",
            fontSize: Dimensions.height10*2.5,
            fontWeight: FontWeight.bold
          ),
          SizedBox(height: Dimensions.height10),
          CustomText(
            text: "Lütfen, başlamadan önce giriş yapınız",
            fontSize: Dimensions.height10*1.5,
          ),
        ],
      ),
      actions: [
        TextButton(onPressed: onTap, child: CustomText(text: "Giriş Yap"))
      ],
    );
  }
}