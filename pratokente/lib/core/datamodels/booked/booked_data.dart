import 'package:freezed_annotation/freezed_annotation.dart';
part 'booked_data.freezed.dart';
part 'booked_data.g.dart';
// ignore: unused_import

@freezed
class BookedData with _$BookedData {
  //BookData._();
  factory BookedData({
    String? bookId,
    String? date,
    String? time,
    String? restaurantId,
    int? bookStatus,
    int? numPerson,
  }) = _BookedData;

  factory BookedData.fromJson(Map<String, dynamic> json) =>
      _$BookedDataFromJson(json);
}
