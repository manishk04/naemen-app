import 'dart:developer';

import 'package:get/get.dart';
import 'package:naemen/view_models/auth_view_model.dart';

import '../models/onboarding_model.dart';
import '../repo/cart_repo.dart';
import '../repo/onboarding_repo.dart';
import '../routes/app_routes.dart';

class AppointmentHistoryViewModel extends GetxController {
  // ============================== Variables ==================================
  final CartRepo _cartRepo = CartRepo();

  // =============================== Getters ===================================

  // =============================== Setters ===================================

  // =============================== Methods ===================================
  @override
  void onInit() {
    super.onInit();
  }

  // void fetchAppointmentHistory(AuthViewModel authViewModel) async {
  //   Map<String, String> params = {
  //     "customer_id": authViewModel.getCustomer.id.toString(),
  //     // "date": getSelectedDate,
  //     // "date": "31-08-2024",
  //   };
  //   setIsSlotLoading = true;
  //   update();
  //   try {
  //     Map<String, dynamic> response =
  //         await _artistRepo.fetchArtistBookingCalendar(data);
  //     log(response.toString());
  //     if (response["order"] != null &&
  //         response["order"] is List &&
  //         (response["order"] as List).isNotEmpty) {
  //       for (var element in response["order"]) {
  //         // Split the input string by the hyphen to separate start and end times
  //         List<String> times = element.split('-');

  //         // Parse the times to DateTime objects
  //         DateTime startTime = DateFormat('HH:mm:ss').parse(times[0]);
  //         DateTime endTime = DateFormat('HH:mm:ss').parse(times[1]);

  //         // Format the DateTime objects to the desired format
  //         String formattedStartTime = DateFormat('HH:mm a').format(startTime);
  //         String formattedEndTime = DateFormat('HH:mm a').format(endTime);

  //         // Combine the formatted times into a single string
  //         appointedSlots.add("$formattedStartTime - $formattedEndTime");
  //       }
  //       log(appointedSlots.toString());
  //       log(getTimeSlots.toString());
  //     }
  //   } catch (e) {
  //     Utils.toastMessage(e.toString());
  //     log("fetchArtistBookingCalendar Error => $e");
  //   }
  //   setAppointedTimeSlots = appointedSlots;
  //   setIsSlotLoading = false;
  //   update();
  // }

  var data = {
    "order": [
      {
        "orderId": 27,
        "order_number": "NMNO#A0002",
        "service_date": "2024-08-31",
        "customer_id": 24,
        "store_id": "SADAA0003",
        "customer_address": "Chandralokcolony aliganjlucknow",
        "lat": "26.77678290",
        "lng": "80.93706950",
        "order_amount": 1499,
        "coupon_id": null,
        "coupon_code": null,
        "service_start_time": "13:00:00",
        "service_end_time": "13:50:00",
        "artist_id": 13,
        "discount_amount": 0,
        "final_pay_amount": 1499,
        "payment_status": "cod",
        "payment_id": "",
        "order_status": "new",
        "order_generate_time": "2024-09-0614:08:25",
        "customer_name": "Manish",
        "email": "manish@gmail.com",
        "contact_number": "898240449",
        "profile_pic": null,
        "salon_name_eng": "testbusiness2",
        "salon_name_arb": "test",
        "salon_image": "assets\/images\/salon-img\/66b7390c44cac.webp",
        "cr_no": "",
        "vat_no": "",
        "log_address": "80.92662970",
        "lat_address": "26.96405390",
        "city_iso": "DA",
        "address_2": "bkt",
        "artist_name_eng": "tanveer",
        "artist_name_arb": "\u062a\u0646\u0648\u064a\u0631",
        "artist_contact_number": "8982404462",
      }
    ]
  };
}
