// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'booked_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

BookedData _$BookedDataFromJson(Map<String, dynamic> json) {
  return _BookedData.fromJson(json);
}

/// @nodoc
class _$BookedDataTearOff {
  const _$BookedDataTearOff();

  _BookedData call(
      {String? bookId,
      String? date,
      String? time,
      String? restaurantId,
      int? bookStatus,
      int? numPerson}) {
    return _BookedData(
      bookId: bookId,
      date: date,
      time: time,
      restaurantId: restaurantId,
      bookStatus: bookStatus,
      numPerson: numPerson,
    );
  }

  BookedData fromJson(Map<String, Object> json) {
    return BookedData.fromJson(json);
  }
}

/// @nodoc
const $BookedData = _$BookedDataTearOff();

/// @nodoc
mixin _$BookedData {
  String? get bookId => throw _privateConstructorUsedError;
  String? get date => throw _privateConstructorUsedError;
  String? get time => throw _privateConstructorUsedError;
  String? get restaurantId => throw _privateConstructorUsedError;
  int? get bookStatus => throw _privateConstructorUsedError;
  int? get numPerson => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BookedDataCopyWith<BookedData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BookedDataCopyWith<$Res> {
  factory $BookedDataCopyWith(
          BookedData value, $Res Function(BookedData) then) =
      _$BookedDataCopyWithImpl<$Res>;
  $Res call(
      {String? bookId,
      String? date,
      String? time,
      String? restaurantId,
      int? bookStatus,
      int? numPerson});
}

/// @nodoc
class _$BookedDataCopyWithImpl<$Res> implements $BookedDataCopyWith<$Res> {
  _$BookedDataCopyWithImpl(this._value, this._then);

  final BookedData _value;
  // ignore: unused_field
  final $Res Function(BookedData) _then;

  @override
  $Res call({
    Object? bookId = freezed,
    Object? date = freezed,
    Object? time = freezed,
    Object? restaurantId = freezed,
    Object? bookStatus = freezed,
    Object? numPerson = freezed,
  }) {
    return _then(_value.copyWith(
      bookId: bookId == freezed
          ? _value.bookId
          : bookId // ignore: cast_nullable_to_non_nullable
              as String?,
      date: date == freezed
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String?,
      time: time == freezed
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as String?,
      restaurantId: restaurantId == freezed
          ? _value.restaurantId
          : restaurantId // ignore: cast_nullable_to_non_nullable
              as String?,
      bookStatus: bookStatus == freezed
          ? _value.bookStatus
          : bookStatus // ignore: cast_nullable_to_non_nullable
              as int?,
      numPerson: numPerson == freezed
          ? _value.numPerson
          : numPerson // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
abstract class _$BookedDataCopyWith<$Res> implements $BookedDataCopyWith<$Res> {
  factory _$BookedDataCopyWith(
          _BookedData value, $Res Function(_BookedData) then) =
      __$BookedDataCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? bookId,
      String? date,
      String? time,
      String? restaurantId,
      int? bookStatus,
      int? numPerson});
}

/// @nodoc
class __$BookedDataCopyWithImpl<$Res> extends _$BookedDataCopyWithImpl<$Res>
    implements _$BookedDataCopyWith<$Res> {
  __$BookedDataCopyWithImpl(
      _BookedData _value, $Res Function(_BookedData) _then)
      : super(_value, (v) => _then(v as _BookedData));

  @override
  _BookedData get _value => super._value as _BookedData;

  @override
  $Res call({
    Object? bookId = freezed,
    Object? date = freezed,
    Object? time = freezed,
    Object? restaurantId = freezed,
    Object? bookStatus = freezed,
    Object? numPerson = freezed,
  }) {
    return _then(_BookedData(
      bookId: bookId == freezed
          ? _value.bookId
          : bookId // ignore: cast_nullable_to_non_nullable
              as String?,
      date: date == freezed
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String?,
      time: time == freezed
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as String?,
      restaurantId: restaurantId == freezed
          ? _value.restaurantId
          : restaurantId // ignore: cast_nullable_to_non_nullable
              as String?,
      bookStatus: bookStatus == freezed
          ? _value.bookStatus
          : bookStatus // ignore: cast_nullable_to_non_nullable
              as int?,
      numPerson: numPerson == freezed
          ? _value.numPerson
          : numPerson // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_BookedData implements _BookedData {
  _$_BookedData(
      {this.bookId,
      this.date,
      this.time,
      this.restaurantId,
      this.bookStatus,
      this.numPerson});

  factory _$_BookedData.fromJson(Map<String, dynamic> json) =>
      _$_$_BookedDataFromJson(json);

  @override
  final String? bookId;
  @override
  final String? date;
  @override
  final String? time;
  @override
  final String? restaurantId;
  @override
  final int? bookStatus;
  @override
  final int? numPerson;

  @override
  String toString() {
    return 'BookedData(bookId: $bookId, date: $date, time: $time, restaurantId: $restaurantId, bookStatus: $bookStatus, numPerson: $numPerson)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _BookedData &&
            (identical(other.bookId, bookId) ||
                const DeepCollectionEquality().equals(other.bookId, bookId)) &&
            (identical(other.date, date) ||
                const DeepCollectionEquality().equals(other.date, date)) &&
            (identical(other.time, time) ||
                const DeepCollectionEquality().equals(other.time, time)) &&
            (identical(other.restaurantId, restaurantId) ||
                const DeepCollectionEquality()
                    .equals(other.restaurantId, restaurantId)) &&
            (identical(other.bookStatus, bookStatus) ||
                const DeepCollectionEquality()
                    .equals(other.bookStatus, bookStatus)) &&
            (identical(other.numPerson, numPerson) ||
                const DeepCollectionEquality()
                    .equals(other.numPerson, numPerson)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(bookId) ^
      const DeepCollectionEquality().hash(date) ^
      const DeepCollectionEquality().hash(time) ^
      const DeepCollectionEquality().hash(restaurantId) ^
      const DeepCollectionEquality().hash(bookStatus) ^
      const DeepCollectionEquality().hash(numPerson);

  @JsonKey(ignore: true)
  @override
  _$BookedDataCopyWith<_BookedData> get copyWith =>
      __$BookedDataCopyWithImpl<_BookedData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_BookedDataToJson(this);
  }
}

abstract class _BookedData implements BookedData {
  factory _BookedData(
      {String? bookId,
      String? date,
      String? time,
      String? restaurantId,
      int? bookStatus,
      int? numPerson}) = _$_BookedData;

  factory _BookedData.fromJson(Map<String, dynamic> json) =
      _$_BookedData.fromJson;

  @override
  String? get bookId => throw _privateConstructorUsedError;
  @override
  String? get date => throw _privateConstructorUsedError;
  @override
  String? get time => throw _privateConstructorUsedError;
  @override
  String? get restaurantId => throw _privateConstructorUsedError;
  @override
  int? get bookStatus => throw _privateConstructorUsedError;
  @override
  int? get numPerson => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$BookedDataCopyWith<_BookedData> get copyWith =>
      throw _privateConstructorUsedError;
}
