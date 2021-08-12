import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'merchant_data.freezed.dart';
part 'merchant_data.g.dart';

@freezed
class MerchantData with _$MerchantData {
  factory MerchantData({
    String? deliveryFee,
    DateTime? times,
    String? rating,
    int? numRatings,
    String? id,
    String? images,
    String? name,
    String? category,
  }) = _MerchantData;

  factory MerchantData.fromJson(Map<String, dynamic> json) =>
      _$MerchantDataFromJson(json);
}
