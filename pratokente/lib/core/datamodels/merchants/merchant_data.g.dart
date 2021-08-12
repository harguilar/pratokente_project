// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'merchant_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MerchantData _$_$_MerchantDataFromJson(Map<String, dynamic> json) {
  return _$_MerchantData(
    deliveryFee: json['deliveryFee'] as String?,
    times:
        json['times'] == null ? null : DateTime.parse(json['times'] as String),
    rating: json['rating'] as String?,
    numRatings: json['numRatings'] as int?,
    id: json['id'] as String?,
    images: json['images'] as String?,
    name: json['name'] as String?,
    category: json['category'] as String?,
  );
}

Map<String, dynamic> _$_$_MerchantDataToJson(_$_MerchantData instance) =>
    <String, dynamic>{
      'deliveryFee': instance.deliveryFee,
      'times': instance.times?.toIso8601String(),
      'rating': instance.rating,
      'numRatings': instance.numRatings,
      'id': instance.id,
      'images': instance.images,
      'name': instance.name,
      'category': instance.category,
    };
