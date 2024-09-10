import 'dart:convert';

class StoreModel {
  int? id;
  String? salonNameEng;
  String? salonNameArb;
  String? email;
  String? contactNumber;
  String? salonType;
  String? salonSize;
  String? description;
  String? descriptionArb;
  String? salonImage;
  String? crNo;
  String? vatNo;
  String? artistSize;
  dynamic kidsSalonService;
  String? salonStartTime;
  String? salonEndTime;
  String? salonStatus;
  String? storeStatus;
  int? tagId;
  String? countryIso;
  String? cityIso;
  String? address_1;
  String? address_2;
  int? cityId;
  int? districtId;
  dynamic pinCode;
  String? latAddress;
  String? logAddress;
  String? storeId;
  String? isActive;
  String? dateTime;
  num? distance;
  StoreModel({
    this.id,
    this.salonNameEng,
    this.salonNameArb,
    this.email,
    this.contactNumber,
    this.salonType,
    this.salonSize,
    this.description,
    this.descriptionArb,
    this.salonImage,
    this.crNo,
    this.vatNo,
    this.artistSize,
    this.kidsSalonService,
    this.salonStartTime,
    this.salonEndTime,
    this.salonStatus,
    this.storeStatus,
    this.tagId,
    this.countryIso,
    this.cityIso,
    this.address_1,
    this.address_2,
    this.cityId,
    this.districtId,
    this.pinCode,
    this.latAddress,
    this.logAddress,
    this.storeId,
    this.isActive,
    this.dateTime,
    this.distance,
  });

  StoreModel copyWith({
    int? id,
    String? salonNameEng,
    String? salonNameArb,
    String? email,
    String? contactNumber,
    String? salonType,
    String? salonSize,
    String? description,
    String? descriptionArb,
    String? salonImage,
    String? crNo,
    String? vatNo,
    String? artistSize,
    dynamic kidsSalonService,
    String? salonStartTime,
    String? salonEndTime,
    String? salonStatus,
    String? storeStatus,
    int? tagId,
    String? countryIso,
    String? cityIso,
    String? address_1,
    String? address_2,
    int? cityId,
    int? districtId,
    dynamic pinCode,
    String? latAddress,
    String? logAddress,
    String? storeId,
    String? isActive,
    String? dateTime,
    num? distance,
  }) {
    return StoreModel(
      id: id ?? this.id,
      salonNameEng: salonNameEng ?? this.salonNameEng,
      salonNameArb: salonNameArb ?? this.salonNameArb,
      email: email ?? this.email,
      contactNumber: contactNumber ?? this.contactNumber,
      salonType: salonType ?? this.salonType,
      salonSize: salonSize ?? this.salonSize,
      description: description ?? this.description,
      descriptionArb: descriptionArb ?? this.descriptionArb,
      salonImage: salonImage ?? this.salonImage,
      crNo: crNo ?? this.crNo,
      vatNo: vatNo ?? this.vatNo,
      artistSize: artistSize ?? this.artistSize,
      kidsSalonService: kidsSalonService ?? this.kidsSalonService,
      salonStartTime: salonStartTime ?? this.salonStartTime,
      salonEndTime: salonEndTime ?? this.salonEndTime,
      salonStatus: salonStatus ?? this.salonStatus,
      storeStatus: storeStatus ?? this.storeStatus,
      tagId: tagId ?? this.tagId,
      countryIso: countryIso ?? this.countryIso,
      cityIso: cityIso ?? this.cityIso,
      address_1: address_1 ?? this.address_1,
      address_2: address_2 ?? this.address_2,
      cityId: cityId ?? this.cityId,
      districtId: districtId ?? this.districtId,
      pinCode: pinCode ?? this.pinCode,
      latAddress: latAddress ?? this.latAddress,
      logAddress: logAddress ?? this.logAddress,
      storeId: storeId ?? this.storeId,
      isActive: isActive ?? this.isActive,
      dateTime: dateTime ?? this.dateTime,
      distance: distance ?? this.distance,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'salonNameEng': salonNameEng,
      'salonNameArb': salonNameArb,
      'email': email,
      'contactNumber': contactNumber,
      'salonType': salonType,
      'salonSize': salonSize,
      'description': description,
      'descriptionArb': descriptionArb,
      'salonImage': salonImage,
      'crNo': crNo,
      'vatNo': vatNo,
      'artistSize': artistSize,
      'kidsSalonService': kidsSalonService,
      'salonStartTime': salonStartTime,
      'salonEndTime': salonEndTime,
      'salonStatus': salonStatus,
      'storeStatus': storeStatus,
      'tagId': tagId,
      'countryIso': countryIso,
      'cityIso': cityIso,
      'address_1': address_1,
      'address_2': address_2,
      'cityId': cityId,
      'districtId': districtId,
      'pinCode': pinCode,
      'latAddress': latAddress,
      'logAddress': logAddress,
      'storeId': storeId,
      'isActive': isActive,
      'dateTime': dateTime,
      'distance': distance,
    };
  }

