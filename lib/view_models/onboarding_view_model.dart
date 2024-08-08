import 'dart:developer';

import 'package:get/get.dart';

import '../models/onboarding_model.dart';
import '../repo/onboarding_repo.dart';
import '../routes/app_routes.dart';

class OnboardingViewModel extends GetxController {
  // ============================== Variables ==================================
  final OnboardingRepo _repo = OnboardingRepo();

  final RxBool _isLoading = false.obs;

  List<OnboardingModel> _onboardingList = <OnboardingModel>[];

  // =============================== Getters ===================================
  bool get getIsLoading => _isLoading.value;

  List<OnboardingModel> get getOnboardingList => _onboardingList;

  // =============================== Setters ===================================
  set setIsLoading(bool value) => _isLoading.value = value;

  set setOnboardingList(List<OnboardingModel> list) => _onboardingList = list;

  // =============================== Methods ===================================
  @override
  void onInit() {
    super.onInit();
    fetchList();
  }

  Future fetchList() async {
    List<OnboardingModel> list = <OnboardingModel>[];
    try {
      Map<String, dynamic> response = await _repo.fetchList();
      log(response.toString());
      if (response["code"] == 200) {
        for (var element in response["data"] as List) {
          list.add(OnboardingModel.fromMap(element));
        }
      }
    } catch (e) {
      log("fetchList Error => $e");
      Get.snackbar("Something went wrong", e.toString());
    }
    setOnboardingList = list;
  }

  void skipOnboarding() {
    Get.offNamed(Routes.verifyMobileViewRoute);
  }
}
