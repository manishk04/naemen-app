import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'salon_model.dart';

class TagModel {
  String? titleEng;
  String? titleArb;
  List<SalonModel>? salons;
  TagModel({
    this.titleEng,
    this.titleArb,
    this.salons,
  });

  TagModel copyWith({
    String? titleEng,
    String? titleArb,
    List<SalonModel>? salons,
  }) {
    return TagModel(
      titleEng: titleEng ?? this.titleEng,
      titleArb: titleArb ?? this.titleArb,
      salons: salons ?? this.salons,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'titleEng': titleEng,
      'titleArb': titleArb,
      'salons': salons!.map((x) => x.toMap()).toList(),
    };
  }

  factory TagModel.fromMap(Map<String, dynamic> map) {
    return TagModel(
      titleEng: map['title_eng'] != null ? map['title_eng'] as String : null,
      titleArb: map['title_arb'] != null ? map['title_arb'] as String : null,
      salons: map['salon'] != null
          ? List<SalonModel>.from(
              (map['salon'] as List<dynamic>).map<SalonModel?>(
                (x) => SalonModel.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory TagModel.fromJson(String source) =>
      TagModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'TagModel(titleEng: $titleEng, titleArb: $titleArb, salons: $salons)';

  @override
  bool operator ==(covariant TagModel other) {
    if (identical(this, other)) return true;

    return other.titleEng == titleEng &&
        other.titleArb == titleArb &&
        listEquals(other.salons, salons);
  }

  @override
  int get hashCode => titleEng.hashCode ^ titleArb.hashCode ^ salons.hashCode;
}
