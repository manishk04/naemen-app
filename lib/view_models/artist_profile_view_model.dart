import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:naemen/models/store_model.dart';
import 'package:naemen/repo/artist_rpo.dart';
import 'package:naemen/view_models/auth_view_model.dart';
import 'package:naemen/view_models/cart_view_model.dart';
import 'package:naemen/views/components/add_service_warning.dart';
import 'package:naemen/views/screens/home_page.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../models/artist_model.dart';
import '../models/artist_service_model.dart';
import '../models/store_service_model.dart';
import '../routes/app_routes.dart';
import '../utils/app_functions.dart';
import '../utils/utils.dart';
import '../views/components/already_added_warning.dart';
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
  final RxList<String> _appointedTimeSlots = <String>[].obs;

  final RxBool _isLoading = false.obs;
  final RxBool _isSlotLoading = false.obs;
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
  List<String> get getAppointedTimeSlots => _appointedTimeSlots;

  bool get getIsLoading => _isLoading.value;
  bool get getIsSlotLoading => _isSlotLoading.value;
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
  set setAppointedTimeSlots(List<String> dates) =>
      _appointedTimeSlots.value = dates;

  set setIsLoading(bool value) => _isLoading.value = value;
  set setIsSlotLoading(bool value) => _isSlotLoading.value = value;
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
    if (_cartViewModel.getAddedServiceList.isNotEmpty) {
      // Services List is Not Empty
      if (_cartViewModel.getAddedServiceList[0].artist?.id ==
          getSelectedArtist.id) {
        // already added services and the newly added service are from the same Artist
        service.artist = getSelectedArtist;
        _cartViewModel.addService(service);
      } else {
        // already added services and the newly added service are from the different Artist
        Get.dialog(
          AlreadyAddedWarning(
            onYesClick: () {
              Get.back();
              _cartViewModel.clearServices();
              service.artist = getSelectedArtist;
              _cartViewModel.addService(service);
            },
          ),
        );
      }
    } else {
      // Services List is Empty
      service.artist = getSelectedArtist;
      _cartViewModel.addService(service);
    }
    // service.artist = getSelectedArtist;
    // if (_cartViewModel.getAddedServiceList.isEmpty ||
    //     (service.salonId == _cartViewModel.getAddedServiceList[0].salonId)) {
    //   ArtistServiceModel serviceAlreadyAdded =
    //       _cartViewModel.getAddedServiceList.firstWhere(
    //     (element) => element.id == service.id,
    //     orElse: () => ArtistServiceModel(),
    //   );
    //   if (serviceAlreadyAdded.id != null) {
    //     Get.dialog(
    //       AlreadyAddedWarning(
    //         onYesClick: () {
    //           Get.back();
    //           _cartViewModel.remove(serviceAlreadyAdded);
    //           _cartViewModel.addService(service);
    //           showDateTimeDialog(service, store);
    //         },
    //       ),
    //     );
    //   } else {
    //     _cartViewModel.addService(service);
    //     showDateTimeDialog(service, store);
    //   }
    // } else {
    //   Get.dialog(
    //     AddServiceWarning(
    //       onRemove: () {
    //         _cartViewModel.clearServices();
    //         _cartViewModel.addService(service);
    //         showDateTimeDialog(service, store);
    //       },
    //     ),
    //   );
    // }
  }

  void onRemoveService(ArtistServiceModel service) {
    _cartViewModel.remove(service);
  }

  int intervalMinutes = 0; // Interval between start times
  int slotDurationMinutes = 0; // Duration of each slot
  String startTime = "";
  String endTime = "";

  showDateTimeDialog() {
    startTime = _cartViewModel.getSelectedStore.salonStartTime ?? "";
    endTime = _cartViewModel.getSelectedStore.salonEndTime ?? "";
    setDates = getNextSevenDays();
    setSelectedDate = getDates[0];
    int serviceDuration = 0;
    for (var service in _cartViewModel.getAddedServiceList) {
      serviceDuration += int.parse(service.serviceDuration ?? "0");
    }
    log(serviceDuration.toString());
    intervalMinutes = serviceDuration + 10; // Interval between start times
    slotDurationMinutes = serviceDuration; // Duration of each slot

    List<String> slots = generateTimeSlots(
      startTime: startTime,
      endTime: endTime,
      intervalMinutes: intervalMinutes,
      slotDurationMinutes: slotDurationMinutes,
      selectedDate: getSelectedDate,
    );
    log(slots.toString());
    setTimeSlots = slots;
    fetchArtistBookingCalendar();
    Get.bottomSheet(
      BottomSheet(
        backgroundColor: Colors.black,
        onClosing: () => onBottomSheetCancel(),
        builder: (_) => SelectDateTimeWidget(
          onOkayClick: () {
            if (getSelectedTime == "") {
              Utils.toastMessage("Please Selected time!");
            } else {
              Get.back();
              checkArtistAvailability();
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
      fetchArtistBookingCalendar();
    }
  }

  onDateSelect(String date) {
    setSelectedDate = date;
    List<String> slots = generateTimeSlots(
      startTime: startTime,
      endTime: endTime,
      intervalMinutes: intervalMinutes,
      slotDurationMinutes: slotDurationMinutes,
      selectedDate: getSelectedDate,
    );
    log(slots.toString());
    setTimeSlots = slots;
    fetchArtistBookingCalendar();
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

  void fetchArtistBookingCalendar() async {
    List<String> appointedSlots = <String>[];
    // Encode the username and password in base64
    String basicArtistID =
        base64Encode(utf8.encode((getSelectedArtist.id ?? -1).toString()));
    Map<String, String> data = {
      "artist_id": basicArtistID,
      "date": getSelectedDate,
      // "date": "31-08-2024",
    };
    setIsSlotLoading = true;
    update();
    try {
      Map<String, dynamic> response =
          await _artistRepo.fetchArtistBookingCalendar(data);
      log(response.toString());
      if (response["order"] != null &&
          response["order"] is List &&
          (response["order"] as List).isNotEmpty) {
        for (var element in response["order"]) {
          // Split the input string by the hyphen to separate start and end times
          List<String> times = element.split('-');

          // Parse the times to DateTime objects
          DateTime startTime = DateFormat('HH:mm:ss').parse(times[0]);
          DateTime endTime = DateFormat('HH:mm:ss').parse(times[1]);

          // Format the DateTime objects to the desired format
          String formattedStartTime = DateFormat('HH:mm').format(startTime);
          String formattedEndTime = DateFormat('HH:mm').format(endTime);

          // Combine the formatted times into a single string
          appointedSlots.add("$formattedStartTime - $formattedEndTime");
        }
        log(appointedSlots.toString());
        log(getTimeSlots.toString());
      }
    } catch (e) {
      Utils.toastMessage(e.toString());
      log("fetchArtistBookingCalendar Error => $e");
    }
    setAppointedTimeSlots = appointedSlots;
    setIsSlotLoading = false;
    update();
  }

  Future<void> checkArtistAvailability() async {
    setIsBooking = true;

    // Simulate a network request or delay
    await Future.delayed(const Duration(seconds: 5));

    setIsBooking = false;

    // Example: Check if the artist is available
    // bool isArtistAvailable = _isArtistAvailable();

    // // Show the popup
    // _showAvailabilityPopup(isArtistAvailable);
    Get.toNamed(Routes.bookingDetailRoute);
  }

  // bool _isArtistAvailable() {
  //   // Logic to determine if the artist is available
  //   // This is just an example, you would replace this with your actual logic
  //   return true; // Just a random condition
  // }

  // void _showAvailabilityPopup(bool isAvailable) {
  //   Get.dialog(
  //     AlertDialog(
  //       backgroundColor: Colors.black,
  //       iconColor: Colors.white,
  //       title: Text(
  //         isAvailable ? 'Artist Available' : 'Artist Unavailable',
  //         style: TextStyle(
  //           color: Colors.white,
  //         ),
  //       ),
  //       content: Text(
  //         isAvailable
  //             ? 'The artist is available for the appointment.'
  //             : 'The artist is not available at the moment.',
  //         style: TextStyle(
  //           color: Colors.white,
  //         ),
  //       ),
  //       actions: [
  //         TextButton(
  //           onPressed: () {
  //             Get.back();
  //             Get.toNamed(Routes.bookingDetailRoute);
  //           },
  //           child: Container(
  //             height: 23.h,
  //             width: 55.w,
  //             decoration: BoxDecoration(
  //                 color: Colors.orange,
  //                 borderRadius: BorderRadius.circular(4.r)),
  //             child: Center(
  //               child: TextHeading(
  //                   title: "Okay",
  //                   fontweight: FontWeight.w400,
  //                   fontsize: 12.sp,
  //                   fontcolor: Colors.white),
  //             ),
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }
}
