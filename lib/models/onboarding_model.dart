import 'dart:convert';

class OnboardingModel {
  int? id;
  String? titleEng;
  String? titleArb;
  String? shortDescriptionEng;
  String? shortDescriptionArb;
  String? position;
  String? image;
  String? bgImage;
  String? isActive;
  String? dateTime;
  OnboardingModel({
    this.id,
    this.titleEng,
    this.titleArb,
    this.shortDescriptionEng,
    this.shortDescriptionArb,
    this.position,
    this.image,
    this.bgImage,
    this.isActive,
    this.dateTime,
  });

  OnboardingModel copyWith({
    int? id,
    String? titleEng,
    String? titleArb,
    String? shortDescriptionEng,
    String? shortDescriptionArb,
    String? position,
    String? image,
    String? bgImage,
    String? isActive,
    String? dateTime,
  }) {
    return OnboardingModel(
      id: id ?? this.id,
      titleEng: titleEng ?? this.titleEng,
      titleArb: titleArb ?? this.titleArb,
      shortDescriptionEng: shortDescriptionEng ?? this.shortDescriptionEng,
      shortDescriptionArb: shortDescriptionArb ?? this.shortDescriptionArb,
      position: position ?? this.position,
      image: image ?? this.image,
      bgImage: bgImage ?? this.bgImage,
      isActive: isActive ?? this.isActive,
      dateTime: dateTime ?? this.dateTime,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'titleEng': titleEng,
      'titleArb': titleArb,
      'shortDescriptionEng': shortDescriptionEng,
      'shortDescriptionArb': shortDescriptionArb,
      'position': position,
      'image': image,
      'bgImage': bgImage,
      'isActive': isActive,
      'dateTime': dateTime,
    };
  }

  factory OnboardingModel.fromMap(Map<String, dynamic> map) {
    return OnboardingModel(
      id: map['id'] != null ? map['id'] as int : null,
      titleEng: map['title_eng'] != null ? map['title_eng'] as String : null,
      titleArb: map['title_arb'] != null ? map['title_arb'] as String : null,
      shortDescriptionEng: map['short_descrp_eng'] != null
          ? map['short_descrp_eng'] as String
          : null,
      shortDescriptionArb: map['short_descrp_arb'] != null
          ? map['short_descrp_arb'] as String
          : null,
      position: map['position'] != null ? map['position'] as String : null,
      image: map['image'] != null ? map['image'] as String : null,
      bgImage: map['bg_image'] != null ? map['bg_image'] as String : null,
      isActive: map['is_active'] != null ? map['is_active'] as String : null,
      dateTime: map['date_time'] != null ? map['date_time'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory OnboardingModel.fromJson(String source) =>
      OnboardingModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'OnboardingModel(id: $id, titleEng: $titleEng, titleArb: $titleArb, shortDescriptionEng: $shortDescriptionEng, shortDescriptionArb: $shortDescriptionArb, position: $position, image: $image, bgImage: $bgImage, isActive: $isActive, dateTime: $dateTime)';
  }

  @override
  bool operator ==(covariant OnboardingModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.titleEng == titleEng &&
        other.titleArb == titleArb &&
        other.shortDescriptionEng == shortDescriptionEng &&
        other.shortDescriptionArb == shortDescriptionArb &&
        other.position == position &&
        other.image == image &&
        other.bgImage == bgImage &&
        other.isActive == isActive &&
        other.dateTime == dateTime;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        titleEng.hashCode ^
        titleArb.hashCode ^
        shortDescriptionEng.hashCode ^
        shortDescriptionArb.hashCode ^
        position.hashCode ^
        image.hashCode ^
        bgImage.hashCode ^
        isActive.hashCode ^
        dateTime.hashCode;
  }
}
