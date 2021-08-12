// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_User _$_$_UserFromJson(Map<String, dynamic> json) {
  return _$_User(
    id: json['id'] as String,
    email: json['email'] as String?,
    name: json['name'] as String?,
    role: json['role'] as String?,
    defaultAddress: json['defaultAddress'] as String?,
  );
}

Map<String, dynamic> _$_$_UserToJson(_$_User instance) => <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'name': instance.name,
      'role': instance.role,
      'defaultAddress': instance.defaultAddress,
    };

_$_Address _$_$_AddressFromJson(Map<String, dynamic> json) {
  return _$_Address(
    id: json['id'] as String?,
    placeId: json['placeId'] as String,
    street: json['street'] as String?,
    state: json['state'] as String?,
    city: json['city'] as String?,
    postCode: json['postCode'] as String?,
    latitude: (json['latitude'] as num).toDouble(),
    longitude: (json['longitude'] as num).toDouble(),
    postalCode: json['postalCode'] as String?,
  );
}

Map<String, dynamic> _$_$_AddressToJson(_$_Address instance) =>
    <String, dynamic>{
      'id': instance.id,
      'placeId': instance.placeId,
      'street': instance.street,
      'state': instance.state,
      'city': instance.city,
      'postCode': instance.postCode,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'postalCode': instance.postalCode,
    };
