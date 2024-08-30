import 'package:get/get.dart';
import 'package:naemen/models/artist_model.dart';
import 'package:naemen/models/store_model.dart';

import '../models/artist_service_model.dart';

class CartViewModel extends GetxController {
  // ============================== Variables ==================================
  final RxList<ArtistServiceModel> _addedServicesList =
      <ArtistServiceModel>[].obs;
  final Rx<StoreModel> _selectedStore = StoreModel().obs;
  final Rx<ArtistModel> _selectedArtist = ArtistModel().obs;

  // =============================== Getters ===================================
  List<ArtistServiceModel> get getAddedServiceList => _addedServicesList;

  StoreModel get getSelectedStore => _selectedStore.value;

  ArtistModel get getSelectedArtist => _selectedArtist.value;

  // =============================== Setters ===================================
  set setAddedServices(List<ArtistServiceModel> list) =>
      _addedServicesList.value = list;

  set setSelectedStore(StoreModel store) => _selectedStore.value = store;

  set setSelectedArtist(ArtistModel artist) => _selectedArtist.value = artist;

  // =============================== Methods ===================================
  addService(ArtistServiceModel service) => _addedServicesList.add(service);
  clearServices() => setAddedServices = [];
  remove(ArtistServiceModel service) =>
      _addedServicesList.removeWhere((data) => data.id == service.id);
  int fetchSubtotal() {
    int total = 0;
    for (var service in _addedServicesList) {
      total = total + (service.serviceFinalAmount ?? 0);
    }
    return total;
  }
}
