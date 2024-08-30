import 'dart:convert';

class ArtistServiceModel {
  int? id;
  int? salonId;
  int? categoryId;
  int? subCategoryId;
  String? servicesNameEng;
  String? serviceNameArb;
  String? servicesImage;
  int? serviceAmount;
  int? serviceCommission;
  int? serviceFinalAmount;
  String? serviceDuration;
  String? serviceDesEng;
  String? serviceDesArb;
  String? isActive;
  String? isDelete;
  String? dateTime;
  String? addedBy;
  String? updatedDate;
  String? updatedBy;
  String? salonNameEng;
  String? salonNameArb;
  String? email;
  String? contactNumber;
  String? salonImage;
  String? categoryTitle;
  String? categoryArb;
  String? date;
  String? time;
  ArtistServiceModel({
    this.id,
    this.salonId,
    this.categoryId,
    this.subCategoryId,
    this.servicesNameEng,
    this.serviceNameArb,
    this.servicesImage,
    this.serviceAmount,
    this.serviceCommission,
    this.serviceFinalAmount,
    this.serviceDuration,
    this.serviceDesEng,
    this.serviceDesArb,
    this.isActive,
    this.isDelete,
    this.dateTime,
    this.addedBy,
    this.updatedDate,
    this.updatedBy,
    this.salonNameEng,
    this.salonNameArb,
    this.email,
    this.contactNumber,
    this.salonImage,
    this.categoryTitle,
    this.categoryArb,
    this.date,
    this.time,
  });

  ArtistServiceModel copyWith({
    int? id,
    int? salonId,
    int? categoryId,
    int? subCategoryId,
    String? servicesNameEng,
    String? serviceNameArb,
    String? servicesImage,
    int? serviceAmount,
    int? serviceCommission,
    int? serviceFinalAmount,
    String? serviceDuration,
    String? serviceDesEng,
    String? serviceDesArb,
    String? isActive,
    String? isDelete,
    String? dateTime,
    String? addedBy,
    String? updatedDate,
    String? updatedBy,
    String? salonNameEng,
    String? salonNameArb,
    String? email,
    String? contactNumber,
    String? salonImage,
    String? categoryTitle,
    String? categoryArb,
    String? date,
    String? time,
  }) {
    return ArtistServiceModel(
      id: id ?? this.id,
      salonId: salonId ?? this.salonId,
      categoryId: categoryId ?? this.categoryId,
      subCategoryId: subCategoryId ?? this.subCategoryId,
      servicesNameEng: servicesNameEng ?? this.servicesNameEng,
      serviceNameArb: serviceNameArb ?? this.serviceNameArb,
      servicesImage: servicesImage ?? this.servicesImage,
      serviceAmount: serviceAmount ?? this.serviceAmount,
      serviceCommission: serviceCommission ?? this.serviceCommission,
      serviceFinalAmount: serviceFinalAmount ?? this.serviceFinalAmount,
      serviceDuration: serviceDuration ?? this.serviceDuration,
      serviceDesEng: serviceDesEng ?? this.serviceDesEng,
      serviceDesArb: serviceDesArb ?? this.serviceDesArb,
      isActive: isActive ?? this.isActive,
      isDelete: isDelete ?? this.isDelete,
      dateTime: dateTime ?? this.dateTime,
      addedBy: addedBy ?? this.addedBy,
      updatedDate: updatedDate ?? this.updatedDate,
      updatedBy: updatedBy ?? this.updatedBy,
      salonNameEng: salonNameEng ?? this.salonNameEng,
      salonNameArb: salonNameArb ?? this.salonNameArb,
      email: email ?? this.email,
      contactNumber: contactNumber ?? this.contactNumber,
      salonImage: salonImage ?? this.salonImage,
      categoryTitle: categoryTitle ?? this.categoryTitle,
      categoryArb: categoryArb ?? this.categoryArb,
      date: date ?? this.date,
      time: time ?? this.time,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'salonId': salonId,
      'categoryId': categoryId,
      'subCategoryId': subCategoryId,
      'servicesNameEng': servicesNameEng,
      'serviceNameArb': serviceNameArb,
      'servicesImage': servicesImage,
      'serviceAmount': serviceAmount,
      'serviceCommission': serviceCommission,
      'serviceFinalAmount': serviceFinalAmount,
      'serviceDuration': serviceDuration,
      'serviceDesEng': serviceDesEng,
      'serviceDesArb': serviceDesArb,
      'isActive': isActive,
      'isDelete': isDelete,
      'dateTime': dateTime,
      'addedBy': addedBy,
      'updatedDate': updatedDate,
      'updatedBy': updatedBy,
      'salonNameEng': salonNameEng,
      'salonNameArb': salonNameArb,
      'email': email,
      'contactNumber': contactNumber,
      'salonImage': salonImage,
      'categoryTitle': categoryTitle,
      'categoryArb': categoryArb,
      'date': date,
      'time': time,
    };
  }

