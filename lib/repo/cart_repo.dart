import 'dart:convert';

import '../network/base_api_services.dart';
import '../network/network_api_services.dart';
import '../utils/app_constants.dart';
import '../utils/app_url.dart';

class CartRepo {
  final BaseApiServices _apiServices = NetworkApiServices();

  final String username = AppConstants.username;
  final String password = AppConstants.password;

  Future<dynamic> generateOrder(data) async {
    // Encode the username and password in base64
    String basicAuth =
        "Basic ${base64Encode(utf8.encode("$username:$password"))}";
    try {
      dynamic response = await _apiServices.getPostApiResponse(
        AppUrl.generateOrderUrl,
        jsonEncode(data),
        <String, String>{
          "authorization": basicAuth,
          "Content-Type": "application/json",
        },
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
