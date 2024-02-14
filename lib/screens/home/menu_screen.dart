
import 'package:flutter/material.dart';
import 'package:flutter_study_app/configs/themes/app_colors.dart';
import 'package:flutter_study_app/controllers/zoom_drawer_controller.dart';
import 'package:get/get.dart';


class MenuScreen extends GetView<MyDrawerController> {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(25),
      width: double.maxFinite,
      decoration: BoxDecoration(gradient: mainGradient()),
      child: Theme(
        data: ThemeData(
          textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(primary: onSurfaceTextColor)
          ),
        ),
        child: SafeArea(
          child: Stack(
            children: [
              Positioned(
                right: 0,
                top: 0,
                child: BackButton(
                  color: Colors.white,
                  onPressed: (){
                    print("Geri butonuna basıldı");
                    controller.toggleDrawer();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}