import 'dart:convert';

class BannerModel {
  int? id;
  String? bannerImageUrl;
  String? type;
  String? isActive;
  String? dateTime;
  BannerModel({
    this.id,
    this.bannerImageUrl,
    this.type,
    this.isActive,
    this.dateTime,
  });

  BannerModel copyWith({
    int? id,
    String? bannerImageUrl,
    String? type,
    String? isActive,
    String? dateTime,
  }) {
    return BannerModel(
      id: id ?? this.id,
      bannerImageUrl: bannerImageUrl ?? this.bannerImageUrl,
      type: type ?? this.type,
      isActive: isActive ?? this.isActive,
      dateTime: dateTime ?? this.dateTime,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'bannerImageUrl': bannerImageUrl,
      'type': type,
      'isActive': isActive,
      'dateTime': dateTime,
    };
  }

  factory BannerModel.fromMap(Map<String, dynamic> map) {
    return BannerModel(
      id: map['id'] != null ? map['id'] as int : null,
      bannerImageUrl: map['banner_media_url'] != null
          ? map['banner_media_url'] as String
          : null,
      type: map['type'] != null ? map['type'] as String : null,
      isActive: map['is_active'] != null ? map['is_active'] as String : null,
      dateTime: map['date_time'] != null ? map['date_time'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory BannerModel.fromJson(String source) =>
      BannerModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'BannerModel(id: $id, bannerImageUrl: $bannerImageUrl, type: $type, isActive: $isActive, dateTime: $dateTime)';
  }

  @override
  bool operator ==(covariant BannerModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.bannerImageUrl == bannerImageUrl &&
        other.type == type &&
        other.isActive == isActive &&
        other.dateTime == dateTime;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        bannerImageUrl.hashCode ^
        type.hashCode ^
        isActive.hashCode ^
        dateTime.hashCode;
  }
}
