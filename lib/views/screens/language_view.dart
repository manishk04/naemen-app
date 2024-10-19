import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../view_models/language_view_model.dart';

class LanguageView extends StatelessWidget {
  const LanguageView({super.key});

  @override
  Widget build(BuildContext context) {
    LanguageViewModel languageViewModel = Get.find();
    // Start the fade-in animation after a short delay
    Timer(const Duration(), () {
      languageViewModel.showLanguageBottomSheet();
    });
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.black,
              Colors.grey,
            ],
            stops: [0.0, 1.0],
            begin: FractionalOffset.topCenter,
            end: FractionalOffset.bottomCenter,
            tileMode: TileMode.repeated,
          ),
        ),
      ),
    );
  }
}
