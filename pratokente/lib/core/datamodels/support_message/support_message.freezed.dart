// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'support_message.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SupportMessage _$SupportMessageFromJson(Map<String, dynamic> json) {
  return _SupportMessage.fromJson(json);
}

/// @nodoc
class _$SupportMessageTearOff {
  const _$SupportMessageTearOff();

  _SupportMessage call(
      {required String id,
      String? senderEmail,
      String? senderName,
      String? senderMgs,
      DateTime? dateSent}) {
    return _SupportMessage(
      id: id,
      senderEmail: senderEmail,
      senderName: senderName,
      senderMgs: senderMgs,
      dateSent: dateSent,
    );
  }

  SupportMessage fromJson(Map<String, Object> json) {
    return SupportMessage.fromJson(json);
  }
}

/// @nodoc
const $SupportMessage = _$SupportMessageTearOff();

/// @nodoc
mixin _$SupportMessage {
  String get id => throw _privateConstructorUsedError;
  String? get senderEmail => throw _privateConstructorUsedError;
  String? get senderName => throw _privateConstructorUsedError;
  String? get senderMgs => throw _privateConstructorUsedError;
  DateTime? get dateSent => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SupportMessageCopyWith<SupportMessage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SupportMessageCopyWith<$Res> {
  factory $SupportMessageCopyWith(
          SupportMessage value, $Res Function(SupportMessage) then) =
      _$SupportMessageCopyWithImpl<$Res>;
  $Res call(
      {String id,
      String? senderEmail,
      String? senderName,
      String? senderMgs,
      DateTime? dateSent});
}

/// @nodoc
class _$SupportMessageCopyWithImpl<$Res>
    implements $SupportMessageCopyWith<$Res> {
  _$SupportMessageCopyWithImpl(this._value, this._then);

  final SupportMessage _value;
  // ignore: unused_field
  final $Res Function(SupportMessage) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? senderEmail = freezed,
    Object? senderName = freezed,
    Object? senderMgs = freezed,
    Object? dateSent = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      senderEmail: senderEmail == freezed
          ? _value.senderEmail
          : senderEmail // ignore: cast_nullable_to_non_nullable
              as String?,
      senderName: senderName == freezed
          ? _value.senderName
          : senderName // ignore: cast_nullable_to_non_nullable
              as String?,
      senderMgs: senderMgs == freezed
          ? _value.senderMgs
          : senderMgs // ignore: cast_nullable_to_non_nullable
              as String?,
      dateSent: dateSent == freezed
          ? _value.dateSent
          : dateSent // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
abstract class _$SupportMessageCopyWith<$Res>
    implements $SupportMessageCopyWith<$Res> {
  factory _$SupportMessageCopyWith(
          _SupportMessage value, $Res Function(_SupportMessage) then) =
      __$SupportMessageCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      String? senderEmail,
      String? senderName,
      String? senderMgs,
      DateTime? dateSent});
}

/// @nodoc
class __$SupportMessageCopyWithImpl<$Res>
    extends _$SupportMessageCopyWithImpl<$Res>
    implements _$SupportMessageCopyWith<$Res> {
  __$SupportMessageCopyWithImpl(
      _SupportMessage _value, $Res Function(_SupportMessage) _then)
      : super(_value, (v) => _then(v as _SupportMessage));

  @override
  _SupportMessage get _value => super._value as _SupportMessage;

  @override
  $Res call({
    Object? id = freezed,
    Object? senderEmail = freezed,
    Object? senderName = freezed,
    Object? senderMgs = freezed,
    Object? dateSent = freezed,
  }) {
    return _then(_SupportMessage(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      senderEmail: senderEmail == freezed
          ? _value.senderEmail
          : senderEmail // ignore: cast_nullable_to_non_nullable
              as String?,
      senderName: senderName == freezed
          ? _value.senderName
          : senderName // ignore: cast_nullable_to_non_nullable
              as String?,
      senderMgs: senderMgs == freezed
          ? _value.senderMgs
          : senderMgs // ignore: cast_nullable_to_non_nullable
              as String?,
      dateSent: dateSent == freezed
          ? _value.dateSent
          : dateSent // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SupportMessage implements _SupportMessage {
  _$_SupportMessage(
      {required this.id,
      this.senderEmail,
      this.senderName,
      this.senderMgs,
      this.dateSent});

  factory _$_SupportMessage.fromJson(Map<String, dynamic> json) =>
      _$_$_SupportMessageFromJson(json);

  @override
  final String id;
  @override
  final String? senderEmail;
  @override
  final String? senderName;
  @override
  final String? senderMgs;
  @override
  final DateTime? dateSent;

  @override
  String toString() {
    return 'SupportMessage(id: $id, senderEmail: $senderEmail, senderName: $senderName, senderMgs: $senderMgs, dateSent: $dateSent)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _SupportMessage &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.senderEmail, senderEmail) ||
                const DeepCollectionEquality()
                    .equals(other.senderEmail, senderEmail)) &&
            (identical(other.senderName, senderName) ||
                const DeepCollectionEquality()
                    .equals(other.senderName, senderName)) &&
            (identical(other.senderMgs, senderMgs) ||
                const DeepCollectionEquality()
                    .equals(other.senderMgs, senderMgs)) &&
            (identical(other.dateSent, dateSent) ||
                const DeepCollectionEquality()
                    .equals(other.dateSent, dateSent)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(senderEmail) ^
      const DeepCollectionEquality().hash(senderName) ^
      const DeepCollectionEquality().hash(senderMgs) ^
      const DeepCollectionEquality().hash(dateSent);

  @JsonKey(ignore: true)
  @override
  _$SupportMessageCopyWith<_SupportMessage> get copyWith =>
      __$SupportMessageCopyWithImpl<_SupportMessage>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_SupportMessageToJson(this);
  }
}

abstract class _SupportMessage implements SupportMessage {
  factory _SupportMessage(
      {required String id,
      String? senderEmail,
      String? senderName,
      String? senderMgs,
      DateTime? dateSent}) = _$_SupportMessage;

  factory _SupportMessage.fromJson(Map<String, dynamic> json) =
      _$_SupportMessage.fromJson;

  @override
  String get id => throw _privateConstructorUsedError;
  @override
  String? get senderEmail => throw _privateConstructorUsedError;
  @override
  String? get senderName => throw _privateConstructorUsedError;
  @override
  String? get senderMgs => throw _privateConstructorUsedError;
  @override
  DateTime? get dateSent => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$SupportMessageCopyWith<_SupportMessage> get copyWith =>
      throw _privateConstructorUsedError;
}
