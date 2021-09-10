// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'merchant_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MerchantData _$MerchantDataFromJson(Map<String, dynamic> json) {
  return _MerchantData.fromJson(json);
}

/// @nodoc
class _$MerchantDataTearOff {
  const _$MerchantDataTearOff();

  _MerchantData call(
      {int? rating,
      int? numberOfRatings,
      String? image,
      String? name,
      List<String>? categories}) {
    return _MerchantData(
      rating: rating,
      numberOfRatings: numberOfRatings,
      image: image,
      name: name,
      categories: categories,
    );
  }

  MerchantData fromJson(Map<String, Object> json) {
    return MerchantData.fromJson(json);
  }
}

/// @nodoc
const $MerchantData = _$MerchantDataTearOff();

/// @nodoc
mixin _$MerchantData {
// String? deliveryFee,
//DateTime? times,
  int? get rating => throw _privateConstructorUsedError;
  int? get numberOfRatings => throw _privateConstructorUsedError; //String? id,
  String? get image => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  List<String>? get categories => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MerchantDataCopyWith<MerchantData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MerchantDataCopyWith<$Res> {
  factory $MerchantDataCopyWith(
          MerchantData value, $Res Function(MerchantData) then) =
      _$MerchantDataCopyWithImpl<$Res>;
  $Res call(
      {int? rating,
      int? numberOfRatings,
      String? image,
      String? name,
      List<String>? categories});
}

/// @nodoc
class _$MerchantDataCopyWithImpl<$Res> implements $MerchantDataCopyWith<$Res> {
  _$MerchantDataCopyWithImpl(this._value, this._then);

  final MerchantData _value;
  // ignore: unused_field
  final $Res Function(MerchantData) _then;

  @override
  $Res call({
    Object? rating = freezed,
    Object? numberOfRatings = freezed,
    Object? image = freezed,
    Object? name = freezed,
    Object? categories = freezed,
  }) {
    return _then(_value.copyWith(
      rating: rating == freezed
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as int?,
      numberOfRatings: numberOfRatings == freezed
          ? _value.numberOfRatings
          : numberOfRatings // ignore: cast_nullable_to_non_nullable
              as int?,
      image: image == freezed
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      categories: categories == freezed
          ? _value.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc
abstract class _$MerchantDataCopyWith<$Res>
    implements $MerchantDataCopyWith<$Res> {
  factory _$MerchantDataCopyWith(
          _MerchantData value, $Res Function(_MerchantData) then) =
      __$MerchantDataCopyWithImpl<$Res>;
  @override
  $Res call(
      {int? rating,
      int? numberOfRatings,
      String? image,
      String? name,
      List<String>? categories});
}

/// @nodoc
class __$MerchantDataCopyWithImpl<$Res> extends _$MerchantDataCopyWithImpl<$Res>
    implements _$MerchantDataCopyWith<$Res> {
  __$MerchantDataCopyWithImpl(
      _MerchantData _value, $Res Function(_MerchantData) _then)
      : super(_value, (v) => _then(v as _MerchantData));

  @override
  _MerchantData get _value => super._value as _MerchantData;

  @override
  $Res call({
    Object? rating = freezed,
    Object? numberOfRatings = freezed,
    Object? image = freezed,
    Object? name = freezed,
    Object? categories = freezed,
  }) {
    return _then(_MerchantData(
      rating: rating == freezed
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as int?,
      numberOfRatings: numberOfRatings == freezed
          ? _value.numberOfRatings
          : numberOfRatings // ignore: cast_nullable_to_non_nullable
              as int?,
      image: image == freezed
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      categories: categories == freezed
          ? _value.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MerchantData implements _MerchantData {
  _$_MerchantData(
      {this.rating,
      this.numberOfRatings,
      this.image,
      this.name,
      this.categories});

  factory _$_MerchantData.fromJson(Map<String, dynamic> json) =>
      _$_$_MerchantDataFromJson(json);

  @override // String? deliveryFee,
//DateTime? times,
  final int? rating;
  @override
  final int? numberOfRatings;
  @override //String? id,
  final String? image;
  @override
  final String? name;
  @override
  final List<String>? categories;

  @override
  String toString() {
    return 'MerchantData(rating: $rating, numberOfRatings: $numberOfRatings, image: $image, name: $name, categories: $categories)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _MerchantData &&
            (identical(other.rating, rating) ||
                const DeepCollectionEquality().equals(other.rating, rating)) &&
            (identical(other.numberOfRatings, numberOfRatings) ||
                const DeepCollectionEquality()
                    .equals(other.numberOfRatings, numberOfRatings)) &&
            (identical(other.image, image) ||
                const DeepCollectionEquality().equals(other.image, image)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.categories, categories) ||
                const DeepCollectionEquality()
                    .equals(other.categories, categories)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(rating) ^
      const DeepCollectionEquality().hash(numberOfRatings) ^
      const DeepCollectionEquality().hash(image) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(categories);

  @JsonKey(ignore: true)
  @override
  _$MerchantDataCopyWith<_MerchantData> get copyWith =>
      __$MerchantDataCopyWithImpl<_MerchantData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_MerchantDataToJson(this);
  }
}

abstract class _MerchantData implements MerchantData {
  factory _MerchantData(
      {int? rating,
      int? numberOfRatings,
      String? image,
      String? name,
      List<String>? categories}) = _$_MerchantData;

  factory _MerchantData.fromJson(Map<String, dynamic> json) =
      _$_MerchantData.fromJson;

  @override // String? deliveryFee,
//DateTime? times,
  int? get rating => throw _privateConstructorUsedError;
  @override
  int? get numberOfRatings => throw _privateConstructorUsedError;
  @override //String? id,
  String? get image => throw _privateConstructorUsedError;
  @override
  String? get name => throw _privateConstructorUsedError;
  @override
  List<String>? get categories => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$MerchantDataCopyWith<_MerchantData> get copyWith =>
      throw _privateConstructorUsedError;
}
