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
  @override
  void onInit() {
    super.onInit();
  }

  init() async {
    _latitude = double.parse(await StorageData.getLatitude());
    _longitude = double.parse(await StorageData.getLongitude());
  }

  void fetchAppointmentHistory(AuthViewModel authViewModel) async {
    List<OrderModel> list = <OrderModel>[];
    OrdersModel ordersData = OrdersModel();
    Map<String, String> params = {
      "customer_id": authViewModel.getCustomer.id.toString(),
      "order_status": fetchOrderStatusString(getFilter),
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
}
