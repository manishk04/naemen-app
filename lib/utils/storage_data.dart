import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class StorageData {
  // ============================== variables ===================================
  static const String _prefName = "com.example.naemen";
  static const String _customerId = "${_prefName}customerId";
  static const String _contactNumber = "${_prefName}contactNumber";
  static const String _latitude = "${_prefName}latitude";
  static const String _longitude = "${_prefName}longitude";
  static const String _address = "${_prefName}address";
  static const String _language = "${_prefName}language";

  // ============================== getters =====================================
  static getCustomerId() async {
    FlutterSecureStorage storage = const FlutterSecureStorage();
    return await storage.read(key: _customerId) ?? "";
  }

  static getContactNumber() async {
    FlutterSecureStorage storage = const FlutterSecureStorage();
    return await storage.read(key: _contactNumber) ?? "";
  }

  static getLatitude() async {
    FlutterSecureStorage storage = const FlutterSecureStorage();
    return await storage.read(key: _latitude) ?? "";
  }

  static getLongitude() async {
    FlutterSecureStorage storage = const FlutterSecureStorage();
    return await storage.read(key: _longitude) ?? "";
  }

  static getAddress() async {
    FlutterSecureStorage storage = const FlutterSecureStorage();
    return await storage.read(key: _address) ?? "";
  }

  static getLanguage() async {
    FlutterSecureStorage storage = const FlutterSecureStorage();
    return await storage.read(key: _language) ?? "";
  }

  // ============================== setters =====================================
  static setCustomerId(String id) async {
    FlutterSecureStorage storage = const FlutterSecureStorage();
    await storage.write(key: _customerId, value: id);
  }

  static setContactNumber(String number) async {
    FlutterSecureStorage storage = const FlutterSecureStorage();
    await storage.write(key: _contactNumber, value: number);
  }

  static setLatitude(String latitude) async {
    FlutterSecureStorage storage = const FlutterSecureStorage();
    await storage.write(key: _latitude, value: latitude);
  }

  static setLongitude(String longitude) async {
    FlutterSecureStorage storage = const FlutterSecureStorage();
    await storage.write(key: _longitude, value: longitude);
  }

  static setAddress(String address) async {
    FlutterSecureStorage storage = const FlutterSecureStorage();
    await storage.write(key: _address, value: address);
  }

  static setLanguage(String language) async {
    FlutterSecureStorage storage = const FlutterSecureStorage();
    await storage.write(key: _language, value: language);
  }

  // ============================== functions =====================================
  static resetData() async {
    FlutterSecureStorage storage = const FlutterSecureStorage();
    await storage.deleteAll();
  }
}
