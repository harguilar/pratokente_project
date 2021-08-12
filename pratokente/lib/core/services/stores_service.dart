/*
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pratokente/core/datamodels/store_data.dart';

class StoresService {
  final CollectionReference _storesCollectionReference =
      FirebaseFirestore.instance.collection('stores');

  Future<List<StoreData>> fetchStores() async {
    QuerySnapshot qShot = await _storesCollectionReference.get();

    return qShot.docs.map((doc) => StoreData.fromDocument(doc)).toList();
  }
}

*/
