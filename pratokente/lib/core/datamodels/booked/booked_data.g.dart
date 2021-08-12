// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'booked_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_BookedData _$_$_BookedDataFromJson(Map<String, dynamic> json) {
  return _$_BookedData(
    bookId: json['bookId'] as String?,
    date: json['date'] as String?,
    time: json['time'] as String?,
    restaurantId: json['restaurantId'] as String?,
    bookStatus: json['bookStatus'] as int?,
    numPerson: json['numPerson'] as int?,
  );
}

Map<String, dynamic> _$_$_BookedDataToJson(_$_BookedData instance) =>
    <String, dynamic>{
      'bookId': instance.bookId,
      'date': instance.date,
      'time': instance.time,
      'restaurantId': instance.restaurantId,
      'bookStatus': instance.bookStatus,
      'numPerson': instance.numPerson,
    };
