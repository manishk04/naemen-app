import 'dart:developer';

import 'package:get/get.dart';

import '../models/order_model.dart';
import '../repo/cart_repo.dart';
import '../utils/app_enums.dart';
import '../utils/app_functions.dart';
import '../utils/storage_data.dart';
import '../utils/utils.dart';
import 'auth_view_model.dart';

class AppointmentHistoryViewModel extends GetxController {
  // ============================== Variables ==================================
  final CartRepo _cartRepo = CartRepo();

  final RxBool _isLoading = false.obs;

  final Rx<AppointmentFilterEnum> _filter = AppointmentFilterEnum.upcoming.obs;

  final RxList<OrderModel> _orders = <OrderModel>[].obs;

  double _latitude = 0.0;
  double _longitude = 0.0;

  // =============================== Getters ===================================
  bool get getIsLoading => _isLoading.value;

  List<OrderModel> get getOrders => _orders;

  AppointmentFilterEnum get getFilter => _filter.value;

  // =============================== Setters ===================================
  set setIsLoading(bool value) => _isLoading.value = value;

  set setOrders(List<OrderModel> orders) => _orders.value = orders;

  set setFilter(AppointmentFilterEnum filter) => _filter.value = filter;

  // =============================== Methods ===================================
  init() async {
    _latitude = double.parse(await StorageData.getLatitude());
    _longitude = double.parse(await StorageData.getLongitude());
  }

  void fetchAppointmentHistory(AuthViewModel authViewModel) async {
    List<OrderModel> list = <OrderModel>[];
    OrdersModel ordersData = OrdersModel();
    Map<String, String> params = {
      "customer_id": authViewModel.getCustomer.id.toString(),
      "status": fetchOrderStatusString(getFilter),
    };
    setIsLoading = true;
    try {
      Map<String, dynamic> response = await _cartRepo.fetchOrderHistory(params);
      log(response.toString());
      var orders = response["orders"];
      if (orders != null) {
        ordersData = OrdersModel.fromMap(orders);
        list = ordersData.data ?? [];
        for (var i = 0; i < list.length; i++) {
          list[i].distance = calculateDistance(
                  _latitude,
                  _longitude,
                  double.parse(list[i].lat ?? "0.0"),
                  double.parse(list[i].lng ?? "0.0"))
              .toStringAsFixed(2);
        }
      } else {
        Utils.toastMessage("Something went wrong");
      }
    } catch (e) {
      Utils.toastMessage(e.toString());
      log("fetchArtistBookingCalendar Error => $e");
    }
    log(list.toString());
    setOrders = list;
    setIsLoading = false;
  }

  String fetchOrderStatusString(AppointmentFilterEnum filter) {
    switch (filter) {
      case AppointmentFilterEnum.upcoming:
        return "new";
      case AppointmentFilterEnum.inProcess:
        return "in-process";
      case AppointmentFilterEnum.completed:
        return "completed";
      case AppointmentFilterEnum.cancelled:
        return "canceled";
      default:
        return "";
    }
  }

  onFilterSelect(AppointmentFilterEnum filter, AuthViewModel authViewModel) {
    setFilter = filter;
    fetchAppointmentHistory(authViewModel);
  }

  var data = {
    "order": {
      "orderId": 10,
      "order_number": "NMNO#A0001",
      "service_date": "2024-09-30",
      "customer_id": 26,
      "store_id": "INLUA0005",
      "customer_address":
          "6478,Mahalaxmi Nagar, Ambernath, Konkan Division, Maharashtra,India",
      "lat": "26.86040000",
      "lng": "81.00330000",
      "order_amount": 5300,
      "coupon_id": null,
      "coupon_code": null,
      "service_start_time": "20:00:00",
      "service_end_time": "21:30:00",
      "artist_id": 31,
      "discount_amount": 0,
      "final_pay_amount": 5300,
      "payment_status": "cod",
      "payment_id": "",
      "order_status": "new",
      "is_active": "1",
      "order_generate_time": "2024-09-30 19:42:36",
      "customer_name": "Roshan",
      "email": "roshan@gmail.com",
      "contact_number": "7028362775",
      "profile_pic": null,
      "salon_name_eng": "GloabSalon",
      "salon_name_arb":
          "\u0635\u0627\u0644\u0648\u0646\u062c\u0644\u0648\u0628",
      "salon_image": "assets\/images\/salon-img\/66f2b0142a7f5.webp",
      "cr_no": "",
      "vat_no": "",
      "log_address": "80.94372100",
      "lat_address": "26.88535240",
      "city_iso": "LU",
      "address_2": "Jankipuram",
      "artist_name_eng": "NainaSharma",
      "artist_name_arb":
          "\u0646\u064a\u0646\u0627\u0634\u0627\u0631\u0645\u0627",
      "artist_contact_number": "1212122322213"
    },
    "order_item": [
      {
        "id": 15,
        "order_id": 10,
        "store_id": "28",
        "artist_id": 31,
        "customer_id": 26,
        "order_number": "NMNO#A0001",
        "service_id": 36,
        "service_title": "Smoothening",
        "service_title_arb": "\u062a\u0646\u0639\u064a\u0645",
        "service_duraction": 30,
        "service_amount": 300,
        "artist_start_time": null,
        "artist_end_time": null,
        "is_active": "1",
        "service_status": "new",
        "date_time": "2024-09-30 19:42:36"
      },
      {
        "id": 16,
        "order_id": 10,
        "store_id": "28",
        "artist_id": 31,
        "customer_id": 26,
        "order_number": "NMNO#A0001",
        "service_id": 37,
        "service_title": "Keratin Magic",
        "service_title_arb":
            "\u0627\u0644\u0643\u064a\u0631\u0627\u062a\u064a\u0646\u0627\u0644\u0633\u062d\u0631\u064a",
        "service_duraction": 60,
        "service_amount": 5000,
        "artist_start_time": null,
        "artist_end_time": null,
        "is_active": "1",
        "service_status": "new",
        "date_time": "2024-09-3019:42:36"
      }
    ]
  };
}
