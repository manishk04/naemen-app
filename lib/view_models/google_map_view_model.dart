import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapViewModel extends GetxController {
  // ============================== Variables ==================================
  LatLng _initialPosition = const LatLng(0.0, 0.0);
  GoogleMapController? _mapController;

  // =============================== Getters ===================================
  LatLng get getInitialPosition => _initialPosition;

  GoogleMapController? get getMapController => _mapController;

  // =============================== Setters ===================================
  set setInitialPosition(LatLng latLng) => _initialPosition = latLng;

  set setMapController(GoogleMapController controller) =>
      _mapController = controller;

  // =============================== Methods ===================================
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
