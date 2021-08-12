// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'product_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ProductData _$ProductDataFromJson(Map<String, dynamic> json) {
  return _ProductData.fromJson(json);
}

/// @nodoc
class _$ProductDataTearOff {
  const _$ProductDataTearOff();

  _ProductData call(
      {String? category,
      String? description,
      String? id,
      String? images,
      String? name,
      double? price}) {
    return _ProductData(
      category: category,
      description: description,
      id: id,
      images: images,
      name: name,
      price: price,
    );
  }

  ProductData fromJson(Map<String, Object> json) {
    return ProductData.fromJson(json);
  }
}

/// @nodoc
const $ProductData = _$ProductDataTearOff();

/// @nodoc
mixin _$ProductData {
  String? get category => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get id => throw _privateConstructorUsedError;
  String? get images => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  double? get price => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProductDataCopyWith<ProductData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductDataCopyWith<$Res> {
  factory $ProductDataCopyWith(
          ProductData value, $Res Function(ProductData) then) =
      _$ProductDataCopyWithImpl<$Res>;
  $Res call(
      {String? category,
      String? description,
      String? id,
      String? images,
      String? name,
      double? price});
}

/// @nodoc
class _$ProductDataCopyWithImpl<$Res> implements $ProductDataCopyWith<$Res> {
  _$ProductDataCopyWithImpl(this._value, this._then);

  final ProductData _value;
  // ignore: unused_field
  final $Res Function(ProductData) _then;

  @override
  $Res call({
    Object? category = freezed,
    Object? description = freezed,
    Object? id = freezed,
    Object? images = freezed,
    Object? name = freezed,
    Object? price = freezed,
  }) {
    return _then(_value.copyWith(
      category: category == freezed
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      images: images == freezed
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as String?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      price: price == freezed
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
abstract class _$ProductDataCopyWith<$Res>
    implements $ProductDataCopyWith<$Res> {
  factory _$ProductDataCopyWith(
          _ProductData value, $Res Function(_ProductData) then) =
      __$ProductDataCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? category,
      String? description,
      String? id,
      String? images,
      String? name,
      double? price});
}

/// @nodoc
class __$ProductDataCopyWithImpl<$Res> extends _$ProductDataCopyWithImpl<$Res>
    implements _$ProductDataCopyWith<$Res> {
  __$ProductDataCopyWithImpl(
      _ProductData _value, $Res Function(_ProductData) _then)
      : super(_value, (v) => _then(v as _ProductData));

  @override
  _ProductData get _value => super._value as _ProductData;

  @override
  $Res call({
    Object? category = freezed,
    Object? description = freezed,
    Object? id = freezed,
    Object? images = freezed,
    Object? name = freezed,
    Object? price = freezed,
  }) {
    return _then(_ProductData(
      category: category == freezed
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      images: images == freezed
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as String?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      price: price == freezed
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ProductData implements _ProductData {
  _$_ProductData(
      {this.category,
      this.description,
      this.id,
      this.images,
      this.name,
      this.price});

  factory _$_ProductData.fromJson(Map<String, dynamic> json) =>
      _$_$_ProductDataFromJson(json);

  @override
  final String? category;
  @override
  final String? description;
  @override
  final String? id;
  @override
  final String? images;
  @override
  final String? name;
  @override
  final double? price;

  @override
  String toString() {
    return 'ProductData(category: $category, description: $description, id: $id, images: $images, name: $name, price: $price)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ProductData &&
            (identical(other.category, category) ||
                const DeepCollectionEquality()
                    .equals(other.category, category)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)) &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.images, images) ||
                const DeepCollectionEquality().equals(other.images, images)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.price, price) ||
                const DeepCollectionEquality().equals(other.price, price)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(category) ^
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(images) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(price);

  @JsonKey(ignore: true)
  @override
  _$ProductDataCopyWith<_ProductData> get copyWith =>
      __$ProductDataCopyWithImpl<_ProductData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_ProductDataToJson(this);
  }
}

abstract class _ProductData implements ProductData {
  factory _ProductData(
      {String? category,
      String? description,
      String? id,
      String? images,
      String? name,
      double? price}) = _$_ProductData;

  factory _ProductData.fromJson(Map<String, dynamic> json) =
      _$_ProductData.fromJson;

  @override
  String? get category => throw _privateConstructorUsedError;
  @override
  String? get description => throw _privateConstructorUsedError;
  @override
  String? get id => throw _privateConstructorUsedError;
  @override
  String? get images => throw _privateConstructorUsedError;
  @override
  String? get name => throw _privateConstructorUsedError;
  @override
  double? get price => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$ProductDataCopyWith<_ProductData> get copyWith =>
      throw _privateConstructorUsedError;
}
