import 'dart:developer';

import 'package:get/get.dart';

import '../repo/salon_repo.dart';
import '../utils/utils.dart';

class SalonProfileViewModel extends GetxController {
  // ============================== Variables ==================================
  final SalonRepo _salonRepo = SalonRepo();

  // =============================== Getters ===================================

  // =============================== Setters ===================================

  // =============================== Methods ===================================
  void fetchShopDetailsById() async {
    try {
      Map<String, String> params = {
        "store_id": "",
      }; // TODO: Uncomment for current location
      Map<String, dynamic> response =
          await _salonRepo.fetchSaloonDetailsById(params);
      log(response.toString());
      if (response["code"] == 200) {
        var data = response["data"];
        if (data != null) {
          if (data["store"] != null) {}
        } else {
          Utils.toastMessage(response["msg"] ?? "Something went wrong!");
        }
      } else {
        Utils.toastMessage(response["msg"] ?? "Something went wrong!");
      }
    } catch (e) {
      Utils.toastMessage(e.toString());
      log("fetchShopDetailsById Error => $e");
    }
  }
}
