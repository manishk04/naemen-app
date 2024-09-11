import 'dart:convert';
import 'dart:developer';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:http/http.dart' as http;

import 'app_exceptions.dart';
import 'base_api_services.dart';

class NetworkApiServices extends BaseApiServices {
  @override
  Future getGetApiResponse(String url, Map<String, dynamic>? queryParams,
      Map<String, String>? headers) async {
    dynamic responseJson;
    try {
      final connectivityResult = await Connectivity().checkConnectivity();
      if (connectivityResult.contains(ConnectivityResult.none)) {
        throw FetchDataException("No Internet Connection!");
      }
      Uri uri = Uri.parse(url);
      if (queryParams != null) {
        uri = Uri.parse(url).replace(queryParameters: queryParams);
      }
      final response = await http
          .get(uri, headers: headers)
          .timeout(const Duration(seconds: 60));
      responseJson = await returnResponse(response);
      log(uri.toString());
      log(response.toString());
    } catch (e) {
      throw FetchDataException("Something went wrong: $e");
    }
    return responseJson;
  }

  @override
  Future getPostApiResponse(String url, dynamic data, dynamic headers,
      {bool isFormData = false}) async {
    dynamic responseJson;
    try {
      final connectivityResult = await Connectivity().checkConnectivity();
      if (connectivityResult.contains(ConnectivityResult.none)) {
        throw FetchDataException("No Internet Connection!");
      }

      Uri uri = Uri.parse(url);

      // Prepare the request
      http.Response response;
      if (isFormData) {
        var request = http.MultipartRequest('POST', uri);

        // Add form data fields
        if (data is Map<String, String>) {
          request.fields.addAll(data);
        }

        // Add headers
        request.headers.addAll(headers);

        // Send the request
        var streamedResponse = await request.send();
        log(streamedResponse.toString());
        response = await http.Response.fromStream(streamedResponse);
        log(response.toString());
        // return streamedResponse;
      } else {
        response = await http
            .post(uri, body: data, headers: headers)
            .timeout(const Duration(seconds: 60));
      }
      log(response.toString());
      responseJson = await returnResponse(response);
      log(url);
      log(response.body.toString());
    } catch (e) {
      throw FetchDataException("Something went wrong: $e");
    }
    return responseJson;
  }

  dynamic returnResponse(http.Response response) async {
    switch (response.statusCode) {
      case 200:
      case 201:
      case 319:
        String responseJson = response.body;
        Map<String, dynamic> responseMap = json.decode(responseJson);
        return responseMap;
      case 400:
        throw BadRequestException(response.body.toString());
      case 500:
      case 404:
        throw UnauthorizedException(response.body.toString());
      default:
        throw FetchDataException(
            "Error occurred while communicating with server. With status code ${response.statusCode}");
    }
  }
}
