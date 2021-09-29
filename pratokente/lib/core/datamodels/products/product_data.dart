import 'package:freezed_annotation/freezed_annotation.dart';
part 'product_data.freezed.dart';
part 'product_data.g.dart';

@freezed
class ProductData with _$ProductData {
  factory ProductData({
    String? category,
    String? description,
    String? id,
    String? image,
    String? name,
    double? price,
  }) = _ProductData;

  factory ProductData.fromJson(Map<String, dynamic> json) =>
      _$ProductDataFromJson(json);
}
