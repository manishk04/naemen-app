import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
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

  Completer<GoogleMapController> googleMapController = Completer();

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

  init() async {
    // Map will redirect to users current location when loaded
    setIsMapLoading = true;
    await gotoUserCurrentPosition().then((_) {
      setIsMapLoading = false;
    });
  }

  Future getAddress() async {
    try {
      LatLng position = getDraggedLatLng;
      // This will list down all address around the position
      List<Placemark> placemarks =
          await placemarkFromCoordinates(position.latitude, position.longitude);
      Placemark address = placemarks[0];
      String addressStr =
          "${address.street}, ${address.subLocality}, ${address.locality}, ${address.subAdministrativeArea}, ${address.administrativeArea}, ${address.country}";
      setDraggedAddress = addressStr;
    } catch (e) {
      log(e.toString());
    }
  }

  Future determineUsersCurrentPosition() async {
    LocationPermission locationPermission;
    bool isLocationServiceEnabled = await Geolocator.isLocationServiceEnabled();
    // Check if user enable service for location permission
    if (!isLocationServiceEnabled) {
      log("User don't enable location permission");
    }
    locationPermission = await Geolocator.checkPermission();
    // check if user denied location and retyr requesting for permission
    if (locationPermission == LocationPermission.denied) {
      locationPermission = await Geolocator.requestPermission();
      if (locationPermission == LocationPermission.denied) {
        log("User denied location permission!");
      }
    }

    // Check if user denied permission forever
    if (locationPermission == LocationPermission.deniedForever) {
      log("User denied permission forever");
    }

    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best);
  }

  // get Users current Location and set the Map's camera position to That Location
  Future gotoUserCurrentPosition() async {
    Position currentPosition = await determineUsersCurrentPosition();
    // gotoSpecificPosition(
    //     LatLng(18.574061, 73.773638));
    gotoSpecificPosition(
        LatLng(currentPosition.latitude, currentPosition.longitude));
  }

  // Go to specific position by LatLng
  Future gotoSpecificPosition(LatLng position) async {
    GoogleMapController mapController = await googleMapController.future;
    mapController.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(target: position, zoom: 15.5)));
    // Every time user drag pin will get address
    setDraggedLatLng = position;
    getAddress();
  }

  backClick() {
    setDraggedLatLng = const LatLng(0.0, 0.0);
    // if (_locationViewModel.getIsChangeClicked) {
    //   Get.offNamed(Routes.addAddressRoute);
    // } else {
    //   Get.offNamed(Routes.selectLocationRoute);
    // }
    // _locationViewModel.setIsChangeClicked(true);
    // Get.offNamed(Routes.selectLocationRoute);
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
