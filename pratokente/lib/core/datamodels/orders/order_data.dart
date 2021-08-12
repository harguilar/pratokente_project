import 'dart:core';
import 'package:pratokente/core/datamodels/cart/cart_product.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'order_data.freezed.dart';
part 'order_data.g.dart';

@freezed
class OrderData with _$OrderData {
  factory OrderData({
    List<CartProduct>? cartProducts,
    DateTime? date,
    double? totalPrice,
    String? paymentMethod,
    String? orderId,
    String? deliveryAddress,
    double? subTotal,
    String? userId,
    int? orderStatus,
  }) = _OrderData;

  factory OrderData.fromJson(Map<String, dynamic> json) =>
      _$OrderDataFromJson(json);
}
