import 'dart:convert';

class SalonModel {
  String? salonNameEng;
  String? storeGender;
  int? salonId;
  String? salonType;
  String? salonNameArb;
  String? email;
  String? contactNumber;
  String? salonImage;
  dynamic kidsSalonService;
  String? salonStatus;
  String? storeStatus;
  String? buildingAddress; //
  String? address; //
  int? cityId;
  int? districtId;
  String? latAddress;
  String? logAddress;
  int? categoryId;
  String? categoryTitle;
  String? district;
  String? cityName;
  String? tagTitleEng;
  String? tagTitleAr;
  num? distance;
  SalonModel({
    this.salonNameEng,
    this.storeGender,
    this.salonId,
    this.salonType,
    this.salonNameArb,
    this.email,
    this.contactNumber,
    this.salonImage,
    this.kidsSalonService,
    this.salonStatus,
    this.storeStatus,
    this.buildingAddress,
    this.address,
    this.cityId,
    this.districtId,
    this.latAddress,
    this.logAddress,
    this.categoryId,
    this.categoryTitle,
    this.district,
    this.cityName,
    this.tagTitleEng,
    this.tagTitleAr,
    this.distance,
  });

  SalonModel copyWith({
    String? salonNameEng,
    String? storeGender,
    int? salonId,
    String? salonType,
    String? salonNameArb,
    String? email,
    String? contactNumber,
    String? salonImage,
    dynamic kidsSalonService,
    String? salonStatus,
    String? storeStatus,
    String? buildingAddress,
    String? address,
    int? cityId,
    int? districtId,
    String? latAddress,
    String? logAddress,
    int? categoryId,
    String? categoryTitle,
    String? district,
    String? cityName,
    String? tagTitleEng,
    String? tagTitleAr,
    num? distance,
  }) {
    return SalonModel(
      salonNameEng: salonNameEng ?? this.salonNameEng,
      storeGender: storeGender ?? this.storeGender,
      salonId: salonId ?? this.salonId,
      salonType: salonType ?? this.salonType,
      salonNameArb: salonNameArb ?? this.salonNameArb,
      email: email ?? this.email,
      contactNumber: contactNumber ?? this.contactNumber,
      salonImage: salonImage ?? this.salonImage,
      kidsSalonService: kidsSalonService ?? this.kidsSalonService,
      salonStatus: salonStatus ?? this.salonStatus,
      storeStatus: storeStatus ?? this.storeStatus,
      buildingAddress: buildingAddress ?? this.buildingAddress,
      address: address ?? this.address,
      cityId: cityId ?? this.cityId,
      districtId: districtId ?? this.districtId,
      latAddress: latAddress ?? this.latAddress,
      logAddress: logAddress ?? this.logAddress,
      categoryId: categoryId ?? this.categoryId,
      categoryTitle: categoryTitle ?? this.categoryTitle,
      district: district ?? this.district,
      cityName: cityName ?? this.cityName,
      tagTitleEng: tagTitleEng ?? this.tagTitleEng,
      tagTitleAr: tagTitleAr ?? this.tagTitleAr,
      distance: distance ?? this.distance,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'salonNameEng': salonNameEng,
      'storeGender': storeGender,
      'salonId': salonId,
      'salonType': salonType,
      'salonNameArb': salonNameArb,
      'email': email,
      'contactNumber': contactNumber,
      'salonImage': salonImage,
      'kidsSalonService': kidsSalonService,
      'salonStatus': salonStatus,
      'storeStatus': storeStatus,
      'buildingAddress': buildingAddress,
      'address': address,
      'cityId': cityId,
      'districtId': districtId,
      'latAddress': latAddress,
      'logAddress': logAddress,
      'categoryId': categoryId,
      'categoryTitle': categoryTitle,
      'district': district,
      'cityName': cityName,
      'tagTitleEng': tagTitleEng,
      'tagTitleAr': tagTitleAr,
      'distance': distance,
    };
  }

