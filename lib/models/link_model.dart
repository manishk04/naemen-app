import 'dart:convert';

class LinkModel {
  String? url;
  String? label;
  bool? active;
  LinkModel({
    this.url,
    this.label,
    this.active,
  });

  LinkModel copyWith({
    String? url,
    String? label,
    bool? active,
  }) {
    return LinkModel(
      url: url ?? this.url,
      label: label ?? this.label,
      active: active ?? this.active,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'url': url,
      'label': label,
      'active': active,
    };
  }

  factory LinkModel.fromMap(Map<String, dynamic> map) {
    return LinkModel(
      url: map['url'] != null ? map['url'] as String : null,
      label: map['label'] != null ? map['label'] as String : null,
      active: map['active'] != null ? map['active'] as bool : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory LinkModel.fromJson(String source) =>
      LinkModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'LinkModel(url: $url, label: $label, active: $active)';

  @override
  bool operator ==(covariant LinkModel other) {
    if (identical(this, other)) return true;

    return other.url == url && other.label == label && other.active == active;
  }

  @override
  int get hashCode => url.hashCode ^ label.hashCode ^ active.hashCode;
}
