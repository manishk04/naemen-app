import '../network/base_api_services.dart';
import '../network/network_api_services.dart';
import '../utils/app_url.dart';

class OnboardingRepo {
  final BaseApiServices _apiServices = NetworkApiServices();

  Future<dynamic> fetchList() async {
    try {
      dynamic response = await _apiServices.getGetApiResponse(
          AppUrl.appIntroScreenUrl, null, null);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
