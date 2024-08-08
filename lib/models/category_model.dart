import 'dart:convert';

class CategoryModel {
  int? id;
  String? categoryTitle;
  String? categoryArb;
  String? categoryImage;
  String? isFront;
  String? isActive;
  String? dateTime;
  CategoryModel({
    this.id,
    this.categoryTitle,
    this.categoryArb,
    this.categoryImage,
    this.isFront,
    this.isActive,
    this.dateTime,
  });

  CategoryModel copyWith({
    int? id,
    String? categoryTitle,
    String? categoryArb,
    String? categoryImage,
    String? isFront,
    String? isActive,
    String? dateTime,
  }) {
    return CategoryModel(
      id: id ?? this.id,
      categoryTitle: categoryTitle ?? this.categoryTitle,
      categoryArb: categoryArb ?? this.categoryArb,
      categoryImage: categoryImage ?? this.categoryImage,
      isFront: isFront ?? this.isFront,
      isActive: isActive ?? this.isActive,
      dateTime: dateTime ?? this.dateTime,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'categoryTitle': categoryTitle,
      'categoryArb': categoryArb,
      'categoryImage': categoryImage,
      'isFront': isFront,
      'isActive': isActive,
      'dateTime': dateTime,
    };
  }

  factory CategoryModel.fromMap(Map<String, dynamic> map) {
    return CategoryModel(
      id: map['id'] != null ? map['id'] as int : null,
      categoryTitle: map['category_title'] != null
          ? map['category_title'] as String
          : null,
      categoryArb:
          map['category_arb'] != null ? map['category_arb'] as String : null,
      categoryImage:
          map['category_img'] != null ? map['category_img'] as String : null,
      isFront: map['is_front'] != null ? map['is_front'] as String : null,
      isActive: map['is_active'] != null ? map['is_active'] as String : null,
      dateTime: map['date_time'] != null ? map['date_time'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory CategoryModel.fromJson(String source) =>
      CategoryModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'CategoryModel(id: $id, categoryTitle: $categoryTitle, categoryArb: $categoryArb, categoryImage: $categoryImage, isFront: $isFront, isActive: $isActive, dateTime: $dateTime)';
  }

  @override
  bool operator ==(covariant CategoryModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.categoryTitle == categoryTitle &&
        other.categoryArb == categoryArb &&
        other.categoryImage == categoryImage &&
        other.isFront == isFront &&
        other.isActive == isActive &&
        other.dateTime == dateTime;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        categoryTitle.hashCode ^
        categoryArb.hashCode ^
        categoryImage.hashCode ^
        isFront.hashCode ^
        isActive.hashCode ^
        dateTime.hashCode;
  }
}
