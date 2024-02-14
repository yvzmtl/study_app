

import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class MyDrawerController extends GetxController {
  final zoomDrawerController = ZoomDrawerController();

  @override
  void onReady() {
    
    super.onReady();
  }

  void toggleDrawer() {
    zoomDrawerController.toggle?.call();
    update();
  }

  void signOut(){

  }

  void signIn(){

  }

  void website(){

  }

  void email(){
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: 'a@gmail.com'
    );
    _launch(emailLaunchUri.toString());
  }
  
  Future<void> _launch(String url) async {
    if ( !await launch(url)) {
      throw '$url bulunamadı';
    }
  }
}