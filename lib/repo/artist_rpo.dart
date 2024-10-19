import 'dart:convert';

import '../network/base_api_services.dart';
import '../network/network_api_services.dart';
import '../utils/app_constants.dart';
import '../utils/app_url.dart';

class ArtistRepo {
  final BaseApiServices _apiServices = NetworkApiServices();

  final String username = AppConstants.username;
  final String password = AppConstants.password;

  Future<dynamic> fetchArtistDetails(params) async {
    try {
      dynamic response = await _apiServices.getGetApiResponse(
          AppUrl.artistProfileUrl, params, null);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> fetchArtistBookingCalendar(data) async {
    // Encode the username and password in base64
    String basicAuth =
        "Basic ${base64Encode(utf8.encode("$username:$password"))}";
    try {
      dynamic response = await _apiServices.getPostApiResponse(
        AppUrl.artistBookingCalendarUrl,
        data,
        <String, String>{
          "authorization": basicAuth,
          "Content-Type": "application/json",
        },
        isFormData: true,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
