import 'dart:convert';

class CustomerModel {
  int? id;
  String? customerName;
  String? email;
  String? verifyStatus;
  String? contactNumber;
  String? dateOfBirth;
  CustomerModel({
    this.id,
    this.customerName,
    this.email,
    this.verifyStatus,
    this.contactNumber,
    this.dateOfBirth,
  });

  CustomerModel copyWith({
    int? id,
    String? customerName,
    String? email,
    String? verifyStatus,
    String? contactNumber,
    String? dateOfBirth,
  }) {
    return CustomerModel(
      id: id ?? this.id,
      customerName: customerName ?? this.customerName,
      email: email ?? this.email,
      verifyStatus: verifyStatus ?? this.verifyStatus,
      contactNumber: contactNumber ?? this.contactNumber,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'customerName': customerName,
      'email': email,
      'verifyStatus': verifyStatus,
      'contactNumber': contactNumber,
      'dateOfBirth': dateOfBirth,
    };
  }

  factory CustomerModel.fromMap(Map<String, dynamic> map) {
    return CustomerModel(
      id: map['id'] != null ? map['id'] as int : null,
      customerName:
          map['customer_name'] != null ? map['customer_name'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
      verifyStatus:
          map['verify_status'] != null ? map['verify_status'] as String : null,
      contactNumber: map['contact_number'] != null
          ? map['contact_number'] as String
          : null,
      dateOfBirth:
          map['date_of_birth'] != null ? map['date_of_birth'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory CustomerModel.fromJson(String source) =>
      CustomerModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'CustomerModel(id: $id, customerName: $customerName, email: $email, verifyStatus: $verifyStatus, contactNumber: $contactNumber, dateOfBirth: $dateOfBirth)';
  }

  @override
  bool operator ==(covariant CustomerModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.customerName == customerName &&
        other.email == email &&
        other.verifyStatus == verifyStatus &&
        other.contactNumber == contactNumber &&
        other.dateOfBirth == dateOfBirth;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        customerName.hashCode ^
        email.hashCode ^
        verifyStatus.hashCode ^
        contactNumber.hashCode ^
        dateOfBirth.hashCode;
  }
}
