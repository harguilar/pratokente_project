import 'package:freezed_annotation/freezed_annotation.dart';
part 'support_message.freezed.dart';
part 'support_message.g.dart';

@freezed
class SupportMessage with _$SupportMessage {
  factory SupportMessage({
    required String id,
    String? senderEmail,
    String? senderName,
    String? senderMgs,
    DateTime? dateSent,
  }) = _SupportMessage;

  factory SupportMessage.fromJson(Map<String, dynamic> json) =>
      _$SupportMessageFromJson(json);
}
