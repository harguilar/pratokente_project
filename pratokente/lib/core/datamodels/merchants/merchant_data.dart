import 'package:freezed_annotation/freezed_annotation.dart';
part 'merchant_data.freezed.dart';
part 'merchant_data.g.dart';

@freezed
class MerchantData with _$MerchantData {
  factory MerchantData({
    // String? deliveryFee,
    //DateTime? times,
    required int rating,
    required int numberOfRatings,
    required String id,
    required String image,
    required String name,
    required List<dynamic>? categories,
  }) = _MerchantData;

  factory MerchantData.fromJson(Map<String, dynamic> json) =>
      _$MerchantDataFromJson(json);
}
