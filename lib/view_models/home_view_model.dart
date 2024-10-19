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
        // "lat": "26.42068280",
        // "lng": "50.08879430",
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

var data = {
  "code": 200,
  "data": [
    {
      "tag": {
        "title_eng": "Newly Added Saloons",
        "title_arb":
            "\u0627\u0644\u0635\u0627\u0644\u0648\u0646\u0627\u062a \u0627\u0644\u0645\u0636\u0627\u0641\u0629 \u062d\u062f\u064a\u062b\u0627",
        "salon": [
          {
            "salon_name_eng": "Espada",
            "store_gender": "male",
            "salon_id": 27,
            "salon_type": "Spa",
            "kids_salon_service": "yes",
            "start_time": "10:00:00",
            "end_time": "22:00:00",
            "salon_name_arb": "\u0625\u0633\u0628\u0627\u062f\u0627",
            "email": "espada@gmail.com",
            "contact_number": "898240443",
            "salon_image": "assets\/images\/salon-img\/66f12d4c22c37.webp",
            "salon_status": "2",
            "store_status": "approve",
            "bilding_address": "Prince Mohammed Bin Fahd Road",
            "address": "",
            "city_id": 1,
            "district_id": 4,
            "lat_address": "26.40487200",
            "log_address": "50.11383880",
            "district": "Al Rawdah",
            "city_name": "Dammam",
            "tag_title_eng": "Newly Added Saloons",
            "tag_title_arb":
                "\u0627\u0644\u0635\u0627\u0644\u0648\u0646\u0627\u062a \u0627\u0644\u0645\u0636\u0627\u0641\u0629 \u062d\u062f\u064a\u062b\u0627",
            "distance": 3051.47300876608233011211268603801727294921875
          },
          {
            "salon_name_eng": "Vintage Barbershop",
            "store_gender": "male",
            "salon_id": 25,
            "salon_type": "Barber",
            "kids_salon_service": "yes",
            "start_time": "10:00:00",
            "end_time": "22:00:00",
            "salon_name_arb":
                "\u0645\u062d\u0644 \u0627\u0644\u062d\u0644\u0627\u0642\u0629 \u062e\u0645\u0631",
            "email": "vintagebarbershop@gmail.com",
            "contact_number": "898240447",
            "salon_image": "assets\/images\/salon-img\/66ed96fce043b.webp",
            "salon_status": "2",
            "store_status": "approve",
            "bilding_address": "Omar Ibn Al Khattab St, Ash Shulah,",
            "address": "Dammam , Saudi Arabia",
            "city_id": 1,
            "district_id": 8,
            "lat_address": "26.42615160",
            "log_address": "50.04336270",
            "district": "Al Aziziyah",
            "city_name": "Dammam",
            "tag_title_eng": "Newly Added Saloons",
            "tag_title_arb":
                "\u0627\u0644\u0635\u0627\u0644\u0648\u0646\u0627\u062a \u0627\u0644\u0645\u0636\u0627\u0641\u0629 \u062d\u062f\u064a\u062b\u0627",
            "distance": 4564.6921652487335450132377445697784423828125
          }
        ]
      }
    },
    {
      "tag": {
        "title_eng": "Top Rated Artist",
        "title_arb":
            "\u0627\u0644\u0641\u0646\u0627\u0646 \u0627\u0644\u0623\u0639\u0644\u0649 \u062a\u0642\u064a\u064a\u0645\u064b\u0627",
        "salon": [
          {
            "salon_name_eng": "Espada",
            "salon_id": 27,
            "store_gender": "male",
            "salon_type": "Spa",
            "kids_salon_service": "yes",
            "start_time": "10:00:00",
            "end_time": "22:00:00",
            "salon_name_arb": "\u0625\u0633\u0628\u0627\u062f\u0627",
            "email": "espada@gmail.com",
            "contact_number": "898240443",
            "salon_image": "assets\/images\/salon-img\/66f12d4c22c37.webp",
            "salon_status": "2",
            "store_status": "approve",
            "bilding_address": "Prince Mohammed Bin Fahd Road",
            "address": "",
            "city_id": 1,
            "district_id": 4,
            "lat_address": "26.40487200",
            "log_address": "50.11383880",
            "district": "Al Rawdah",
            "city_name": "Dammam",
            "tag_title_eng": "Newly Added Saloons",
            "tag_title_arb":
                "\u0627\u0644\u0635\u0627\u0644\u0648\u0646\u0627\u062a \u0627\u0644\u0645\u0636\u0627\u0641\u0629 \u062d\u062f\u064a\u062b\u0627",
            "artist_name_eng": "Amal",
            "artist_name_arb": "\u0623\u0645\u0644",
            "artist_image": null,
            "gender": "male",
            "is_active": "1",
            "distance": 3051.47300876608233011211268603801727294921875
          },
          {
            "salon_name_eng": "Espada",
            "salon_id": 27,
            "store_gender": "male",
            "salon_type": "Spa",
            "kids_salon_service": "yes",
            "start_time": "10:00:00",
            "end_time": "22:00:00",
            "salon_name_arb": "\u0625\u0633\u0628\u0627\u062f\u0627",
            "email": "espada@gmail.com",
            "contact_number": "898240443",
            "salon_image": "assets\/images\/salon-img\/66f12d4c22c37.webp",
            "salon_status": "2",
            "store_status": "approve",
            "bilding_address": "Prince Mohammed Bin Fahd Road",
            "address": "",
            "city_id": 1,
            "district_id": 4,
            "lat_address": "26.40487200",
            "log_address": "50.11383880",
            "district": "Al Rawdah",
            "city_name": "Dammam",
            "tag_title_eng": "Newly Added Saloons",
            "tag_title_arb":
                "\u0627\u0644\u0635\u0627\u0644\u0648\u0646\u0627\u062a \u0627\u0644\u0645\u0636\u0627\u0641\u0629 \u062d\u062f\u064a\u062b\u0627",
            "artist_name_eng": "Reem",
            "artist_name_arb": "\u0631\u064a\u0645",
            "artist_image": null,
            "gender": "male",
            "is_active": "1",
            "distance": 3051.47300876608233011211268603801727294921875
          },
          {
            "salon_name_eng": "Espada",
            "salon_id": 27,
            "store_gender": "male",
            "salon_type": "Spa",
            "kids_salon_service": "yes",
            "start_time": "10:00:00",
            "end_time": "22:00:00",
            "salon_name_arb": "\u0625\u0633\u0628\u0627\u062f\u0627",
            "email": "espada@gmail.com",
            "contact_number": "898240443",
            "salon_image": "assets\/images\/salon-img\/66f12d4c22c37.webp",
            "salon_status": "2",
            "store_status": "approve",
            "bilding_address": "Prince Mohammed Bin Fahd Road",
            "address": "",
            "city_id": 1,
            "district_id": 4,
            "lat_address": "26.40487200",
            "log_address": "50.11383880",
            "district": "Al Rawdah",
            "city_name": "Dammam",
            "tag_title_eng": "Newly Added Saloons",
            "tag_title_arb":
                "\u0627\u0644\u0635\u0627\u0644\u0648\u0646\u0627\u062a \u0627\u0644\u0645\u0636\u0627\u0641\u0629 \u062d\u062f\u064a\u062b\u0627",
            "artist_name_eng": "Waad",
            "artist_name_arb": "\u0623\u0646\u062a",
            "artist_image": null,
            "gender": "male",
            "is_active": "1",
            "distance": 3051.47300876608233011211268603801727294921875
          }
        ]
      }
    },
    {
      "tag": {
        "title_eng": "Recommendation",
        "title_arb": "\u062a\u0648\u0635\u064a\u0629",
        "salon": [
          {
            "salon_name_eng": "Gloab Salon",
            "store_gender": "male",
            "salon_id": 26,
            "salon_type": "salon",
            "kids_salon_service": "yes",
            "start_time": "10:00:00",
            "end_time": "22:00:00",
            "salon_name_arb":
                "\u0635\u0627\u0644\u0648\u0646 \u062c\u0644\u0648\u0628",
            "email": "gloabsalon@gmail.com",
            "contact_number": "550123404",
            "salon_image": "assets\/images\/salon-img\/66f12d6adb84e.webp",
            "salon_status": "1",
            "store_status": "approve",
            "bilding_address": "\u064a, 6194 Prince Sultan Road",
            "address": "",
            "city_id": 1,
            "district_id": 4,
            "lat_address": "26.42068280",
            "log_address": "50.08879430",
            "district": "Al Rawdah",
            "city_name": "Dammam",
            "tag_title_eng": "Recommendation",
            "tag_title_arb": "\u062a\u0648\u0635\u064a\u0629",
            "distance": 0
          }
        ]
      }
    }
  ]
};
