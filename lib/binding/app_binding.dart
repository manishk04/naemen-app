import 'package:get/get.dart';

import '../view_models/auth_view_model.dart';
import '../view_models/home_view_model.dart';
import '../view_models/language_view_model.dart';
import '../view_models/onboarding_view_model.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(LanguageViewModel());
    Get.put(OnboardingViewModel());
    Get.put(AuthViewModel());
    Get.put(HomeViewModel());
  }
}
