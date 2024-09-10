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

  OrderDetailModel _orderDetail = OrderDetailModel();

  // =============================== Getters ===================================
  List<ArtistServiceModel> get getAddedServiceList => _addedServicesList;

  StoreModel get getSelectedStore => _selectedStore.value;

  ArtistModel get getSelectedArtist => _selectedArtist.value;

  OrderDetailModel get getOrderDetail => _orderDetail;

  // =============================== Setters ===================================
  set setAddedServices(List<ArtistServiceModel> list) =>
      _addedServicesList.value = list;

  set setSelectedStore(StoreModel store) => _selectedStore.value = store;

  set setSelectedArtist(ArtistModel artist) => _selectedArtist.value = artist;

  set setOrderDetail(OrderDetailModel detail) => _orderDetail = detail;

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
      String endTime = artistProfileViewModel.getSelectedTime.substring(11, 16);
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
  }

  var data = {
    "order": {
      "id": 8,
      "order_number": "NMNO#A0001",
      "customer_id": 24,
      "store_id": "SADAA0003",
      "customer_address": "Chandralok colony aliganj lucknow",
      "lat": "26.77678290",
      "lng": "80.93706950",
      "order_amount": 1499,
      "coupon_id": null,
      "coupon_code": null,
      "discount_amount": 0,
      "final_pay_amount": 1499,
      "payment_status": "cod",
      "payment_id": "",
      "order_status": "new",
      "is_active": "1",
      "date_time": "2024-08-31 17:51:10",
      "customer_name": "Manish",
      "email": "manish@gmail.com",
      "contact_number": "898240449",
      "profile_pic": null,
      "salon_name_eng": "test business 2",
      "salon_name_arb": "test",
      "salon_image": "assets\/images\/salon-img\/66b7390c44cac.webp",
      "cr_no": "",
      "vat_no": "",
      "log_address": "80.92662970",
      "address_1": "block-c police station",
      "address_2": "bkt"
    },
    "order_item": [
      {
        "id": 1,
        "order_id": 8,
        "store_id": "15",
        "customer_id": 24,
        "order_number": "NMNO#A0001",
        "service_id": 16,
        "service_title": "Smoothening",
        "service_title_arb":
            "\u0639\u0644\u0627\u062c\u0627\u062a\u0645\u062e\u0635\u0635\u0629",
        "service_start_time": "13:00:00",
        "service_end_time": "13:50:00",
        "service_date": "2024-08-31",
        "artist_id": 13,
        "service_duraction": 50,
        "service_amount": 1499,
        "artist_start_time": null,
        "artist_end_time": null,
        "is_active": "1",
        "service_status": "new",
        "date_time": "2024-08-3117:51:10",
        "artist_name_eng": "tanveer",
        "artist_name_arb": "\u062a\u0646\u0648\u064a\u0631",
        "artist_image": "assets\/images\/salon-img\/66b9f676c1df5.webp",
      }
    ]
  };
}
