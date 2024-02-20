
import 'package:flutter/material.dart';
import 'package:flutter_study_app/configs/themes/app_colors.dart';
import 'package:flutter_study_app/configs/themes/custom_text_style.dart';
import 'package:flutter_study_app/controllers/zoom_drawer_controller.dart';
import 'package:flutter_study_app/utils/dimensions.dart';
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
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Obx(() => controller.user.value == null ?
                    SizedBox() :
                    CustomText(
                      text: controller.user.value!.displayName ?? '',
                      fontWeight: FontWeight.w900,
                      fontSize: Dimensions.height10*1.8,
                      color: onSurfaceTextColor,
                    ),  
                  ),
                  Spacer(flex: 1),
                  _DrawerButton(
                    icon: Icons.web, 
                    label: "Web Sitesi",
                    onPressed: ()=>controller.website()
                  ),
                  _DrawerButton(
                    icon: Icons.facebook, 
                    label: "Facebook",
                    onPressed: ()=>controller.facebook()
                  ),
                  _DrawerButton(
                    icon: Icons.email, 
                    label: "Email",
                    onPressed: ()=>controller.email()
                  ),
                  Spacer(flex: 4),
                  _DrawerButton(
                    icon: Icons.logout, 
                    label: "Çıkış Yap",
                    onPressed: ()=>controller.signOut()
                  ),
                ],
              ),
             
            ],
          ),
        ),
      ),
    );
  }
}

class _DrawerButton extends StatelessWidget {

  final IconData icon;
  final String label;
  final VoidCallback? onPressed;

  const _DrawerButton({
    super.key, 
    required this.icon, 
    required this.label, 
    this.onPressed});

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: onPressed,
      icon: Icon(
        icon,
        size: Dimensions.height10*1.5), 
      label: Text(label)
    );
  }
}