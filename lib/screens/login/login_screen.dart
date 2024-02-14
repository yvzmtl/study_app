
import 'package:flutter/material.dart';
import 'package:flutter_study_app/configs/themes/app_colors.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

static const String routeName = "/login";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(gradient: mainGradient()),
      ),
    );
  }
}