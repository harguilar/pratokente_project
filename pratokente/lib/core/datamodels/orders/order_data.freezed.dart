// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'order_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

OrderData _$OrderDataFromJson(Map<String, dynamic> json) {
  return _OrderData.fromJson(json);
}

/// @nodoc
class _$OrderDataTearOff {
  const _$OrderDataTearOff();

  _OrderData call(
      {List<CartProduct>? cartProducts,
      DateTime? date,
      double? totalPrice,
      String? paymentMethod,
      String? orderId,
      String? deliveryAddress,
      double? subTotal,
      String? userId,
      int? orderStatus}) {
    return _OrderData(
      cartProducts: cartProducts,
      date: date,
      totalPrice: totalPrice,
      paymentMethod: paymentMethod,
      orderId: orderId,
      deliveryAddress: deliveryAddress,
      subTotal: subTotal,
      userId: userId,
      orderStatus: orderStatus,
    );
  }

  OrderData fromJson(Map<String, Object> json) {
    return OrderData.fromJson(json);
  }
}

/// @nodoc
const $OrderData = _$OrderDataTearOff();

/// @nodoc
mixin _$OrderData {
  List<CartProduct>? get cartProducts => throw _privateConstructorUsedError;
  DateTime? get date => throw _privateConstructorUsedError;
  double? get totalPrice => throw _privateConstructorUsedError;
  String? get paymentMethod => throw _privateConstructorUsedError;
  String? get orderId => throw _privateConstructorUsedError;
  String? get deliveryAddress => throw _privateConstructorUsedError;
  double? get subTotal => throw _privateConstructorUsedError;
  String? get userId => throw _privateConstructorUsedError;
  int? get orderStatus => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OrderDataCopyWith<OrderData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderDataCopyWith<$Res> {
  factory $OrderDataCopyWith(OrderData value, $Res Function(OrderData) then) =
      _$OrderDataCopyWithImpl<$Res>;
  $Res call(
      {List<CartProduct>? cartProducts,
      DateTime? date,
      double? totalPrice,
      String? paymentMethod,
      String? orderId,
      String? deliveryAddress,
      double? subTotal,
      String? userId,
      int? orderStatus});
}

/// @nodoc
class _$OrderDataCopyWithImpl<$Res> implements $OrderDataCopyWith<$Res> {
  _$OrderDataCopyWithImpl(this._value, this._then);

  final OrderData _value;
  // ignore: unused_field
  final $Res Function(OrderData) _then;

  @override
  $Res call({
    Object? cartProducts = freezed,
    Object? date = freezed,
    Object? totalPrice = freezed,
    Object? paymentMethod = freezed,
    Object? orderId = freezed,
    Object? deliveryAddress = freezed,
    Object? subTotal = freezed,
    Object? userId = freezed,
    Object? orderStatus = freezed,
  }) {
    return _then(_value.copyWith(
      cartProducts: cartProducts == freezed
          ? _value.cartProducts
          : cartProducts // ignore: cast_nullable_to_non_nullable
              as List<CartProduct>?,
      date: date == freezed
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      totalPrice: totalPrice == freezed
          ? _value.totalPrice
          : totalPrice // ignore: cast_nullable_to_non_nullable
              as double?,
      paymentMethod: paymentMethod == freezed
          ? _value.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as String?,
      orderId: orderId == freezed
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as String?,
      deliveryAddress: deliveryAddress == freezed
          ? _value.deliveryAddress
          : deliveryAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      subTotal: subTotal == freezed
          ? _value.subTotal
          : subTotal // ignore: cast_nullable_to_non_nullable
              as double?,
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      orderStatus: orderStatus == freezed
          ? _value.orderStatus
          : orderStatus // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
abstract class _$OrderDataCopyWith<$Res> implements $OrderDataCopyWith<$Res> {
  factory _$OrderDataCopyWith(
          _OrderData value, $Res Function(_OrderData) then) =
      __$OrderDataCopyWithImpl<$Res>;
  @override
  $Res call(
      {List<CartProduct>? cartProducts,
      DateTime? date,
      double? totalPrice,
      String? paymentMethod,
      String? orderId,
      String? deliveryAddress,
      double? subTotal,
      String? userId,
      int? orderStatus});
}

/// @nodoc
class __$OrderDataCopyWithImpl<$Res> extends _$OrderDataCopyWithImpl<$Res>
    implements _$OrderDataCopyWith<$Res> {
  __$OrderDataCopyWithImpl(_OrderData _value, $Res Function(_OrderData) _then)
      : super(_value, (v) => _then(v as _OrderData));

  @override
  _OrderData get _value => super._value as _OrderData;

  @override
  $Res call({
    Object? cartProducts = freezed,
    Object? date = freezed,
    Object? totalPrice = freezed,
    Object? paymentMethod = freezed,
    Object? orderId = freezed,
    Object? deliveryAddress = freezed,
    Object? subTotal = freezed,
    Object? userId = freezed,
    Object? orderStatus = freezed,
  }) {
    return _then(_OrderData(
      cartProducts: cartProducts == freezed
          ? _value.cartProducts
          : cartProducts // ignore: cast_nullable_to_non_nullable
              as List<CartProduct>?,
      date: date == freezed
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      totalPrice: totalPrice == freezed
          ? _value.totalPrice
          : totalPrice // ignore: cast_nullable_to_non_nullable
              as double?,
      paymentMethod: paymentMethod == freezed
          ? _value.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as String?,
      orderId: orderId == freezed
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as String?,
      deliveryAddress: deliveryAddress == freezed
          ? _value.deliveryAddress
          : deliveryAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      subTotal: subTotal == freezed
          ? _value.subTotal
          : subTotal // ignore: cast_nullable_to_non_nullable
              as double?,
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      orderStatus: orderStatus == freezed
          ? _value.orderStatus
          : orderStatus // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_OrderData implements _OrderData {
  _$_OrderData(
      {this.cartProducts,
      this.date,
      this.totalPrice,
      this.paymentMethod,
      this.orderId,
      this.deliveryAddress,
      this.subTotal,
      this.userId,
      this.orderStatus});

  factory _$_OrderData.fromJson(Map<String, dynamic> json) =>
      _$_$_OrderDataFromJson(json);

  @override
  final List<CartProduct>? cartProducts;
  @override
  final DateTime? date;
  @override
  final double? totalPrice;
  @override
  final String? paymentMethod;
  @override
  final String? orderId;
  @override
  final String? deliveryAddress;
  @override
  final double? subTotal;
  @override
  final String? userId;
  @override
  final int? orderStatus;

  @override
  String toString() {
    return 'OrderData(cartProducts: $cartProducts, date: $date, totalPrice: $totalPrice, paymentMethod: $paymentMethod, orderId: $orderId, deliveryAddress: $deliveryAddress, subTotal: $subTotal, userId: $userId, orderStatus: $orderStatus)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _OrderData &&
            (identical(other.cartProducts, cartProducts) ||
                const DeepCollectionEquality()
                    .equals(other.cartProducts, cartProducts)) &&
            (identical(other.date, date) ||
                const DeepCollectionEquality().equals(other.date, date)) &&
            (identical(other.totalPrice, totalPrice) ||
                const DeepCollectionEquality()
                    .equals(other.totalPrice, totalPrice)) &&
            (identical(other.paymentMethod, paymentMethod) ||
                const DeepCollectionEquality()
                    .equals(other.paymentMethod, paymentMethod)) &&
            (identical(other.orderId, orderId) ||
                const DeepCollectionEquality()
                    .equals(other.orderId, orderId)) &&
            (identical(other.deliveryAddress, deliveryAddress) ||
                const DeepCollectionEquality()
                    .equals(other.deliveryAddress, deliveryAddress)) &&
            (identical(other.subTotal, subTotal) ||
                const DeepCollectionEquality()
                    .equals(other.subTotal, subTotal)) &&
            (identical(other.userId, userId) ||
                const DeepCollectionEquality().equals(other.userId, userId)) &&
            (identical(other.orderStatus, orderStatus) ||
                const DeepCollectionEquality()
                    .equals(other.orderStatus, orderStatus)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(cartProducts) ^
      const DeepCollectionEquality().hash(date) ^
      const DeepCollectionEquality().hash(totalPrice) ^
      const DeepCollectionEquality().hash(paymentMethod) ^
      const DeepCollectionEquality().hash(orderId) ^
      const DeepCollectionEquality().hash(deliveryAddress) ^
      const DeepCollectionEquality().hash(subTotal) ^
      const DeepCollectionEquality().hash(userId) ^
      const DeepCollectionEquality().hash(orderStatus);

  @JsonKey(ignore: true)
  @override
  _$OrderDataCopyWith<_OrderData> get copyWith =>
      __$OrderDataCopyWithImpl<_OrderData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_OrderDataToJson(this);
  }
}

abstract class _OrderData implements OrderData {
  factory _OrderData(
      {List<CartProduct>? cartProducts,
      DateTime? date,
      double? totalPrice,
      String? paymentMethod,
      String? orderId,
      String? deliveryAddress,
      double? subTotal,
      String? userId,
      int? orderStatus}) = _$_OrderData;

  factory _OrderData.fromJson(Map<String, dynamic> json) =
      _$_OrderData.fromJson;

  @override
  List<CartProduct>? get cartProducts => throw _privateConstructorUsedError;
  @override
  DateTime? get date => throw _privateConstructorUsedError;
  @override
  double? get totalPrice => throw _privateConstructorUsedError;
  @override
  String? get paymentMethod => throw _privateConstructorUsedError;
  @override
  String? get orderId => throw _privateConstructorUsedError;
  @override
  String? get deliveryAddress => throw _privateConstructorUsedError;
  @override
  double? get subTotal => throw _privateConstructorUsedError;
  @override
  String? get userId => throw _privateConstructorUsedError;
  @override
  int? get orderStatus => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$OrderDataCopyWith<_OrderData> get copyWith =>
      throw _privateConstructorUsedError;
}
