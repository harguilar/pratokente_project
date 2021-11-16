// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CartProduct _$_$_CartProductFromJson(Map<String, dynamic> json) {
  return _$_CartProduct(
    totalPrice: (json['totalPrice'] as num).toDouble(),
    userId: json['userId'] as String,
    quantity: json['quantity'] as int,
    subtotal: (json['subtotal'] as num).toDouble(),
    cartId: json['cartId'] as String,
    products: ProductData.fromJson(json['products'] as Map<String, dynamic>),
    status: json['status'] as String,
    date: DateTime.parse(json['date'] as String),
  );
}

Map<String, dynamic> _$_$_CartProductToJson(_$_CartProduct instance) =>
    <String, dynamic>{
      'totalPrice': instance.totalPrice,
      'userId': instance.userId,
      'quantity': instance.quantity,
      'subtotal': instance.subtotal,
      'cartId': instance.cartId,
      'products': instance.products,
      'status': instance.status,
      'date': instance.date.toIso8601String(),
    };
