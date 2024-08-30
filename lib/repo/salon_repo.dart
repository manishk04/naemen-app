import '../network/base_api_services.dart';
import '../network/network_api_services.dart';
import '../utils/app_url.dart';

class SalonRepo {
  final BaseApiServices _apiServices = NetworkApiServices();

  Future<dynamic> fetchSaloonDetailsById(params) async {
    try {
      dynamic response = await _apiServices.getGetApiResponse(
          AppUrl.storeDetailsUrl, params, null);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
