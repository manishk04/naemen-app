import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'order_item_model.dart';
import 'order_model.dart';

class OrderDetailModel {
  OrderModel? order;
  List<OrderItemModel>? orderItems;
  OrderDetailModel({
    this.order,
    this.orderItems,
  });

  OrderDetailModel copyWith({
    OrderModel? order,
    List<OrderItemModel>? orderItems,
  }) {
    return OrderDetailModel(
      order: order ?? this.order,
      orderItems: orderItems ?? this.orderItems,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'order': order?.toMap(),
      'orderItems': orderItems!.map((x) => x.toMap()).toList(),
    };
  }

  factory OrderDetailModel.fromMap(Map<String, dynamic> map) {
    return OrderDetailModel(
      order: map['order'] != null
          ? OrderModel.fromMap(map['order'] as Map<String, dynamic>)
          : null,
      orderItems: map['order_item'] != null
          ? List<OrderItemModel>.from(
              (map['order_item'] as List<dynamic>).map<OrderItemModel?>(
                (x) => OrderItemModel.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory OrderDetailModel.fromJson(String source) =>
      OrderDetailModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'OrderDetailModel(order: $order, orderItems: $orderItems)';

  @override
  bool operator ==(covariant OrderDetailModel other) {
    if (identical(this, other)) return true;

    return other.order == order && listEquals(other.orderItems, orderItems);
  }

  @override
  int get hashCode => order.hashCode ^ orderItems.hashCode;
}
