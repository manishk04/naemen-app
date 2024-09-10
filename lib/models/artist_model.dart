import 'dart:convert';

class ArtistModel {
  int? id;
  int? salonId;
  String? artistNameEng;
  String? artistNameArb;
  String? artistEmail;
  String? artistContactNumber;
  String? artistImage;
  String? gender;
  String? artistCategories;
  String? accountNumber;
  String? accountHolderName;
  String? accountIFSC;
  String? bankName;
  String? isActive;
  String? dateTime;
  String? addedBy;
  dynamic updateDate;
  dynamic updatedBy;
  String? salonNameEng;
  String? salonNameArb;
  String? email;
  String? contactNumber;
  String? salonImage;
  ArtistModel({
    this.id,
    this.salonId,
    this.artistNameEng,
    this.artistNameArb,
    this.artistEmail,
    this.artistContactNumber,
    this.artistImage,
    this.gender,
    this.artistCategories,
    this.accountNumber,
    this.accountHolderName,
    this.accountIFSC,
    this.bankName,
    this.isActive,
    this.dateTime,
    this.addedBy,
    this.updateDate,
    this.updatedBy,
    this.salonNameEng,
    this.salonNameArb,
    this.email,
    this.contactNumber,
    this.salonImage,
  });

  ArtistModel copyWith({
    int? id,
    int? salonId,
    String? artistNameEng,
    String? artistNameArb,
    String? artistEmail,
    String? artistContactNumber,
    String? artistImage,
    String? gender,
    String? artistCategories,
    String? accountNumber,
    String? accountHolderName,
    String? accountIFSC,
    String? bankName,
    String? isActive,
    String? dateTime,
    String? addedBy,
    dynamic updateDate,
    dynamic updatedBy,
    String? salonNameEng,
    String? salonNameArb,
    String? email,
    String? contactNumber,
    String? salonImage,
  }) {
    return ArtistModel(
      id: id ?? this.id,
      salonId: salonId ?? this.salonId,
      artistNameEng: artistNameEng ?? this.artistNameEng,
      artistNameArb: artistNameArb ?? this.artistNameArb,
      artistEmail: artistEmail ?? this.artistEmail,
      artistContactNumber: artistContactNumber ?? this.artistContactNumber,
      artistImage: artistImage ?? this.artistImage,
      gender: gender ?? this.gender,
      artistCategories: artistCategories ?? this.artistCategories,
      accountNumber: accountNumber ?? this.accountNumber,
      accountHolderName: accountHolderName ?? this.accountHolderName,
      accountIFSC: accountIFSC ?? this.accountIFSC,
      bankName: bankName ?? this.bankName,
      isActive: isActive ?? this.isActive,
      dateTime: dateTime ?? this.dateTime,
      addedBy: addedBy ?? this.addedBy,
      updateDate: updateDate ?? this.updateDate,
      updatedBy: updatedBy ?? this.updatedBy,
      salonNameEng: salonNameEng ?? this.salonNameEng,
      salonNameArb: salonNameArb ?? this.salonNameArb,
      email: email ?? this.email,
      contactNumber: contactNumber ?? this.contactNumber,
      salonImage: salonImage ?? this.salonImage,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'salonId': salonId,
      'artistNameEng': artistNameEng,
      'artistNameArb': artistNameArb,
      'artistEmail': artistEmail,
      'artistContactNumber': artistContactNumber,
      'artistImage': artistImage,
      'gender': gender,
      'artistCategories': artistCategories,
      'accountNumber': accountNumber,
      'accountHolderName': accountHolderName,
      'accountIFSC': accountIFSC,
      'bankName': bankName,
      'isActive': isActive,
      'dateTime': dateTime,
      'addedBy': addedBy,
      'updateDate': updateDate,
      'updatedBy': updatedBy,
      'salonNameEng': salonNameEng,
      'salonNameArb': salonNameArb,
      'email': email,
      'contactNumber': contactNumber,
      'salonImage': salonImage,
    };
  }

