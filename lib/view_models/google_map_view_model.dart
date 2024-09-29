import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:naemen/utils/app_constants.dart';
import 'package:naemen/utils/utils.dart';

import '../models/google_map_search_model.dart';
import '../models/prediction_model.dart';

class GoogleMapViewModel extends GetxController {
  // ============================== Variables ==================================
  LatLng _initialPosition = const LatLng(0.0, 0.0);
  GoogleMapController? _mapController;

  final RxList<Prediction> _predictionList = <Prediction>[].obs;

  final Rx<CameraPosition> _cameraPosition = const CameraPosition(
    target: LatLng(0.0, 0.0),
  ).obs;
  final Rx<LatLng> _draggedLatLng = const LatLng(0.0, 0.0).obs;

  final RxString _draggedAddress = "".obs;

  final RxBool _isMapLoading = false.obs;

  // =============================== Getters ===================================
  LatLng get getInitialPosition => _initialPosition;

  GoogleMapController? get getMapController => _mapController;

  List<Prediction> get getPredictionList => _predictionList;

  CameraPosition get getCameraPosition => _cameraPosition.value;

  LatLng get getDraggedLatLng => _draggedLatLng.value;

  String get getDraggedAddress => _draggedAddress.value;

  bool get getIsMapLoading => _isMapLoading.value;

  // =============================== Setters ===================================
  set setInitialPosition(LatLng latLng) => _initialPosition = latLng;

  set setMapController(GoogleMapController controller) =>
      _mapController = controller;

  set setPredictionList(List<Prediction> value) =>
      _predictionList.value = value;

  set setDraggedLatLng(LatLng value) => _draggedLatLng.value = value;

  set setDraggedAddress(String value) {
    _draggedAddress.value = value;
    update();
  }

  set setIsMapLoading(bool value) {
    _isMapLoading.value = value;
    update();
  }

  // =============================== Methods ===================================
  Future<List<Prediction>> searchAddressRequest({String? search}) async {
    var response = await http.get(
      Uri.parse(
          'https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$search&key=${AppConstants.googleMapAPIKey}'),
    );
    // dio.Response value = await handleResponse(data);
    setPredictionList = [];
    log(response.toString());
    var body = jsonDecode(response.body);
    if (body["status"] == "REQUEST_DENIED") {
      Utils.toastMessage(body["error_message"] ?? "Something went wrong!");
    } else {
      setPredictionList = GoogleMapSearchModel.fromJson(body).predictions ?? [];
    }
    return getPredictionList;
  }
}

// class GoogleMapViewModel2 extends GetxController {
//   // ============================== Variables ==================================
//   LatLng _initialPosition = const LatLng(0.0, 0.0);
//   GoogleMapController? _mapController;

//   // =============================== Getters ===================================
//   LatLng get getInitialPosition => _initialPosition;

//   GoogleMapController? get getMapController => _mapController;

//   // =============================== Setters ===================================
//   set setInitialPosition(LatLng latLng) => _initialPosition = latLng;

//   set setMapController(GoogleMapController controller) =>
//       _mapController = controller;

//   // =============================== Methods ===================================
// }
