// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ProductData _$_$_ProductDataFromJson(Map<String, dynamic> json) {
  return _$_ProductData(
    category: json['category'] as String?,
    description: json['description'] as String?,
    id: json['id'] as String?,
    images: json['images'] as String?,
    name: json['name'] as String?,
    price: (json['price'] as num?)?.toDouble(),
  );
}

Map<String, dynamic> _$_$_ProductDataToJson(_$_ProductData instance) =>
    <String, dynamic>{
      'category': instance.category,
      'description': instance.description,
      'id': instance.id,
      'images': instance.images,
      'name': instance.name,
      'price': instance.price,
    };
