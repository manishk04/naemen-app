import '../network/base_api_services.dart';
import '../network/network_api_services.dart';
import '../utils/app_url.dart';

class HomeRepo {
  final BaseApiServices _apiServices = NetworkApiServices();

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
}
