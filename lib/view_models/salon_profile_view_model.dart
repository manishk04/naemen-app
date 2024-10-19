import 'dart:developer';

import 'package:get/get.dart';
import 'package:naemen/view_models/cart_view_model.dart';

import '../models/artist_model.dart';
import '../models/salon_model.dart';
import '../models/store_model.dart';
import '../repo/salon_repo.dart';
import '../routes/app_routes.dart';
import '../utils/utils.dart';

class SalonProfileViewModel extends GetxController {
  // ============================== Variables ==================================
  final SalonRepo _salonRepo = SalonRepo();

  int _selectedSalonId = -1;

  final Rx<StoreModel> _store = StoreModel().obs;

  final RxList<ArtistModel> _artists = <ArtistModel>[].obs;

  final RxBool _isLoading = false.obs;

  // =============================== Getters ===================================
  int get getSelectedSalonId => _selectedSalonId;

  StoreModel get getStore => _store.value;

  List<ArtistModel> get getArtists => _artists;

  bool get getIsLoading => _isLoading.value;

  // =============================== Setters ===================================
  set setSelectedSalonId(int id) => _selectedSalonId = id;

  set setStore(StoreModel store) => _store.value = store;

  set setArtists(List<ArtistModel> list) => _artists.value = list;

  set setIsLoading(bool value) => _isLoading.value = value;

  // =============================== Methods ===================================
  onViewProfileClick(SalonModel salon, CartViewModel cartViewModel) {
    setSelectedSalonId = salon.salonId ?? -1;
    fetchShopDetailsById(cartViewModel);
    Get.toNamed(Routes.shopRoute);
  }

  void fetchShopDetailsById(CartViewModel cartViewModel) async {
    Map<String, String> params = {
      "store_id": getSelectedSalonId.toString(),
    };
    setIsLoading = true;
    try {
      Map<String, dynamic> response =
          await _salonRepo.fetchSaloonDetailsById(params);
      log(response.toString());
      if (response["code"] == 200) {
        var data = response["data"];
        if (data != null) {
          if (data["store"] != null) {
            setStore = StoreModel.fromMap(data["store"]);
            cartViewModel.setSelectedStore = getStore;
          }
          if (data["store_artist"] != null && data["store_artist"] is List) {
            List<ArtistModel> list = <ArtistModel>[];
            for (var element in data["store_artist"]) {
              list.add(ArtistModel.fromMap(element));
            }
            setArtists = list;
          }
        } else {
          Utils.toastMessage(response["msg"] ?? "Something went wrong!");
        }
      } else {
        Utils.toastMessage(response["msg"] ?? "Something went wrong!");
      }
    } catch (e) {
      Utils.toastMessage(e.toString());
      log("fetchShopDetailsById Error => $e");
    }
    setIsLoading = false;
  }
}
