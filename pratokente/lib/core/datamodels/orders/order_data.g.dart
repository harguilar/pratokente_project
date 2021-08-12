// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_OrderData _$_$_OrderDataFromJson(Map<String, dynamic> json) {
  return _$_OrderData(
    cartProducts: (json['cartProducts'] as List<dynamic>?)
        ?.map((e) => CartProduct.fromJson(e as Map<String, dynamic>))
        .toList(),
    date: json['date'] == null ? null : DateTime.parse(json['date'] as String),
    totalPrice: (json['totalPrice'] as num?)?.toDouble(),
    paymentMethod: json['paymentMethod'] as String?,
    orderId: json['orderId'] as String?,
    deliveryAddress: json['deliveryAddress'] as String?,
    subTotal: (json['subTotal'] as num?)?.toDouble(),
    userId: json['userId'] as String?,
    orderStatus: json['orderStatus'] as int?,
  );
}

Map<String, dynamic> _$_$_OrderDataToJson(_$_OrderData instance) =>
    <String, dynamic>{
      'cartProducts': instance.cartProducts,
      'date': instance.date?.toIso8601String(),
      'totalPrice': instance.totalPrice,
      'paymentMethod': instance.paymentMethod,
      'orderId': instance.orderId,
      'deliveryAddress': instance.deliveryAddress,
      'subTotal': instance.subTotal,
      'userId': instance.userId,
      'orderStatus': instance.orderStatus,
    };
