import 'dart:async';
import 'package:pratokente/apis/firestore_api.dart';
import 'package:pratokente/app/app.locator.dart';
import 'package:pratokente/app/app.logger.dart';
import 'package:pratokente/core/datamodels/merchants/merchant_data.dart';

class MerchantsService {
  final log = getLogger('MerchantsService');

  final _firestoreApi = locator<FirestoreApi>();

  Future<List<MerchantData>?> getMerchants() async {
    final _merchants = await _firestoreApi.getMerchants();
    log.v('this is the list of your Merchants $_merchants');
    return _merchants!;
  }
}
