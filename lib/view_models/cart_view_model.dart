import 'dart:developer';

import 'package:get/get.dart';
import 'package:naemen/models/artist_model.dart';
import 'package:naemen/models/order_detail_model.dart';
import 'package:naemen/models/store_model.dart';
import 'package:naemen/view_models/artist_profile_view_model.dart';
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

  final Rx<OrderDetailModel> _orderDetail = OrderDetailModel().obs;

  final RxBool _isBookingDetailsLoading = false.obs;

  // =============================== Getters ===================================
  List<ArtistServiceModel> get getAddedServiceList => _addedServicesList;

  StoreModel get getSelectedStore => _selectedStore.value;

  ArtistModel get getSelectedArtist => _selectedArtist.value;

  OrderDetailModel get getOrderDetail => _orderDetail.value;

  bool get getIsBookingDetailsLoading => _isBookingDetailsLoading.value;

  // =============================== Setters ===================================
  set setAddedServices(List<ArtistServiceModel> list) =>
      _addedServicesList.value = list;

  set setSelectedStore(StoreModel store) => _selectedStore.value = store;

  set setSelectedArtist(ArtistModel artist) => _selectedArtist.value = artist;

  set setOrderDetail(OrderDetailModel detail) => _orderDetail.value = detail;

  set setIsBookingDetailsLoading(bool value) =>
      _isBookingDetailsLoading.value = value;

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

  Future onBookNowClick(AuthViewModel authViewModel,
      ArtistProfileViewModel artistProfileViewModel) async {
    try {
      String startTime = artistProfileViewModel.getSelectedTime.substring(0, 5);
      String endTime = artistProfileViewModel.getSelectedTime.substring(8, 13);
      Utils.startLoading();
      String lat = await StorageData.getLatitude();
      String lng = await StorageData.getLongitude();
      Map<String, dynamic> data = {
        "customer_id": authViewModel.getCustomer.id,
        "store_id": getSelectedStore.id,
        "customer_address": authViewModel.getAddress,
        "lat": lat,
        "lng": lng,
        "order_amount": fetchSubtotal(),
        "service_start_time": startTime,
        "service_end_time": endTime,
        "coupon_id": "",
        "coupon_amount": 0,
        "discount_amount": 0,
        "final_pay_amount": fetchSubtotal(),
        "artist_id": artistProfileViewModel.getSelectedArtist.id,
        "service_date": artistProfileViewModel.getSelectedDate,
        "order_item": getAddedServiceList.map(
          (ArtistServiceModel service) {
            return {
              "service_id": service.id,
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
        Utils.toastMessage(response["msg"] ?? "Order generated successfully.");
        await orderBook("${response["order_id"] ?? ""}");
        Get.back();
        Get.offNamed(Routes.orderSuccessRoute);
      } else {
        Get.back();
        Utils.toastMessage("Something went wrong!");
      }
    } catch (e) {
      log("onBookNowClick => ${e.toString()}");
      Get.back();
      Utils.toastMessage(e.toString());
    }
  }

  Future orderBook(String orderId) async {
    Map<String, String> data = {
      "payment_status": "cod",
      "payment_id": "",
      "order_id": orderId,
      // "discount_amount": "",
      // "final_pay_amount": "",
    };
    try {
      Map<String, dynamic> response = await _cartRepo.orderBook(data);
      log(response.toString());
      if (response["code"] == 200) {
        Utils.toastMessage(response["msg"] ?? "Order booked successfully.");
        await fetchOrderDetails("${response["order_number"] ?? ""}");
      } else {
        Utils.toastMessage(response["msg"] ?? "Something went wrong!");
      }
    } catch (e) {
      Utils.toastMessage(e.toString());
      log("orderBook Error => $e");
    }
  }

  Future fetchOrderDetails(String orderNumber) async {
    OrderDetailModel orderDetail = OrderDetailModel();
    Map<String, String> params = {
      "order_number": orderNumber,
    };
    try {
      setIsBookingDetailsLoading = true;
      Map<String, dynamic> response = await _cartRepo.orderDetails(params);
      log(response.toString());
      if (response["order"] != null && response["order_item"] != null) {
        orderDetail = OrderDetailModel.fromMap(response);
        log(orderDetail.toString());
        setOrderDetail = orderDetail;
      } else {
        Utils.toastMessage(response["msg"] ?? "Something went wrong!");
      }
    } catch (e) {
      Utils.toastMessage(e.toString());
      log("fetchOrderDetails Error => $e");
    }
    setIsBookingDetailsLoading = false;
  }
}
