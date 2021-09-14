// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'support_message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SupportMessage _$_$_SupportMessageFromJson(Map<String, dynamic> json) {
  return _$_SupportMessage(
    id: json['id'] as String,
    senderEmail: json['senderEmail'] as String?,
    senderName: json['senderName'] as String?,
    senderMgs: json['senderMgs'] as String?,
    dateSent: json['dateSent'] == null
        ? null
        : DateTime.parse(json['dateSent'] as String),
  );
}

Map<String, dynamic> _$_$_SupportMessageToJson(_$_SupportMessage instance) =>
    <String, dynamic>{
      'id': instance.id,
      'senderEmail': instance.senderEmail,
      'senderName': instance.senderName,
      'senderMgs': instance.senderMgs,
      'dateSent': instance.dateSent?.toIso8601String(),
    };
