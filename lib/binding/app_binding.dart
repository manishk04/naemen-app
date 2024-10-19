import 'package:get/get.dart';

import '../view_models/appointment_history_view_model.dart';
import '../view_models/artist_profile_view_model.dart';
import '../view_models/auth_view_model.dart';
import '../view_models/cart_view_model.dart';
import '../view_models/google_map_view_model.dart';
import '../view_models/home_view_model.dart';
import '../view_models/language_view_model.dart';
import '../view_models/onboarding_view_model.dart';
import '../view_models/salon_profile_view_model.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(LanguageViewModel());
    Get.put(OnboardingViewModel());
    Get.put(AuthViewModel());
    Get.put(HomeViewModel());
    Get.put(AppointmentHistoryViewModel());
    Get.put(SalonProfileViewModel());
    Get.put(ArtistProfileViewModel());
    Get.put(CartViewModel());
    Get.put(GoogleMapViewModel());
  }
}
