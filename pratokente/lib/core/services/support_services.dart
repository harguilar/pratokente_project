/* import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:pratokente/core/datamodels/support_message/support_message_data.dart';

class SupportService {
  final CollectionReference _supportCollectionReference =
      FirebaseFirestore.instance.collection("supportMessages");

  sendMessage(SupportMessageData supportMessage) async {
    try {
      await _supportCollectionReference.add(supportMessage.toJson());
    } catch (e) {
      debugPrint(e.toString());
    }
  }
} */
