import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pratokente/apis/firestore_api.dart';
import 'package:pratokente/app/app.locator.dart';
import 'package:pratokente/app/app.logger.dart';
import 'package:pratokente/constants/constants.dart';
import 'package:pratokente/core/datamodels/merchants/merchant_data.dart';
import 'package:pratokente/expections/merchants_services_expections.dart';

class MerchantsService {
  final log = getLogger('MerchantsService');

  final _firestoreApi = locator<FirestoreApi>();

  final _merchantDocumentSnap = <DocumentSnapshot>[];

  int documentLimit = 10;

  bool _hasMoreMerchants = true;

  bool _fetchMerchants = false;

  Future<QuerySnapshot?> getMerchants(
      {required int documentLimit, DocumentSnapshot? startAfter}) async {
    try {
      final _merchants = await _firestoreApi.getMerchants(
          documentLimit: documentLimit, startAfter: startAfter);
      log.v('this is the list of your Merchants $_merchants');
      return _merchants;
    } catch (e) {
      throw MerchantsServicesExceptions(
        message: 'Failed to get the Data: $e',
        devDetails: '$e',
      );
    }
  }

  bool get getHasMoreMerchants => _hasMoreMerchants;

  Future<QuerySnapshot?> fetchMerchants(
      {required int documentLimit, DocumentSnapshot? startAfter}) async {
    try {
      final _merchants =
          await merchantsReference.orderBy('name').limit(documentLimit);

      if (startAfter == null) {
        return _merchants.get();
      } else {
        return _merchants.startAfterDocument(startAfter).get();
      }
    } catch (e) {
      throw MerchantsServicesExceptions(
          message: 'Your Query Snapshot failed $e', devDetails: '$e');
    }
  }

  //bool get hasMoreMerchants => _hasMoreMerchants;

  List<MerchantData>? get merchants => _merchantDocumentSnap.map((docs) {
        final _merchants = docs.data();
        return MerchantData(
          name: _merchants!['name'],
          rating: _merchants['rating'],
          numberOfRatings: _merchants['numberOfRatings'],
          id: _merchants['id'],
          image: _merchants['image'],
          categories: _merchants['categories'],
        );
      }).toList();

  Future fetchAllMerchants() async {
    try {
      if (_fetchMerchants) return;

      _fetchMerchants = true;

      final _snapShot = await fetchMerchants(
          documentLimit: documentLimit,
          startAfter: _merchantDocumentSnap.isNotEmpty
              ? _merchantDocumentSnap.last
              : null);
      _merchantDocumentSnap.addAll(_snapShot!.docs);

      if (_snapShot.docs.length < documentLimit) _hasMoreMerchants = false;
      // notifyListeners();
      _fetchMerchants = false;
    } catch (e) {
      throw MerchantsServicesExceptions(
          message: 'Was Not able to fetchAllMerchants $e', devDetails: '$e');
    }
  }
}
