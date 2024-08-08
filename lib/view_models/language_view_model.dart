import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:naemen/utils/storage_data.dart';

import '../routes/app_routes.dart';
import '../views/screens/language_bottom_sheet.dart';

class LanguageViewModel extends GetxController {
  // ============================== Variables ==================================
  final RxString _selectedLanguage = "English".obs; // Default selected language

  // =============================== Getters ===================================
  String get getSelectedLanguage => _selectedLanguage.value;

  // =============================== Setters ===================================
  set setSelectedLanguage(String value) => _selectedLanguage.value = value;

  // =============================== Methods ===================================
  void showLanguageBottomSheet() {
    Get.bottomSheet(
      BottomSheet(
        builder: (context) => const LanguageBottomSheet(),
        onClosing: () {},
      ),
      isDismissible: false,
    );
  }

  void onLanguageSelect(String language) {
    setSelectedLanguage = language;
    StorageData.setLanguage(language);
    Get.back();
    Get.offAllNamed(Routes.onboardingRoute);
  }
}
