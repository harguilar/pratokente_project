import 'package:freezed_annotation/freezed_annotation.dart';
part 'user_models.freezed.dart';
part 'user_models.g.dart';

@freezed
class User with _$User {
  //String? defaultAddress,
  User._();
  factory User({
    required String id,
    String? email,
    String? name,
    String? role,
    String? defaultAddress,
  }) = _User;

  bool get hasAddress => defaultAddress?.isNotEmpty ?? false;
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}

@freezed
class Address with _$Address {
  factory Address({
    String? id,
    required String placeId,
    String? street,
    String? state,
    String? city,
    String? postCode,
    required double latitude,
    required double longitude,
    String? postalCode,
  }) = _Address;
  factory Address.fromJson(Map<String, dynamic> json) =>
      _$AddressFromJson(json);
}