  factory ArtistModel.fromMap(Map<String, dynamic> map) {
    return ArtistModel(
      id: map['id'] != null ? map['id'] as int : null,
      salonId: map['salon_id'] != null ? map['salon_id'] as int : null,
      artistNameEng: map['artist_name_eng'] != null
          ? map['artist_name_eng'] as String
          : null,
      artistNameArb: map['artist_name_arb'] != null
          ? map['artist_name_arb'] as String
          : null,
      artistEmail:
          map['artist_email'] != null ? map['artist_email'] as String : null,
      artistContactNumber: map['artist_contact_number'] != null
          ? map['artist_contact_number'] as String
          : null,
      artistImage:
          map['artist_image'] != null ? map['artist_image'] as String : null,
      gender: map['gender'] != null ? map['gender'] as String : null,
      artistCategories: map['artist_categories'] != null
          ? map['artist_categories'] as String
          : null,
      accountNumber: map['account_number'] != null
          ? map['account_number'] as String
          : null,
      accountHolderName: map['account_holder_name'] != null
          ? map['account_holder_name'] as String
          : null,
      accountIFSC:
          map['account_ifsc'] != null ? map['account_ifsc'] as String : null,
      bankName: map['bank_name'] != null ? map['bank_name'] as String : null,
      isActive: map['is_active'] != null ? map['is_active'] as String : null,
      dateTime: map['date_time'] != null ? map['date_time'] as String : null,
      addedBy: map['added_by'] != null ? map['added_by'] as String : null,
      updateDate: map['update_date'] as dynamic,
      updatedBy: map['updated_by'] as dynamic,
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
    );
  }

  String toJson() => json.encode(toMap());

  factory ArtistModel.fromJson(String source) =>
      ArtistModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ArtistModel(id: $id, salonId: $salonId, artistNameEng: $artistNameEng, artistNameArb: $artistNameArb, artistEmail: $artistEmail, artistContactNumber: $artistContactNumber, artistImage: $artistImage, gender: $gender, artistCategories: $artistCategories, accountNumber: $accountNumber, accountHolderName: $accountHolderName, accountIFSC: $accountIFSC, bankName: $bankName, isActive: $isActive, dateTime: $dateTime, addedBy: $addedBy, updateDate: $updateDate, updatedBy: $updatedBy, salonNameEng: $salonNameEng, salonNameArb: $salonNameArb, email: $email, contactNumber: $contactNumber, salonImage: $salonImage)';
  }

  @override
  bool operator ==(covariant ArtistModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.salonId == salonId &&
        other.artistNameEng == artistNameEng &&
        other.artistNameArb == artistNameArb &&
        other.artistEmail == artistEmail &&
        other.artistContactNumber == artistContactNumber &&
        other.artistImage == artistImage &&
        other.gender == gender &&
        other.artistCategories == artistCategories &&
        other.accountNumber == accountNumber &&
        other.accountHolderName == accountHolderName &&
        other.accountIFSC == accountIFSC &&
        other.bankName == bankName &&
        other.isActive == isActive &&
        other.dateTime == dateTime &&
        other.addedBy == addedBy &&
        other.updateDate == updateDate &&
        other.updatedBy == updatedBy &&
        other.salonNameEng == salonNameEng &&
        other.salonNameArb == salonNameArb &&
        other.email == email &&
        other.contactNumber == contactNumber &&
        other.salonImage == salonImage;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        salonId.hashCode ^
        artistNameEng.hashCode ^
        artistNameArb.hashCode ^
        artistEmail.hashCode ^
        artistContactNumber.hashCode ^
        artistImage.hashCode ^
        gender.hashCode ^
        artistCategories.hashCode ^
        accountNumber.hashCode ^
        accountHolderName.hashCode ^
        accountIFSC.hashCode ^
        bankName.hashCode ^
        isActive.hashCode ^
        dateTime.hashCode ^
        addedBy.hashCode ^
        updateDate.hashCode ^
        updatedBy.hashCode ^
        salonNameEng.hashCode ^
        salonNameArb.hashCode ^
        email.hashCode ^
        contactNumber.hashCode ^
        salonImage.hashCode;
  }
}
