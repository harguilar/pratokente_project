// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'cart_product.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CartProduct _$CartProductFromJson(Map<String, dynamic> json) {
  return _CartProduct.fromJson(json);
}

/// @nodoc
class _$CartProductTearOff {
  const _$CartProductTearOff();

  _CartProduct call(
      {required double totalPrice,
      required String userId,
      required int quantity,
      required double subtotal,
      required String cartId,
      required ProductData products,
      required String status,
      required DateTime date}) {
    return _CartProduct(
      totalPrice: totalPrice,
      userId: userId,
      quantity: quantity,
      subtotal: subtotal,
      cartId: cartId,
      products: products,
      status: status,
      date: date,
    );
  }

  CartProduct fromJson(Map<String, Object> json) {
    return CartProduct.fromJson(json);
  }
}

/// @nodoc
const $CartProduct = _$CartProductTearOff();

/// @nodoc
mixin _$CartProduct {
  double get totalPrice => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  int get quantity => throw _privateConstructorUsedError;
  double get subtotal => throw _privateConstructorUsedError;
  String get cartId => throw _privateConstructorUsedError;
  ProductData get products => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CartProductCopyWith<CartProduct> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CartProductCopyWith<$Res> {
  factory $CartProductCopyWith(
          CartProduct value, $Res Function(CartProduct) then) =
      _$CartProductCopyWithImpl<$Res>;
  $Res call(
      {double totalPrice,
      String userId,
      int quantity,
      double subtotal,
      String cartId,
      ProductData products,
      String status,
      DateTime date});

  $ProductDataCopyWith<$Res> get products;
}

/// @nodoc
class _$CartProductCopyWithImpl<$Res> implements $CartProductCopyWith<$Res> {
  _$CartProductCopyWithImpl(this._value, this._then);

  final CartProduct _value;
  // ignore: unused_field
  final $Res Function(CartProduct) _then;

  @override
  $Res call({
    Object? totalPrice = freezed,
    Object? userId = freezed,
    Object? quantity = freezed,
    Object? subtotal = freezed,
    Object? cartId = freezed,
    Object? products = freezed,
    Object? status = freezed,
    Object? date = freezed,
  }) {
    return _then(_value.copyWith(
      totalPrice: totalPrice == freezed
          ? _value.totalPrice
          : totalPrice // ignore: cast_nullable_to_non_nullable
              as double,
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: quantity == freezed
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      subtotal: subtotal == freezed
          ? _value.subtotal
          : subtotal // ignore: cast_nullable_to_non_nullable
              as double,
      cartId: cartId == freezed
          ? _value.cartId
          : cartId // ignore: cast_nullable_to_non_nullable
              as String,
      products: products == freezed
          ? _value.products
          : products // ignore: cast_nullable_to_non_nullable
              as ProductData,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      date: date == freezed
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }

  @override
  $ProductDataCopyWith<$Res> get products {
    return $ProductDataCopyWith<$Res>(_value.products, (value) {
      return _then(_value.copyWith(products: value));
    });
  }
}

/// @nodoc
abstract class _$CartProductCopyWith<$Res>
    implements $CartProductCopyWith<$Res> {
  factory _$CartProductCopyWith(
          _CartProduct value, $Res Function(_CartProduct) then) =
      __$CartProductCopyWithImpl<$Res>;
  @override
  $Res call(
      {double totalPrice,
      String userId,
      int quantity,
      double subtotal,
      String cartId,
      ProductData products,
      String status,
      DateTime date});

  @override
  $ProductDataCopyWith<$Res> get products;
}

/// @nodoc
class __$CartProductCopyWithImpl<$Res> extends _$CartProductCopyWithImpl<$Res>
    implements _$CartProductCopyWith<$Res> {
  __$CartProductCopyWithImpl(
      _CartProduct _value, $Res Function(_CartProduct) _then)
      : super(_value, (v) => _then(v as _CartProduct));

  @override
  _CartProduct get _value => super._value as _CartProduct;

  @override
  $Res call({
    Object? totalPrice = freezed,
    Object? userId = freezed,
    Object? quantity = freezed,
    Object? subtotal = freezed,
    Object? cartId = freezed,
    Object? products = freezed,
    Object? status = freezed,
    Object? date = freezed,
  }) {
    return _then(_CartProduct(
      totalPrice: totalPrice == freezed
          ? _value.totalPrice
          : totalPrice // ignore: cast_nullable_to_non_nullable
              as double,
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: quantity == freezed
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      subtotal: subtotal == freezed
          ? _value.subtotal
          : subtotal // ignore: cast_nullable_to_non_nullable
              as double,
      cartId: cartId == freezed
          ? _value.cartId
          : cartId // ignore: cast_nullable_to_non_nullable
              as String,
      products: products == freezed
          ? _value.products
          : products // ignore: cast_nullable_to_non_nullable
              as ProductData,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      date: date == freezed
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CartProduct implements _CartProduct {
  _$_CartProduct(
      {required this.totalPrice,
      required this.userId,
      required this.quantity,
      required this.subtotal,
      required this.cartId,
      required this.products,
      required this.status,
      required this.date});

  factory _$_CartProduct.fromJson(Map<String, dynamic> json) =>
      _$_$_CartProductFromJson(json);

  @override
  final double totalPrice;
  @override
  final String userId;
  @override
  final int quantity;
  @override
  final double subtotal;
  @override
  final String cartId;
  @override
  final ProductData products;
  @override
  final String status;
  @override
  final DateTime date;

  @override
  String toString() {
    return 'CartProduct(totalPrice: $totalPrice, userId: $userId, quantity: $quantity, subtotal: $subtotal, cartId: $cartId, products: $products, status: $status, date: $date)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _CartProduct &&
            (identical(other.totalPrice, totalPrice) ||
                const DeepCollectionEquality()
                    .equals(other.totalPrice, totalPrice)) &&
            (identical(other.userId, userId) ||
                const DeepCollectionEquality().equals(other.userId, userId)) &&
            (identical(other.quantity, quantity) ||
                const DeepCollectionEquality()
                    .equals(other.quantity, quantity)) &&
            (identical(other.subtotal, subtotal) ||
                const DeepCollectionEquality()
                    .equals(other.subtotal, subtotal)) &&
            (identical(other.cartId, cartId) ||
                const DeepCollectionEquality().equals(other.cartId, cartId)) &&
            (identical(other.products, products) ||
                const DeepCollectionEquality()
                    .equals(other.products, products)) &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)) &&
            (identical(other.date, date) ||
                const DeepCollectionEquality().equals(other.date, date)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(totalPrice) ^
      const DeepCollectionEquality().hash(userId) ^
      const DeepCollectionEquality().hash(quantity) ^
      const DeepCollectionEquality().hash(subtotal) ^
      const DeepCollectionEquality().hash(cartId) ^
      const DeepCollectionEquality().hash(products) ^
      const DeepCollectionEquality().hash(status) ^
      const DeepCollectionEquality().hash(date);

  @JsonKey(ignore: true)
  @override
  _$CartProductCopyWith<_CartProduct> get copyWith =>
      __$CartProductCopyWithImpl<_CartProduct>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_CartProductToJson(this);
  }
}

abstract class _CartProduct implements CartProduct {
  factory _CartProduct(
      {required double totalPrice,
      required String userId,
      required int quantity,
      required double subtotal,
      required String cartId,
      required ProductData products,
      required String status,
      required DateTime date}) = _$_CartProduct;

  factory _CartProduct.fromJson(Map<String, dynamic> json) =
      _$_CartProduct.fromJson;

  @override
  double get totalPrice => throw _privateConstructorUsedError;
  @override
  String get userId => throw _privateConstructorUsedError;
  @override
  int get quantity => throw _privateConstructorUsedError;
  @override
  double get subtotal => throw _privateConstructorUsedError;
  @override
  String get cartId => throw _privateConstructorUsedError;
  @override
  ProductData get products => throw _privateConstructorUsedError;
  @override
  String get status => throw _privateConstructorUsedError;
  @override
  DateTime get date => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$CartProductCopyWith<_CartProduct> get copyWith =>
      throw _privateConstructorUsedError;
}
