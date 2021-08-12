//import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:core';
import 'package:pratokente/core/datamodels/products/product_data.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'cart_product.freezed.dart';
part 'cart_product.g.dart';

@freezed
class CartProduct with _$CartProduct {
  factory CartProduct({
    double? totalPrice,
    String? userId,
    int? quantity,
    double? subtotal,
    String? cartId,
    ProductData? products,
    String? status,
    DateTime? date,
  }) = _CartProduct;

  factory CartProduct.fromJson(Map<String, dynamic> json) =>
      _$CartProductFromJson(json);
}
