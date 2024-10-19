import 'dart:convert';

class StoreMediaModel {
  int? id;
  int? salonId;
  String? type;
  String? mediaUrl;
  String? isActive;
  String? dateTime;
  StoreMediaModel({
    this.id,
    this.salonId,
    this.type,
    this.mediaUrl,
    this.isActive,
    this.dateTime,
  });

  StoreMediaModel copyWith({
    int? id,
    int? salonId,
    String? type,
    String? mediaUrl,
    String? isActive,
    String? dateTime,
  }) {
    return StoreMediaModel(
      id: id ?? this.id,
      salonId: salonId ?? this.salonId,
      type: type ?? this.type,
      mediaUrl: mediaUrl ?? this.mediaUrl,
      isActive: isActive ?? this.isActive,
      dateTime: dateTime ?? this.dateTime,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'salonId': salonId,
      'type': type,
      'mediaUrl': mediaUrl,
      'isActive': isActive,
      'dateTime': dateTime,
    };
  }

  factory StoreMediaModel.fromMap(Map<String, dynamic> map) {
    return StoreMediaModel(
      id: map['id'] != null ? map['id'] as int : null,
      salonId: map['salon_id'] != null ? map['salon_id'] as int : null,
      type: map['type'] != null ? map['type'] as String : null,
      mediaUrl: map['media_url'] != null ? map['media_url'] as String : null,
      isActive: map['is_active'] != null ? map['is_active'] as String : null,
      dateTime: map['date_time'] != null ? map['date_time'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory StoreMediaModel.fromJson(String source) =>
      StoreMediaModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'StoreMediaModel(id: $id, salonId: $salonId, type: $type, mediaUrl: $mediaUrl, isActive: $isActive, dateTime: $dateTime)';
  }

  @override
  bool operator ==(covariant StoreMediaModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.salonId == salonId &&
        other.type == type &&
        other.mediaUrl == mediaUrl &&
        other.isActive == isActive &&
        other.dateTime == dateTime;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        salonId.hashCode ^
        type.hashCode ^
        mediaUrl.hashCode ^
        isActive.hashCode ^
        dateTime.hashCode;
  }
}
