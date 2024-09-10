import 'dart:convert';

class OrderItemModel {
  int? id;
  int? orderId;
  String? storeId;
  int? customerId;
  String? orderNumber;
  int? serviceId;
  String? serviceTitle;
  String? serviceTitleArb;
  String? serviceDate;
  int? serviceDuration;
  int? serviceAmount;
  dynamic artistStartTime;
  dynamic artistEndTime;
  String? isActive;
  String? serviceStatus;
  String? dateTime;
  OrderItemModel({
    this.id,
    this.orderId,
    this.storeId,
    this.customerId,
    this.orderNumber,
    this.serviceId,
    this.serviceTitle,
    this.serviceTitleArb,
    this.serviceDate,
    this.serviceDuration,
    this.serviceAmount,
    this.artistStartTime,
    this.artistEndTime,
    this.isActive,
    this.serviceStatus,
    this.dateTime,
  });

  OrderItemModel copyWith({
    int? id,
    int? orderId,
    String? storeId,
    int? customerId,
    String? orderNumber,
    int? serviceId,
    String? serviceTitle,
    String? serviceTitleArb,
    String? serviceDate,
    int? serviceDuration,
    int? serviceAmount,
    dynamic artistStartTime,
    dynamic artistEndTime,
    String? isActive,
    String? serviceStatus,
    String? dateTime,
  }) {
    return OrderItemModel(
      id: id ?? this.id,
      orderId: orderId ?? this.orderId,
      storeId: storeId ?? this.storeId,
      customerId: customerId ?? this.customerId,
      orderNumber: orderNumber ?? this.orderNumber,
      serviceId: serviceId ?? this.serviceId,
      serviceTitle: serviceTitle ?? this.serviceTitle,
      serviceTitleArb: serviceTitleArb ?? this.serviceTitleArb,
      serviceDate: serviceDate ?? this.serviceDate,
      serviceDuration: serviceDuration ?? this.serviceDuration,
      serviceAmount: serviceAmount ?? this.serviceAmount,
      artistStartTime: artistStartTime ?? this.artistStartTime,
      artistEndTime: artistEndTime ?? this.artistEndTime,
      isActive: isActive ?? this.isActive,
      serviceStatus: serviceStatus ?? this.serviceStatus,
      dateTime: dateTime ?? this.dateTime,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'orderId': orderId,
      'storeId': storeId,
      'customerId': customerId,
      'orderNumber': orderNumber,
      'serviceId': serviceId,
      'serviceTitle': serviceTitle,
      'serviceTitleArb': serviceTitleArb,
      'serviceDate': serviceDate,
      'serviceDuration': serviceDuration,
      'serviceAmount': serviceAmount,
      'artistStartTime': artistStartTime,
      'artistEndTime': artistEndTime,
      'isActive': isActive,
      'serviceStatus': serviceStatus,
      'dateTime': dateTime,
    };
  }

  factory OrderItemModel.fromMap(Map<String, dynamic> map) {
    return OrderItemModel(
      id: map['id'] != null ? map['id'] as int : null,
      orderId: map['order_id'] != null ? map['order_id'] as int : null,
      storeId: map['store_id'] != null ? map['store_id'] as String : null,
      customerId: map['customer_id'] != null ? map['customer_id'] as int : null,
      orderNumber:
          map['order_number'] != null ? map['order_number'] as String : null,
      serviceId: map['service_id'] != null ? map['service_id'] as int : null,
      serviceTitle:
          map['service_title'] != null ? map['service_title'] as String : null,
      serviceTitleArb: map['service_title_arb'] != null
          ? map['service_title_arb'] as String
          : null,
      serviceDate:
          map['service_date'] != null ? map['service_date'] as String : null,
      serviceDuration: map['service_duraction'] != null
          ? map['service_duraction'] as int
          : null,
      serviceAmount:
          map['service_amount'] != null ? map['service_amount'] as int : null,
      artistStartTime: map['artist_start_time'] as dynamic,
      artistEndTime: map['artist_end_time'] as dynamic,
      isActive: map['is_active'] != null ? map['is_active'] as String : null,
      serviceStatus: map['service_status'] != null
          ? map['service_status'] as String
          : null,
      dateTime: map['date_time'] != null ? map['date_time'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory OrderItemModel.fromJson(String source) =>
      OrderItemModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'OrderItemModel(id: $id, orderId: $orderId, storeId: $storeId, customerId: $customerId, orderNumber: $orderNumber, serviceId: $serviceId, serviceTitle: $serviceTitle, serviceTitleArb: $serviceTitleArb, serviceDate: $serviceDate, serviceDuration: $serviceDuration, serviceAmount: $serviceAmount, artistStartTime: $artistStartTime, artistEndTime: $artistEndTime, isActive: $isActive, serviceStatus: $serviceStatus, dateTime: $dateTime)';
  }

  @override
  bool operator ==(covariant OrderItemModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.orderId == orderId &&
        other.storeId == storeId &&
        other.customerId == customerId &&
        other.orderNumber == orderNumber &&
        other.serviceId == serviceId &&
        other.serviceTitle == serviceTitle &&
        other.serviceTitleArb == serviceTitleArb &&
        other.serviceDate == serviceDate &&
        other.serviceDuration == serviceDuration &&
        other.serviceAmount == serviceAmount &&
        other.artistStartTime == artistStartTime &&
        other.artistEndTime == artistEndTime &&
        other.isActive == isActive &&
        other.serviceStatus == serviceStatus &&
        other.dateTime == dateTime;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        orderId.hashCode ^
        storeId.hashCode ^
        customerId.hashCode ^
        orderNumber.hashCode ^
        serviceId.hashCode ^
        serviceTitle.hashCode ^
        serviceTitleArb.hashCode ^
        serviceDate.hashCode ^
        serviceDuration.hashCode ^
        serviceAmount.hashCode ^
        artistStartTime.hashCode ^
        artistEndTime.hashCode ^
        isActive.hashCode ^
        serviceStatus.hashCode ^
        dateTime.hashCode;
  }
}
