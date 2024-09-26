import 'dart:developer';

import 'package:get/get.dart';
import 'package:naemen/models/vender_list_model.dart';
import 'package:naemen/routes/app_routes.dart';

import '../models/banner_model.dart';
import '../models/category_model.dart';
import '../models/tag_model.dart';
import '../repo/home_repo.dart';
import '../utils/storage_data.dart';
import '../utils/utils.dart';

class HomeViewModel extends GetxController {
  // ============================== Variables ==================================
  final HomeRepo _homeRepo = HomeRepo();

  final RxList<BannerModel> _banners = <BannerModel>[].obs;
  final RxList<CategoryModel> _homeCategories = <CategoryModel>[].obs;
  final RxList<CategoryModel> _allCategories = <CategoryModel>[].obs;

  final RxList<TagModel> _tags = <TagModel>[].obs;

  final RxBool _isStoresByCategoryLoading = false.obs;
  final RxBool _isHomeLoading = false.obs;

  CategoryModel _selectedCategory = CategoryModel();

  VenderListModel _venderList = VenderListModel();

  // =============================== Getters ===================================
  List<BannerModel> get getBanners => _banners;
  List<CategoryModel> get getHomeCategories => _homeCategories;
  List<CategoryModel> get getAllCategories => _allCategories;

  List<TagModel> get getTags => _tags;

  bool get getIsStoresByCategoryLoading => _isStoresByCategoryLoading.value;
  bool get getIsHomeLoading => _isHomeLoading.value;

  CategoryModel get getSelectedCategory => _selectedCategory;

  VenderListModel get getVenderList => _venderList;

  // =============================== Setters ===================================
  set setBanners(List<BannerModel> list) => _banners.value = list;
  set setHomeCategories(List<CategoryModel> list) =>
      _homeCategories.value = list;
  set setAllCategories(List<CategoryModel> list) => _allCategories.value = list;

  set setTags(List<TagModel> tag) => _tags.value = tag;

  set setIsStoreByCategoryLoading(bool value) =>
      _isStoresByCategoryLoading.value = value;
  set setIsHomeLoading(bool value) => _isHomeLoading.value = value;

  set setSelectedCategory(CategoryModel category) =>
      _selectedCategory = category;

  set setVenderList(VenderListModel data) => _venderList = data;

  // =============================== Methods ===================================
  init() {
    fetchBanners();
    fetchHomeCategories();
    fetchAllCategories();
    fetchHomeTagData();
  }

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

  void fetchHomeTagData() async {
    List<TagModel> tags = <TagModel>[];
    try {
      setIsHomeLoading = true;
      String lat = await StorageData.getLatitude();
      String lng = await StorageData.getLongitude();
      Map<String, String> data = {
        // "lat": "26.88535240",
        // "lng": "80.94372100",
        "lat": lat,
        "lng": lng,
      }; // TODO: Uncomment for current location
      Map<String, dynamic> response = await _homeRepo.fetchHomeTagData(data);
      log(response.toString());
      if (response["code"] == 200) {
        var data = response["data"];
        if (data != null && data is List && data.isNotEmpty) {
          for (var element in data) {
            tags.add(TagModel.fromMap(element["tag"]));
          }
          setTags = tags;
          setIsHomeLoading = false;
        } else {
          setIsHomeLoading = false;
          Utils.toastMessage(response["msg"] ?? "Something went wrong!");
        }
      } else {
        setIsHomeLoading = false;
        Utils.toastMessage(response["msg"] ?? "Something went wrong!");
      }
    } catch (e) {
      setIsHomeLoading = false;
      Utils.toastMessage(e.toString());
      log("fetchHomeTagData Error => $e");
    }
  }

  onCategorySelect(CategoryModel category, bool canNavigate) {
    setSelectedCategory = category;
    fetchStoresByCategory();
    if (canNavigate) {
      Get.toNamed(Routes.vendersRoute);
    }
  }

  void fetchStoresByCategory() async {
    try {
      setIsStoreByCategoryLoading = true;
      String lat = await StorageData.getLatitude();
      String lng = await StorageData.getLongitude();
      Map<String, String> data = {
        "category_id": "${getSelectedCategory.id ?? ""}",
        // "lat": "26.88535240",
        // "lng": "80.94372100",
        "lat": lat,
        "lng": lng,
      }; // TODO: Uncomment for current location
      Map<String, dynamic> response =
          await _homeRepo.fetchStoresByCategory(data);
      log(response.toString());
      if (response["code"] == 200) {
        var data = response["data"];
        if (data != null) {
          setVenderList = VenderListModel.fromMap(data);
        } else {
          Utils.toastMessage(response["msg"] ?? "Something went wrong!");
        }
      } else {
        Utils.toastMessage(response["msg"] ?? "Something went wrong!");
      }
    } catch (e) {
      Utils.toastMessage(e.toString());
      log("fetchStoresByCategory Error => $e");
    }
    log(getVenderList.toString());
    setIsStoreByCategoryLoading = false;
  }
}
