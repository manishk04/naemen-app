import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:naemen/models/category_model.dart';

import 'artist_service_model.dart';

class StoreServiceModel {
  CategoryModel? category;
  List<ArtistServiceModel>? services;
  StoreServiceModel({
    this.category,
    this.services,
  });

  StoreServiceModel copyWith({
    CategoryModel? category,
    List<ArtistServiceModel>? services,
  }) {
    return StoreServiceModel(
      category: category ?? this.category,
      services: services ?? this.services,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'category': category?.toMap(),
      'services': services!.map((x) => x.toMap()).toList(),
    };
  }

  factory StoreServiceModel.fromMap(Map<String, dynamic> map) {
    return StoreServiceModel(
      category: map['category'] != null
          ? CategoryModel.fromMap(map['category'] as Map<String, dynamic>)
          : null,
      services: map['services'] != null
          ? List<ArtistServiceModel>.from(
              (map['services'] as List<dynamic>).map<ArtistServiceModel?>(
                (x) => ArtistServiceModel.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory StoreServiceModel.fromJson(String source) =>
      StoreServiceModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'StoreServiceModel(category: $category, services: $services)';

  @override
  bool operator ==(covariant StoreServiceModel other) {
    if (identical(this, other)) return true;

    return other.category == category && listEquals(other.services, services);
  }

  @override
  int get hashCode => category.hashCode ^ services.hashCode;
}