  factory ArtistServiceModel.fromMap(Map<String, dynamic> map) {
    return ArtistServiceModel(
      id: map['id'] != null ? map['id'] as int : null,
      salonId: map['salon_id'] != null ? map['salon_id'] as int : null,
      categoryId: map['category_id'] != null ? map['category_id'] as int : null,
      subCategoryId:
          map['sub_category_id'] != null ? map['sub_category_id'] as int : null,
      servicesNameEng: map['services_name_eng'] != null
          ? map['services_name_eng'] as String
          : null,
      serviceNameArb: map['service_name_arb'] != null
          ? map['service_name_arb'] as String
          : null,
      servicesImage: map['services_image'] != null
          ? map['services_image'] as String
          : null,
      serviceAmount:
          map['service_amount'] != null ? map['service_amount'] as int : null,
      serviceCommission: map['service_commission'] != null
          ? map['service_commission'] as int
          : null,
      serviceFinalAmount: map['service_final_amount'] != null
          ? map['service_final_amount'] as int
          : null,
      serviceDuration: map['service_durattion'] != null
          ? map['service_durattion'] as String
          : null,
      serviceDesEng: map['service_des_eng'] != null
          ? map['service_des_eng'] as String
          : null,
      serviceDesArb: map['service_des_arb'] != null
          ? map['service_des_arb'] as String
          : null,
      isActive: map['is_active'] != null ? map['is_active'] as String : null,
      isDelete: map['is_delete'] != null ? map['is_delete'] as String : null,
      dateTime: map['date_time'] != null ? map['date_time'] as String : null,
      addedBy: map['added_by'] != null ? map['added_by'] as String : null,
      updatedDate:
          map['updated_date'] != null ? map['updated_date'] as String : null,
      updatedBy: map['updated_by'] != null ? map['updated_by'] as String : null,
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
      salonImage:
          map['salon_image'] != null ? map['salon_image'] as String : null,
      categoryTitle: map['category_title'] != null
          ? map['category_title'] as String
          : null,
      categoryArb:
          map['category_arb'] != null ? map['category_arb'] as String : null,
      date: map['date'] != null ? map['date'] as String : null,
      time: map['time'] != null ? map['time'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ArtistServiceModel.fromJson(String source) =>
      ArtistServiceModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ArtistServiceModel(id: $id, salonId: $salonId, categoryId: $categoryId, subCategoryId: $subCategoryId, servicesNameEng: $servicesNameEng, serviceNameArb: $serviceNameArb, servicesImage: $servicesImage, serviceAmount: $serviceAmount, serviceCommission: $serviceCommission, serviceFinalAmount: $serviceFinalAmount, serviceDuration: $serviceDuration, serviceDesEng: $serviceDesEng, serviceDesArb: $serviceDesArb, isActive: $isActive, isDelete: $isDelete, dateTime: $dateTime, addedBy: $addedBy, updatedDate: $updatedDate, updatedBy: $updatedBy, salonNameEng: $salonNameEng, salonNameArb: $salonNameArb, email: $email, contactNumber: $contactNumber, salonImage: $salonImage, categoryTitle: $categoryTitle, categoryArb: $categoryArb, date: $date, time: $time)';
  }

  @override
  bool operator ==(covariant ArtistServiceModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.salonId == salonId &&
        other.categoryId == categoryId &&
        other.subCategoryId == subCategoryId &&
        other.servicesNameEng == servicesNameEng &&
        other.serviceNameArb == serviceNameArb &&
        other.servicesImage == servicesImage &&
        other.serviceAmount == serviceAmount &&
        other.serviceCommission == serviceCommission &&
        other.serviceFinalAmount == serviceFinalAmount &&
        other.serviceDuration == serviceDuration &&
        other.serviceDesEng == serviceDesEng &&
        other.serviceDesArb == serviceDesArb &&
        other.isActive == isActive &&
        other.isDelete == isDelete &&
        other.dateTime == dateTime &&
        other.addedBy == addedBy &&
        other.updatedDate == updatedDate &&
        other.updatedBy == updatedBy &&
        other.salonNameEng == salonNameEng &&
        other.salonNameArb == salonNameArb &&
        other.email == email &&
        other.contactNumber == contactNumber &&
        other.salonImage == salonImage &&
        other.categoryTitle == categoryTitle &&
        other.categoryArb == categoryArb &&
        other.date == date &&
        other.time == time;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        salonId.hashCode ^
        categoryId.hashCode ^
        subCategoryId.hashCode ^
        servicesNameEng.hashCode ^
        serviceNameArb.hashCode ^
        servicesImage.hashCode ^
        serviceAmount.hashCode ^
        serviceCommission.hashCode ^
        serviceFinalAmount.hashCode ^
        serviceDuration.hashCode ^
        serviceDesEng.hashCode ^
        serviceDesArb.hashCode ^
        isActive.hashCode ^
        isDelete.hashCode ^
        dateTime.hashCode ^
        addedBy.hashCode ^
        updatedDate.hashCode ^
        updatedBy.hashCode ^
        salonNameEng.hashCode ^
        salonNameArb.hashCode ^
        email.hashCode ^
        contactNumber.hashCode ^
        salonImage.hashCode ^
        categoryTitle.hashCode ^
        categoryArb.hashCode ^
        date.hashCode ^
        time.hashCode;
  }
}
