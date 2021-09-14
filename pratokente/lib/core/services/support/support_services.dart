import 'package:flutter/cupertino.dart';
import 'package:pratokente/constants/constants.dart';
import 'package:pratokente/core/datamodels/support_message/support_message.dart';

class SupportService {
  sendMessage(SupportMessage supportMessage) async {
    try {
      await supportCollectionReference.add(supportMessage.toJson());
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
