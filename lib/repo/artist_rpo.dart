import '../network/base_api_services.dart';
import '../network/network_api_services.dart';
import '../utils/app_url.dart';

class ArtistRepo {
  final BaseApiServices _apiServices = NetworkApiServices();

  Future<dynamic> fetchArtistDetails(params) async {
    try {
      dynamic response = await _apiServices.getGetApiResponse(
          AppUrl.artistProfileUrl, params, null);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
