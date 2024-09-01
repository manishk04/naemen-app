import 'dart:developer';

import 'package:get/get.dart';
import 'package:naemen/models/artist_model.dart';
import 'package:naemen/models/store_model.dart';
import 'package:naemen/view_models/auth_view_model.dart';

import '../models/artist_service_model.dart';
import '../repo/cart_repo.dart';
import '../routes/app_routes.dart';
import '../utils/storage_data.dart';
import '../utils/utils.dart';

class CartViewModel extends GetxController {
  // ============================== Variables ==================================
  final CartRepo _cartRepo = CartRepo();

  final RxList<ArtistServiceModel> _addedServicesList =
      <ArtistServiceModel>[].obs;
  final Rx<StoreModel> _selectedStore = StoreModel().obs;
  final Rx<ArtistModel> _selectedArtist = ArtistModel().obs;

  // =============================== Getters ===================================
  List<ArtistServiceModel> get getAddedServiceList => _addedServicesList;

  StoreModel get getSelectedStore => _selectedStore.value;

  ArtistModel get getSelectedArtist => _selectedArtist.value;

  // =============================== Setters ===================================
  set setAddedServices(List<ArtistServiceModel> list) =>
      _addedServicesList.value = list;

  set setSelectedStore(StoreModel store) => _selectedStore.value = store;

  set setSelectedArtist(ArtistModel artist) => _selectedArtist.value = artist;

  // =============================== Methods ===================================
  addService(ArtistServiceModel service) => _addedServicesList.add(service);
  clearServices() => setAddedServices = [];
  remove(ArtistServiceModel service) =>
      _addedServicesList.removeWhere((data) => data.id == service.id);
  int fetchSubtotal() {
    int total = 0;
    for (var service in _addedServicesList) {
      total = total + (service.serviceFinalAmount ?? 0);
    }
    return total;
  }

  Future onBookNowClick(AuthViewModel authViewModel) async {
    try {
      String lat = await StorageData.getLatitude();
      String lng = await StorageData.getLongitude();
      Map<String, dynamic> data = {
        "customer_id": authViewModel.getCustomer.id,
        "store_id": getSelectedStore.id,
        "customer_address": authViewModel.getAddress,
        "lat": lat,
        "lng": lng,
        "order_amount": fetchSubtotal(),
        "coupon_id": "",
        "coupon_amount": 0,
        "discount_amount": 0,
        "final_pay_amount": fetchSubtotal(),
        "order_item": getAddedServiceList.map(
          (ArtistServiceModel service) {
            List<String> data = (service.time ?? "").split("-");
            String startTime = data[0].trim();
            String endTime = data[1].trim();
            return {
              "service_id": service.id,
              "service_start_time": startTime,
              "service_end_time": endTime,
              "service_date": service.date,
              "artist_id": getSelectedArtist.id,
              "service_duraction": service.serviceDuration,
              "service_amount": service.serviceAmount
            };
          },
        ).toList(),
      };
      log(data.toString());
      Map<String, dynamic> response = await _cartRepo.generateOrder(data);
      log(response.toString());
      if (response["code"] == 200) {
        Utils.toastMessage(response["code"] ?? "Order generated successfully.");
        Get.offNamed(Routes.orderSuccessRoute);
      } else {
        Utils.toastMessage("Something went wrong!");
      }
    } catch (e) {
      Utils.toastMessage(e.toString());
      log("onBookNowClick => ${e.toString()}");
    }
  }
}
