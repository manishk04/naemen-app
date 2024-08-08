import 'dart:developer';

import 'package:get/get.dart';

import '../models/banner_model.dart';
import '../models/category_model.dart';
import '../repo/home_repo.dart';
import '../utils/utils.dart';

class HomeViewModel extends GetxController {
  // ============================== Variables ==================================
  final HomeRepo _homeRepo = HomeRepo();

  final RxList<BannerModel> _banners = <BannerModel>[].obs;
  final RxList<CategoryModel> _homeCategories = <CategoryModel>[].obs;
  final RxList<CategoryModel> _allCategories = <CategoryModel>[].obs;

  // =============================== Getters ===================================
  List<BannerModel> get getBanners => _banners;
  List<CategoryModel> get getHomeCategories => _homeCategories;
  List<CategoryModel> get getAllCategories => _allCategories;

  // =============================== Setters ===================================
  set setBanners(List<BannerModel> list) => _banners.value = list;
  set setHomeCategories(List<CategoryModel> list) =>
      _homeCategories.value = list;
  set setAllCategories(List<CategoryModel> list) => _allCategories.value = list;

  // =============================== Methods ===================================
  void fetchBanners() async {
    List<BannerModel> list = <BannerModel>[];
    try {
      Map<String, dynamic> response = await _homeRepo.fetchBanners();
      log(response.toString());
      if (response["code"] == 200) {
        for (var element in response["data"]) {
          list.add(BannerModel.fromMap(element));
        }
        setBanners = list;
      } else {
        setBanners = [];
        Utils.toastMessage(response["msg"] ?? "Something went wrong!");
      }
    } catch (e) {
      setBanners = [];
      Utils.toastMessage(e.toString());
      log("fetchBanners Error => $e");
    }
  }

  void fetchHomeCategories() async {
    List<CategoryModel> list = <CategoryModel>[];
    try {
      Map<String, dynamic> response = await _homeRepo.fetchHomeCategories();
      log(response.toString());
      if (response["code"] == 200) {
        for (var element in response["data"]) {
          list.add(CategoryModel.fromMap(element));
        }
        setHomeCategories = list;
      } else {
        Utils.toastMessage(response["msg"] ?? "Something went wrong!");
        setHomeCategories = [];
      }
    } catch (e) {
      setHomeCategories = [];
      Utils.toastMessage(e.toString());
      log("fetchHomeCategories Error => $e");
    }
  }

  void fetchAllCategories() async {
    List<CategoryModel> list = <CategoryModel>[];
    try {
      Map<String, dynamic> response = await _homeRepo.fetchAllCategories();
      log(response.toString());
      if (response["code"] == 200) {
        for (var element in response["data"]) {
          list.add(CategoryModel.fromMap(element));
        }
        setAllCategories = list;
      } else {
        Utils.toastMessage(response["msg"] ?? "Something went wrong!");
        setAllCategories = [];
      }
    } catch (e) {
      setAllCategories = [];
      Utils.toastMessage(e.toString());
      log("fetchAllCategories Error => $e");
    }
  }
}
