import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:naemen/repo/artist_rpo.dart';
import 'package:naemen/view_models/auth_view_model.dart';
import 'package:naemen/view_models/cart_view_model.dart';
import 'package:naemen/views/components/add_service_warning.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../models/artist_model.dart';
import '../models/artist_service_model.dart';
import '../models/store_service_model.dart';
import '../routes/app_routes.dart';
import '../utils/app_functions.dart';
import '../utils/utils.dart';
import '../views/components/select_date_time_widget.dart';
import '../views/components/text_heading.dart';

class ArtistProfileViewModel extends GetxController {
  // ============================== Variables ==================================
  final CartViewModel _cartViewModel = Get.put(CartViewModel());

  final RxList<ExpansionTileController> _controllers =
      <ExpansionTileController>[].obs;

  final ArtistRepo _artistRepo = ArtistRepo();

  ArtistModel _selectedArtist = ArtistModel();

  final ItemScrollController _itemScrollController = ItemScrollController();

  List<StoreServiceModel> _storeServices = <StoreServiceModel>[];

  final RxList<String> _dates = <String>[].obs;
  final RxList<String> _timeSlots = <String>[].obs;

  final RxBool _isLoading = false.obs;
  final RxBool _isBooking = false.obs;

  final RxInt _desiredItemIndex = 0.obs;
  final RxInt _currentIndex = 0.obs;

  final RxString _selectedDate = "dd-MM-yyyy".obs;
  final RxString _selectedTime = "".obs;

  // =============================== Getters ===================================
  ArtistModel get getSelectedArtist => _selectedArtist;

  List<ExpansionTileController> get getControllers => _controllers;

  ItemScrollController get getItemScrollController => _itemScrollController;

  List<StoreServiceModel> get getStoreServices => _storeServices;

  List<String> get getDates => _dates;
  List<String> get getTimeSlots => _timeSlots;

  bool get getIsLoading => _isLoading.value;
  bool get getIsBooking => _isBooking.value;

  int get getDesiredItemIndex => _desiredItemIndex.value;
  int get getCurrentIndex => _currentIndex.value;

  String get getSelectedDate => _selectedDate.value;
  String get getSelectedTime => _selectedTime.value;

  // =============================== Setters ===================================
  set setSelectedArtist(ArtistModel artist) => _selectedArtist = artist;

  set setStoreServices(List<StoreServiceModel> services) =>
      _storeServices = services;

  set setControllers(List<ExpansionTileController> controllers) =>
      _controllers.value = controllers;

  set setDates(List<String> dates) => _dates.value = dates;
  set setTimeSlots(List<String> dates) => _timeSlots.value = dates;

  set setIsLoading(bool value) => _isLoading.value = value;
  set setIsBooking(bool value) => _isBooking.value = value;

  set setDesiredItemIndex(int index) => _desiredItemIndex.value = index;

  set setSelectedDate(String date) => _selectedDate.value = date;
  set setSelectedTime(String time) => _selectedTime.value = time;

  // =============================== Methods ===================================
  void resetOrderData() {
    // After Order Success
    setSelectedDate = getDates[0];
    setSelectedTime = "";
  }

  void onServiceAdd(ArtistServiceModel service) {
    if (_cartViewModel.getAddedServiceList.isEmpty ||
        (service.salonId == _cartViewModel.getAddedServiceList[0].salonId)) {
      _cartViewModel.addService(service);
      showDateTimeDialog(service);
    } else {
      Get.dialog(
        AddServiceWarning(
          onRemove: () {
            _cartViewModel.clearServices();
            _cartViewModel.addService(service);
            showDateTimeDialog(service);
          },
        ),
      );
    }
  }

  void onRemoveService(ArtistServiceModel service) {
    _cartViewModel.remove(service);
  }

  showDateTimeDialog(ArtistServiceModel service) {
    setDates = getNextSevenDays();
    setSelectedDate = getDates[0];
    int serviceDuration = int.parse(service.serviceDuration ?? "0");
    int intervalMinutes = serviceDuration + 10; // Interval between start times
    int slotDurationMinutes = serviceDuration; // Duration of each slot

    List<String> slots = generateTimeSlots(
      intervalMinutes: intervalMinutes,
      slotDurationMinutes: slotDurationMinutes,
    );
    log(slots.toString());
    setTimeSlots = slots;
    Get.bottomSheet(
      BottomSheet(
        backgroundColor: Colors.black,
        onClosing: () => onBottomSheetCancel(),
        builder: (_) => SelectDateTimeWidget(
          onOkayClick: () {
            if (getSelectedTime == "") {
              Utils.toastMessage("Please Selected time!");
            } else {
              _cartViewModel.getAddedServiceList.last.date = getSelectedDate;
              _cartViewModel.getAddedServiceList.last.time = getSelectedTime;
              setSelectedTime = "";
              Get.back();
            }
          },
          onCancelClick: () => onBottomSheetCancel(),
        ),
      ),
      isDismissible: false,
    );
  }

  onBottomSheetCancel() {
    Get.back();
    _cartViewModel.getAddedServiceList.removeLast();
    setSelectedTime = "";
  }

