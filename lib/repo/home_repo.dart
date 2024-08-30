import 'dart:convert';

import '../network/base_api_services.dart';
import '../network/network_api_services.dart';
import '../utils/app_constants.dart';
import '../utils/app_url.dart';

class HomeRepo {
  final BaseApiServices _apiServices = NetworkApiServices();

  final String username = AppConstants.username;
  final String password = AppConstants.password;

  Future<dynamic> fetchBanners() async {
    try {
      dynamic response =
          await _apiServices.getGetApiResponse(AppUrl.appBannerUrl, null, null);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> fetchHomeCategories() async {
    try {
      dynamic response = await _apiServices.getGetApiResponse(
          AppUrl.homeCategoriesListUrl, null, null);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> fetchAllCategories() async {
    try {
      dynamic response = await _apiServices.getGetApiResponse(
          AppUrl.allCategoriesListUrl, null, null);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> fetchHomeTagData(data) async {
    // Encode the username and password in base64
    String basicAuth =
        "Basic ${base64Encode(utf8.encode("$username:$password"))}";
    try {
      dynamic response = await _apiServices.getPostApiResponse(
        AppUrl.homeTagDataUrl,
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

  Future<dynamic> fetchStoresByCategory(data) async {
    // Encode the username and password in base64
    String basicAuth =
        "Basic ${base64Encode(utf8.encode("$username:$password"))}";
    try {
      dynamic response = await _apiServices.getPostApiResponse(
        AppUrl.categoriesByStoreUrl,
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
