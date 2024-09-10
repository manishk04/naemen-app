// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class OrderModel {
  int? orderId;
  String? orderNumber;
  int? customerId;
  String? storeId;
  String? customerAddress;
  String? lat;
  String? lng;
  num? orderAmount;
  dynamic couponId;
  dynamic couponCode;
  String? serviceStartTime;
  String? serviceEndTime;
  int? artistId;
  num? discountAmount;
  num? finalPayAmount;
  String? paymentStatus;
  String? paymentId;
  String? orderStatus;
  String? orderGenerateTime;
  String? customerName;
  String? email;
  String? contactNumber;
  dynamic profilePic;
  String? salonNameEng;
  String? salonNameArb;
  String? salonImage;
  String? crNo;
  String? vatNo;
  String? logAddress;
  String? latAddress;
  String? cityIso;
  String? address_2;
  String? artistNameEng;
  String? artistNameArb;
  String? artistContactNumber;
  OrderModel({
    this.orderId,
    this.orderNumber,
    this.customerId,
    this.storeId,
    this.customerAddress,
    this.lat,
    this.lng,
    this.orderAmount,
    this.couponId,
    this.couponCode,
    this.serviceStartTime,
    this.serviceEndTime,
    this.artistId,
    this.discountAmount,
    this.finalPayAmount,
    this.paymentStatus,
    this.paymentId,
    this.orderStatus,
    this.orderGenerateTime,
    this.customerName,
    this.email,
    this.contactNumber,
    this.profilePic,
    this.salonNameEng,
    this.salonNameArb,
    this.salonImage,
    this.crNo,
    this.vatNo,
    this.logAddress,
    this.latAddress,
    this.cityIso,
    this.address_2,
    this.artistNameEng,
    this.artistNameArb,
    this.artistContactNumber,
  });

  OrderModel copyWith({
    int? orderId,
    String? orderNumber,
    int? customerId,
    String? storeId,
    String? customerAddress,
    String? lat,
    String? lng,
    num? orderAmount,
    dynamic couponId,
    dynamic couponCode,
    String? serviceStartTime,
    String? serviceEndTime,
    int? artistId,
    num? discountAmount,
    num? finalPayAmount,
    String? paymentStatus,
    String? paymentId,
    String? orderStatus,
    String? orderGenerateTime,
    String? customerName,
    String? email,
    String? contactNumber,
    dynamic profilePic,
    String? salonNameEng,
    String? salonNameArb,
    String? salonImage,
    String? crNo,
    String? vatNo,
    String? logAddress,
    String? latAddress,
    String? cityIso,
    String? address_2,
    String? artistNameEng,
    String? artistNameArb,
    String? artistContactNumber,
  }) {
    return OrderModel(
      orderId: orderId ?? this.orderId,
      orderNumber: orderNumber ?? this.orderNumber,
      customerId: customerId ?? this.customerId,
      storeId: storeId ?? this.storeId,
      customerAddress: customerAddress ?? this.customerAddress,
      lat: lat ?? this.lat,
      lng: lng ?? this.lng,
      orderAmount: orderAmount ?? this.orderAmount,
      couponId: couponId ?? this.couponId,
      couponCode: couponCode ?? this.couponCode,
      serviceStartTime: serviceStartTime ?? this.serviceStartTime,
      serviceEndTime: serviceEndTime ?? this.serviceEndTime,
      artistId: artistId ?? this.artistId,
      discountAmount: discountAmount ?? this.discountAmount,
      finalPayAmount: finalPayAmount ?? this.finalPayAmount,
      paymentStatus: paymentStatus ?? this.paymentStatus,
      paymentId: paymentId ?? this.paymentId,
      orderStatus: orderStatus ?? this.orderStatus,
      orderGenerateTime: orderGenerateTime ?? this.orderGenerateTime,
      customerName: customerName ?? this.customerName,
      email: email ?? this.email,
      contactNumber: contactNumber ?? this.contactNumber,
      profilePic: profilePic ?? this.profilePic,
      salonNameEng: salonNameEng ?? this.salonNameEng,
      salonNameArb: salonNameArb ?? this.salonNameArb,
      salonImage: salonImage ?? this.salonImage,
      crNo: crNo ?? this.crNo,
      vatNo: vatNo ?? this.vatNo,
      logAddress: logAddress ?? this.logAddress,
      latAddress: latAddress ?? this.latAddress,
      cityIso: cityIso ?? this.cityIso,
      address_2: address_2 ?? this.address_2,
      artistNameEng: artistNameEng ?? this.artistNameEng,
      artistNameArb: artistNameArb ?? this.artistNameArb,
      artistContactNumber: artistContactNumber ?? this.artistContactNumber,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'orderId': orderId,
      'orderNumber': orderNumber,
      'customerId': customerId,
      'storeId': storeId,
      'customerAddress': customerAddress,
      'lat': lat,
      'lng': lng,
      'orderAmount': orderAmount,
      'couponId': couponId,
      'couponCode': couponCode,
      'serviceStartTime': serviceStartTime,
      'serviceEndTime': serviceEndTime,
      'artistId': artistId,
      'discountAmount': discountAmount,
      'finalPayAmount': finalPayAmount,
      'paymentStatus': paymentStatus,
      'paymentId': paymentId,
      'orderStatus': orderStatus,
      'orderGenerateTime': orderGenerateTime,
      'customerName': customerName,
      'email': email,
      'contactNumber': contactNumber,
      'profilePic': profilePic,
      'salonNameEng': salonNameEng,
      'salonNameArb': salonNameArb,
      'salonImage': salonImage,
      'crNo': crNo,
      'vatNo': vatNo,
      'logAddress': logAddress,
      'latAddress': latAddress,
      'cityIso': cityIso,
      'address_2': address_2,
      'artistNameEng': artistNameEng,
      'artistNameArb': artistNameArb,
      'artistContactNumber': artistContactNumber,
    };
  }

  factory OrderModel.fromMap(Map<String, dynamic> map) {
    return OrderModel(
      orderId: map['orderId'] != null ? map['orderId'] as int : null,
      orderNumber:
          map['order_number'] != null ? map['order_number'] as String : null,
      customerId: map['customer_id'] != null ? map['customer_id'] as int : null,
      storeId: map['store_id'] != null ? map['store_id'] as String : null,
      customerAddress: map['customer_address'] != null
          ? map['customer_address'] as String
          : null,
      lat: map['lat'] != null ? map['lat'] as String : null,
      lng: map['lng'] != null ? map['lng'] as String : null,
      orderAmount:
          map['order_amount'] != null ? map['order_amount'] as num : null,
      couponId: map['coupon_id'] as dynamic,
      couponCode: map['coupon_code'] as dynamic,
      serviceStartTime: map['service_start_time'] != null
          ? map['service_start_time'] as String
          : null,
      serviceEndTime: map['service_end_time'] != null
          ? map['service_end_time'] as String
          : null,
      artistId: map['artist_id'] != null ? map['artist_id'] as int : null,
      discountAmount:
          map['discount_amount'] != null ? map['discount_amount'] as num : null,
      finalPayAmount: map['final_pay_amount'] != null
          ? map['final_pay_amount'] as num
          : null,
      paymentStatus: map['payment_status'] != null
          ? map['payment_status'] as String
          : null,
      paymentId: map['payment_id'] != null ? map['payment_id'] as String : null,
      orderStatus:
          map['order_status'] != null ? map['order_status'] as String : null,
      orderGenerateTime: map['order_generate_time'] != null
          ? map['order_generate_time'] as String
          : null,
      customerName:
          map['customer_name'] != null ? map['customer_name'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
      contactNumber: map['contact_number'] != null
          ? map['contact_number'] as String
          : null,
      profilePic: map['profile_pic'] as dynamic,
      salonNameEng: map['salon_name_eng'] != null
          ? map['salon_name_eng'] as String
          : null,
      salonNameArb: map['salon_name_arb'] != null
          ? map['salon_name_arb'] as String
          : null,
      salonImage:
          map['salon_image'] != null ? map['salon_image'] as String : null,
      crNo: map['cr_no'] != null ? map['cr_no'] as String : null,
      vatNo: map['vat_no'] != null ? map['vat_no'] as String : null,
      logAddress:
          map['log_address'] != null ? map['log_address'] as String : null,
      latAddress:
          map['lat_address'] != null ? map['lat_address'] as String : null,
      cityIso: map['city_iso'] != null ? map['city_iso'] as String : null,
      address_2: map['address_2'] != null ? map['address_2'] as String : null,
      artistNameEng: map['artist_name_eng'] != null
          ? map['artist_name_eng'] as String
          : null,
      artistNameArb: map['artist_name_arb'] != null
          ? map['artist_name_arb'] as String
          : null,
      artistContactNumber: map['artist_contact_number'] != null
          ? map['artist_contact_number'] as String
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory OrderModel.fromJson(String source) =>
      OrderModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'OrderModel(orderId: $orderId, orderNumber: $orderNumber, customerId: $customerId, storeId: $storeId, customerAddress: $customerAddress, lat: $lat, lng: $lng, orderAmount: $orderAmount, couponId: $couponId, couponCode: $couponCode, serviceStartTime: $serviceStartTime, serviceEndTime: $serviceEndTime, artistId: $artistId, discountAmount: $discountAmount, finalPayAmount: $finalPayAmount, paymentStatus: $paymentStatus, paymentId: $paymentId, orderStatus: $orderStatus, orderGenerateTime: $orderGenerateTime, customerName: $customerName, email: $email, contactNumber: $contactNumber, profilePic: $profilePic, salonNameEng: $salonNameEng, salonNameArb: $salonNameArb, salonImage: $salonImage, crNo: $crNo, vatNo: $vatNo, logAddress: $logAddress, latAddress: $latAddress, cityIso: $cityIso, address_2: $address_2, artistNameEng: $artistNameEng, artistNameArb: $artistNameArb, artistContactNumber: $artistContactNumber)';
  }

  @override
  bool operator ==(covariant OrderModel other) {
    if (identical(this, other)) return true;

    return other.orderId == orderId &&
        other.orderNumber == orderNumber &&
        other.customerId == customerId &&
        other.storeId == storeId &&
        other.customerAddress == customerAddress &&
        other.lat == lat &&
        other.lng == lng &&
        other.orderAmount == orderAmount &&
        other.couponId == couponId &&
        other.couponCode == couponCode &&
        other.serviceStartTime == serviceStartTime &&
        other.serviceEndTime == serviceEndTime &&
        other.artistId == artistId &&
        other.discountAmount == discountAmount &&
        other.finalPayAmount == finalPayAmount &&
        other.paymentStatus == paymentStatus &&
        other.paymentId == paymentId &&
        other.orderStatus == orderStatus &&
        other.orderGenerateTime == orderGenerateTime &&
        other.customerName == customerName &&
        other.email == email &&
        other.contactNumber == contactNumber &&
        other.profilePic == profilePic &&
        other.salonNameEng == salonNameEng &&
        other.salonNameArb == salonNameArb &&
        other.salonImage == salonImage &&
        other.crNo == crNo &&
        other.vatNo == vatNo &&
        other.logAddress == logAddress &&
        other.latAddress == latAddress &&
        other.cityIso == cityIso &&
        other.address_2 == address_2 &&
        other.artistNameEng == artistNameEng &&
        other.artistNameArb == artistNameArb &&
        other.artistContactNumber == artistContactNumber;
  }

  @override
  int get hashCode {
    return orderId.hashCode ^
        orderNumber.hashCode ^
        customerId.hashCode ^
        storeId.hashCode ^
        customerAddress.hashCode ^
        lat.hashCode ^
        lng.hashCode ^
        orderAmount.hashCode ^
        couponId.hashCode ^
        couponCode.hashCode ^
        serviceStartTime.hashCode ^
        serviceEndTime.hashCode ^
        artistId.hashCode ^
        discountAmount.hashCode ^
        finalPayAmount.hashCode ^
        paymentStatus.hashCode ^
        paymentId.hashCode ^
        orderStatus.hashCode ^
        orderGenerateTime.hashCode ^
        customerName.hashCode ^
        email.hashCode ^
        contactNumber.hashCode ^
        profilePic.hashCode ^
        salonNameEng.hashCode ^
        salonNameArb.hashCode ^
        salonImage.hashCode ^
        crNo.hashCode ^
        vatNo.hashCode ^
        logAddress.hashCode ^
        latAddress.hashCode ^
        cityIso.hashCode ^
        address_2.hashCode ^
        artistNameEng.hashCode ^
        artistNameArb.hashCode ^
        artistContactNumber.hashCode;
  }
}