  factory SalonModel.fromMap(Map<String, dynamic> map) {
    return SalonModel(
      salonNameEng: map['salon_name_eng'] != null
          ? map['salon_name_eng'] as String
          : null,
      storeGender: map['store_gender'] != null
          ? map['store_gender'] as String
          : null,
      salonId: map['salon_id'] != null ? map['salon_id'] as int : null,
      salonType: map['salon_type'] != null ? map['salon_type'] as String : null,
      salonNameArb: map['salon_name_arb'] != null
          ? map['salon_name_arb'] as String
          : null,
      email: map['email'] != null ? map['email'] as String : null,
      contactNumber: map['contact_number'] != null
          ? map['contact_number'] as String
          : null,
      salonImage:
          map['salon_image'] != null ? map['salon_image'] as String : null,
      kidsSalonService: map['kids_salon_service'],
      salonStatus:
          map['salon_status'] != null ? map['salon_status'] as String : null,
      storeStatus:
          map['store_status'] != null ? map['store_status'] as String : null,
      buildingAddress: map['bilding_address'] != null
          ? map['bilding_address'] as String
          : null,
      address: map['address'] != null ? map['address'] as String : null,
      cityId: map['city_id'] != null ? map['city_id'] as int : null,
      districtId: map['district_id'] != null ? map['district_id'] as int : null,
      latAddress:
          map['lat_address'] != null ? map['lat_address'] as String : null,
      logAddress:
          map['log_address'] != null ? map['log_address'] as String : null,
      categoryId: map['category_id'] != null ? map['category_id'] as int : null,
      categoryTitle: map['category_title'] != null
          ? map['category_title'] as String
          : null,
      district: map['district'] != null ? map['district'] as String : null,
      cityName: map['city_name'] != null ? map['city_name'] as String : null,
      tagTitleEng:
          map['tag_title_eng'] != null ? map['tag_title_eng'] as String : null,
      tagTitleAr:
          map['tag_title_arb'] != null ? map['tag_title_arb'] as String : null,
      distance: map['distance'] != null ? map['distance'] as num : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory SalonModel.fromJson(String source) =>
      SalonModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'SalonModel(salonNameEng: $salonNameEng, storeGender:$storeGender, salonId: $salonId, salonType: $salonType, salonNameArb: $salonNameArb, email: $email, contactNumber: $contactNumber, salonImage: $salonImage, kidsSalonService: $kidsSalonService, salonStatus: $salonStatus, storeStatus: $storeStatus, buildingAddress: $buildingAddress, address: $address, cityId: $cityId, districtId: $districtId, latAddress: $latAddress, logAddress: $logAddress, categoryId: $categoryId, categoryTitle: $categoryTitle, district: $district, cityName: $cityName, tagTitleEng: $tagTitleEng, tagTitleAr: $tagTitleAr, distance: $distance)';
  }

  @override
  bool operator ==(covariant SalonModel other) {
    if (identical(this, other)) return true;

    return other.salonNameEng == salonNameEng &&
        other.storeGender == storeGender &&
        other.salonId == salonId &&
        other.salonType == salonType &&
        other.salonNameArb == salonNameArb &&
        other.email == email &&
        other.contactNumber == contactNumber &&
        other.salonImage == salonImage &&
        other.kidsSalonService == kidsSalonService &&
        other.salonStatus == salonStatus &&
        other.storeStatus == storeStatus &&
        other.buildingAddress == buildingAddress &&
        other.address == address &&
        other.cityId == cityId &&
        other.districtId == districtId &&
        other.latAddress == latAddress &&
        other.logAddress == logAddress &&
        other.categoryId == categoryId &&
        other.categoryTitle == categoryTitle &&
        other.district == district &&
        other.cityName == cityName &&
        other.tagTitleEng == tagTitleEng &&
        other.tagTitleAr == tagTitleAr &&
        other.distance == distance;
  }

  @override
  int get hashCode {
    return salonNameEng.hashCode ^
        storeGender.hashCode ^
        salonId.hashCode ^
        salonType.hashCode ^
        salonNameArb.hashCode ^
        email.hashCode ^
        contactNumber.hashCode ^
        salonImage.hashCode ^
        kidsSalonService.hashCode ^
        salonStatus.hashCode ^
        storeStatus.hashCode ^
        buildingAddress.hashCode ^
        address.hashCode ^
        cityId.hashCode ^
        districtId.hashCode ^
        latAddress.hashCode ^
        logAddress.hashCode ^
        categoryId.hashCode ^
        categoryTitle.hashCode ^
        district.hashCode ^
        cityName.hashCode ^
        tagTitleEng.hashCode ^
        tagTitleAr.hashCode ^
        distance.hashCode;
  }
}