  factory StoreModel.fromMap(Map<String, dynamic> map) {
    return StoreModel(
      id: map['id'] != null ? map['id'] as int : null,
      salonNameEng: map['salon_name_eng'] != null
          ? map['salon_name_eng'] as String
          : null,
      salonNameArb: map['salon_name_arb'] != null
          ? map['salon_name_arb'] as String
          : null,
      email: map['email'] != null ? map['email'] as String : null,
      contactNumber: map['contact_number'] != null
          ? map['contact_number'] as String
          : null,
      salonType: map['salon_type'] != null ? map['salon_type'] as String : null,
      salonSize: map['salon_size'] != null ? map['salon_size'] as String : null,
      description:
          map['description'] != null ? map['description'] as String : null,
      descriptionArb: map['description_arb'] != null
          ? map['description_arb'] as String
          : null,
      salonImage:
          map['salon_image'] != null ? map['salon_image'] as String : null,
      crNo: map['cr_no'] != null ? map['cr_no'] as String : null,
      vatNo: map['vat_no'] != null ? map['vat_no'] as String : null,
      artistSize:
          map['artist_size'] != null ? map['artist_size'] as String : null,
      kidsSalonService: map['kids_salon_service'] as dynamic,
      salonStartTime: map['slon_start_time'] != null
          ? map['slon_start_time'] as String
          : null,
      salonEndTime:
          map['slon_end_time'] != null ? map['slon_end_time'] as String : null,
      salonStatus:
          map['salon_status'] != null ? map['salon_status'] as String : null,
      storeStatus:
          map['store_status'] != null ? map['store_status'] as String : null,
      tagId: map['tag_id'] != null ? map['tag_id'] as int : null,
      countryIso:
          map['country_iso'] != null ? map['country_iso'] as String : null,
      cityIso: map['city_iso'] != null ? map['city_iso'] as String : null,
      address_1: map['address_1'] != null ? map['address_1'] as String : null,
      address_2: map['address_2'] != null ? map['address_2'] as String : null,
      cityId: map['city_id'] != null ? map['city_id'] as int : null,
      districtId: map['district_id'] != null ? map['district_id'] as int : null,
      pinCode: map['pincode'] as dynamic,
      latAddress:
          map['lat_address'] != null ? map['lat_address'] as String : null,
      logAddress:
          map['log_address'] != null ? map['log_address'] as String : null,
      storeId: map['store_id'] != null ? map['store_id'] as String : null,
      isActive: map['is_active'] != null ? map['is_active'] as String : null,
      dateTime: map['date_time'] != null ? map['date_time'] as String : null,
      distance: map['distance'] != null ? map['distance'] as num : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory StoreModel.fromJson(String source) =>
      StoreModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'StoreModel(id: $id, salonNameEng: $salonNameEng, salonNameArb: $salonNameArb, email: $email, contactNumber: $contactNumber, salonType: $salonType, salonSize: $salonSize, description: $description, descriptionArb: $descriptionArb, salonImage: $salonImage, crNo: $crNo, vatNo: $vatNo, artistSize: $artistSize, kidsSalonService: $kidsSalonService, salonStartTime: $salonStartTime, salonEndTime: $salonEndTime, salonStatus: $salonStatus, storeStatus: $storeStatus, tagId: $tagId, countryIso: $countryIso, cityIso: $cityIso, address_1: $address_1, address_2: $address_2, cityId: $cityId, districtId: $districtId, pinCode: $pinCode, latAddress: $latAddress, logAddress: $logAddress, storeId: $storeId, isActive: $isActive, dateTime: $dateTime, distance: $distance)';
  }

  @override
  bool operator ==(covariant StoreModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.salonNameEng == salonNameEng &&
        other.salonNameArb == salonNameArb &&
        other.email == email &&
        other.contactNumber == contactNumber &&
        other.salonType == salonType &&
        other.salonSize == salonSize &&
        other.description == description &&
        other.descriptionArb == descriptionArb &&
        other.salonImage == salonImage &&
        other.crNo == crNo &&
        other.vatNo == vatNo &&
        other.artistSize == artistSize &&
        other.kidsSalonService == kidsSalonService &&
        other.salonStartTime == salonStartTime &&
        other.salonEndTime == salonEndTime &&
        other.salonStatus == salonStatus &&
        other.storeStatus == storeStatus &&
        other.tagId == tagId &&
        other.countryIso == countryIso &&
        other.cityIso == cityIso &&
        other.address_1 == address_1 &&
        other.address_2 == address_2 &&
        other.cityId == cityId &&
        other.districtId == districtId &&
        other.pinCode == pinCode &&
        other.latAddress == latAddress &&
        other.logAddress == logAddress &&
        other.storeId == storeId &&
        other.isActive == isActive &&
        other.dateTime == dateTime &&
        other.distance == distance;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        salonNameEng.hashCode ^
        salonNameArb.hashCode ^
        email.hashCode ^
        contactNumber.hashCode ^
        salonType.hashCode ^
        salonSize.hashCode ^
        description.hashCode ^
        descriptionArb.hashCode ^
        salonImage.hashCode ^
        crNo.hashCode ^
        vatNo.hashCode ^
        artistSize.hashCode ^
        kidsSalonService.hashCode ^
        salonStartTime.hashCode ^
        salonEndTime.hashCode ^
        salonStatus.hashCode ^
        storeStatus.hashCode ^
        tagId.hashCode ^
        countryIso.hashCode ^
        cityIso.hashCode ^
        address_1.hashCode ^
        address_2.hashCode ^
        cityId.hashCode ^
        districtId.hashCode ^
        pinCode.hashCode ^
        latAddress.hashCode ^
        logAddress.hashCode ^
        storeId.hashCode ^
        isActive.hashCode ^
        dateTime.hashCode ^
        distance.hashCode;
  }
}
