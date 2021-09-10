import 'package:freezed_annotation/freezed_annotation.dart';
part 'merchant_data.freezed.dart';
part 'merchant_data.g.dart';

@freezed
class MerchantData with _$MerchantData {
  factory MerchantData({
    // String? deliveryFee,
    //DateTime? times,
    int? rating,
    int? numberOfRatings,
    //String? id,
    String? image,
    String? name,
    List<String>? categories,
  }) = _MerchantData;

  factory MerchantData.fromJson(Map<String, dynamic> json) =>
      _$MerchantDataFromJson(json);
}