  Future selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      onDateSelect(DateFormat('dd-MM-yyyy').format(picked));
      log(getSelectedDate);
    }
  }

  onDateSelect(String date) {
    setSelectedDate = date;
  }

  void scrollToIndex(int index) {
    _itemScrollController.scrollTo(
      index: index,
      duration: const Duration(seconds: 1),
      curve: Curves.easeInOutCubic,
    );
  }

  onPreviousClick() {
    if (getDesiredItemIndex != 0) {
      setDesiredItemIndex = getDesiredItemIndex - 1;
      scrollToIndex(getDesiredItemIndex);
    }
  }

  onNextClick() {
    if (getDesiredItemIndex < getDates.length - 1) {
      setDesiredItemIndex = getDesiredItemIndex + 1;
      scrollToIndex(getDesiredItemIndex);
    }
  }

  onViewProfileClick(ArtistModel artist, CartViewModel cartViewModel,
      AuthViewModel authViewModel) {
    if (authViewModel.getCustomer.id == null) {
      Utils.toastMessage("Please Login to proceed!");
      Get.offAllNamed(Routes.verifyMobileViewRoute);
    } else {
      setSelectedArtist = artist;
      fetchArtistProfile(cartViewModel);
      Get.toNamed(Routes.artistProfileRoute);
    }
  }

  void fetchArtistProfile(CartViewModel cartViewModel) async {
    List<StoreServiceModel> list = <StoreServiceModel>[];
    List<ExpansionTileController> list2 = <ExpansionTileController>[];
    Map<String, String> params = {
      "artist_id": (getSelectedArtist.id ?? -1).toString(),
    };
    setIsLoading = true;
    try {
      Map<String, dynamic> response =
          await _artistRepo.fetchArtistDetails(params);
      log(response.toString());
      if (response["code"] == 200) {
        var data = response["data"];
        if (data != null) {
          if (data["artist_profile"] != null) {
            setSelectedArtist = ArtistModel.fromMap(data["artist_profile"]);
            cartViewModel.setSelectedArtist = getSelectedArtist;
          }
          if (data["store_services"] != null &&
              data["store_services"] is List) {
            for (var element in data["store_services"]) {
              list.add(StoreServiceModel.fromMap(element));
            }
            setStoreServices = list;
            for (var _ in getStoreServices) {
              list2.add(ExpansionTileController());
            }
            setControllers = list2;
          }
        } else {
          Utils.toastMessage(response["msg"] ?? "Something went wrong!");
        }
      } else {
        Utils.toastMessage(response["msg"] ?? "Something went wrong!");
      }
    } catch (e) {
      Utils.toastMessage(e.toString());
      log("fetchArtistProfile Error => $e");
    }
    setIsLoading = false;
  }

  Future<void> checkArtistAvailability() async {
    setIsBooking = true;

    // Simulate a network request or delay
    await Future.delayed(const Duration(seconds: 5));

    setIsBooking = false;

    // Example: Check if the artist is available
    bool isArtistAvailable = _isArtistAvailable();

    // Show the popup
    _showAvailabilityPopup(isArtistAvailable);
  }

  bool _isArtistAvailable() {
    // Logic to determine if the artist is available
    // This is just an example, you would replace this with your actual logic
    return true; // Just a random condition
  }

  void _showAvailabilityPopup(bool isAvailable) {
    Get.dialog(
      AlertDialog(
        backgroundColor: Colors.black,
        iconColor: Colors.white,
        title: Text(
          isAvailable ? 'Artist Available' : 'Artist Unavailable',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        content: Text(
          isAvailable
              ? 'The artist is available for the appointment.'
              : 'The artist is not available at the moment.',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Get.back();
              Get.toNamed(Routes.bookingDetailRoute);
            },
            child: Container(
              height: 23.h,
              width: 55.w,
              decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.circular(4.r)),
              child: Center(
                child: TextHeading(
                    title: "Okay",
                    fontweight: FontWeight.w400,
                    fontsize: 12.sp,
                    fontcolor: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }

  final data = {
    "code": 200,
    "data": {
      "artist_profile": {
        "id": 4,
        "salon_id": 10,
        "artist_name_eng": "nsnsn",
        "artist_name_arb": "bababns",
        "artist_email": "haja@gmail.com",
        "artist_contact_number": "9869869866",
        "artist_image": "assets\/images\/salon-img\/66bb940f63e69.webp",
        "gender": "Male",
        "artist_categories": null,
        "account_number": "67899890",
        "account_holder_name": "vaha",
        "account_ifsc": null,
        "bank_name": "hkl",
        "is_active": "1",
        "date_time": "2024-07-30 12:54:41",
        "added_by": "sam",
        "update_date": null,
        "updated_by": null,
        "salon_name_eng": "hddjdj",
        "salon_name_arb": "gxhdhdy",
        "email": "Ssaurabhppathak@gmail.co",
        "contact_number": "84979494",
        "salon_image": "assets\/images\/salon-img\/66bb901c580ae.webp"
      },
      "store_services": [
        {
          "id": 1,
          "salon_id": 10,
          "category_id": 10,
          "sub_category_id": 1,
          "services_name_eng": "hai",
          "service_name_arb": "hai",
          "services_image": null,
          "service_amount": 800,
          "service_commission": 0,
          "service_final_amount": 800,
          "service_durattion": "90",
          "service_des_eng": "gahshwhs",
          "service_des_arb": "hahajja",
          "is_active": "1",
          "is_delete": "1",
          "date_time": "2024-07-30 12:53:57",
          "added_by": "sam",
          "updated_date": null,
          "updated_by": null,
          "salon_name_eng": "hddjdj",
          "salon_name_arb": "gxhdhdy",
          "email": "Ssaurabhppathak@gmail.co",
          "contact_number": "84979494",
          "salon_image": "assets\/images\/salon-img\/66bb901c580ae.webp",
          "category_title": "Hair",
          "category_arb": "\u0634\u0639\u0631"
        }
      ]
    }
  };
}
