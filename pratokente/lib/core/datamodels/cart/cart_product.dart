//import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:core';
import 'package:pratokente/core/datamodels/products/product_data.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'cart_product.freezed.dart';
part 'cart_product.g.dart';

@freezed
class CartProduct with _$CartProduct {
  factory CartProduct({
    required double totalPrice,
    required String userId,
    required int quantity,
    required double subtotal,
    required String cartId,
    required ProductData products,
    required String status,
    required DateTime date,
  }) = _CartProduct;
/*   int? get getQuantity => quantity;
  set getQuantity(int? quantity) => quantity = (quantity! + 1); */

  factory CartProduct.fromJson(Map<String, dynamic> json) =>
      _$CartProductFromJson(json);
}
