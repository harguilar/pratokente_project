// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'merchant_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MerchantData _$_$_MerchantDataFromJson(Map<String, dynamic> json) {
  return _$_MerchantData(
    rating: json['rating'] as int?,
    numberOfRatings: json['numberOfRatings'] as int?,
    image: json['image'] as String?,
    name: json['name'] as String?,
    categories: (json['categories'] as List<dynamic>?)
        ?.map((e) => e as String)
        .toList(),
  );
}

Map<String, dynamic> _$_$_MerchantDataToJson(_$_MerchantData instance) =>
    <String, dynamic>{
      'rating': instance.rating,
      'numberOfRatings': instance.numberOfRatings,
      'image': instance.image,
      'name': instance.name,
      'categories': instance.categories,
    };
