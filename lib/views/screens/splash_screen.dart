import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../view_models/auth_view_model.dart';
import '../../view_models/language_view_model.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    AuthViewModel authViewModel = Get.find();
    LanguageViewModel languageViewModel = Get.find();
    authViewModel.onAppOpen(languageViewModel);
    return Scaffold(
      body: Image.asset(
        'assets/images/splash_image.jpeg',
        fit: BoxFit.fill, // Your logo asset
      ),
    );
  }
}
