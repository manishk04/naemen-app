import 'dart:convert';

import 'package:naemen/utils/app_constants.dart';

import '../network/base_api_services.dart';
import '../network/network_api_services.dart';
import '../utils/app_url.dart';

class AuthRepo {
  final BaseApiServices _apiServices = NetworkApiServices();

  final String username = AppConstants.username;
  final String password = AppConstants.password;

  Future<dynamic> registerUser(data) async {
    // Encode the username and password in base64
    String basicAuth =
        "Basic ${base64Encode(utf8.encode("$username:$password"))}";
    try {
      dynamic response = await _apiServices.getPostApiResponse(
        AppUrl.registerUserUrl,
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

  Future<dynamic> checkMobile(data) async {
    // Encode the username and password in base64
    String basicAuth =
        "Basic ${base64Encode(utf8.encode("$username:$password"))}";
    try {
      dynamic response = await _apiServices.getPostApiResponse(
        AppUrl.checkMobileUrl,
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

  Future<dynamic> loginWithPassword(data) async {
    // Encode the username and password in base64
    String basicAuth =
        "Basic ${base64Encode(utf8.encode("$username:$password"))}";
    try {
      dynamic response = await _apiServices.getPostApiResponse(
        AppUrl.loginWithPasswordUrl,
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

  Future<dynamic> loginWithOTP(data) async {
    // Encode the username and password in base64
    String basicAuth =
        "Basic ${base64Encode(utf8.encode("$username:$password"))}";
    try {
      dynamic response = await _apiServices.getPostApiResponse(
        AppUrl.loginWithOtpUrl,
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

  Future<dynamic> resendOTP(data) async {
    // Encode the username and password in base64
    String basicAuth =
        "Basic ${base64Encode(utf8.encode("$username:$password"))}";
    try {
      dynamic response = await _apiServices.getPostApiResponse(
        AppUrl.resendOtpUrl,
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
