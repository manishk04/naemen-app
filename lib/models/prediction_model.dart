class Prediction {
  String? description;
  String? placeId;
  String? reference;
  List<String>? types;

  Prediction({this.description, this.placeId, this.reference, this.types});

  factory Prediction.fromJson(Map<String, dynamic> json) {
    return Prediction(
      description: json['description'],
      placeId: json['place_id'],
      reference: json['reference'],
      types: json['types'] != null ? List<String>.from(json['types']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['description'] = description;
    data['place_id'] = placeId;
    data['reference'] = reference;
    if (types != null) {
      data['types'] = types;
    }
    return data;
  }
}
