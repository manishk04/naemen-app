import 'prediction_model.dart';

class GoogleMapSearchModel {
  List<Prediction>? predictions;
  String? status;

  GoogleMapSearchModel({this.predictions, this.status});

  factory GoogleMapSearchModel.fromJson(Map<String, dynamic> json) {
    return GoogleMapSearchModel(
      predictions: json['predictions'] != null
          ? (json['predictions'] as List)
              .map((i) => Prediction.fromJson(i))
              .toList()
          : null,
      status: json['status'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (predictions != null) {
      data['predictions'] = predictions!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
