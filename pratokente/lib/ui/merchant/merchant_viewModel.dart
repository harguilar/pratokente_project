import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pratokente/apis/firestore_api.dart';
import 'package:pratokente/app/app.locator.dart';
import 'package:pratokente/app/app.router.dart';
import 'package:pratokente/core/datamodels/merchants/merchant_data.dart';
import 'package:pratokente/core/services/local_storage_service.dart';
import 'package:pratokente/core/services/merchants/merchants_services.dart';
import 'package:pratokente/core/services/product_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class MerchantsViewModel extends BaseViewModel {
  final _firestoreApi = locator<FirestoreApi>();
  final _merchantService = locator<MerchantsService>();
  final _productService = locator<ProductService>();
  final _navigationService = locator<NavigationService>();
  final _localStorage = locator<LocalStorageService>();
  final bookedRef = FirebaseFirestore.instance.collection('booked');
  // var _listMerchant;

  //StreamController _merchantsController = StreamController.broadcast();
  StreamSubscription? _merchantStreamSubscription;

  final scrollController = ScrollController();

  double? height;
  MerchantsViewModel({this.height});

  List<MerchantData>? _merchants = [];

  List<MerchantData>? get getMerchants => _merchants!;

  void listenToMerchants() {
    setBusy(true);
    _merchantStreamSubscription =
        _firestoreApi.listenToMerchantsRealTime().listen((merchantsData) {
      List<MerchantData> merchants = merchantsData;
      if ((merchants != null) && (merchants.length > 0)) {
        _merchants = merchants;
        _localStorage.saveMerchantToDisk(content: _merchants);
        notifyListeners();
      }
      setBusy(false);
    });
  }

  void setToMerchants({required MerchantData merchantData}) {
    _productService.setMerchantData(merchantData: merchantData);
  }

  Future fetchMerchants() async {
    setBusy(true);
    scrollController.addListener(scrollListener);

    await _merchantService.fetchAllMerchants();

    _merchants = _merchantService.merchants;

    setBusy(false);

    notifyListeners();
  }

  void navToProductByMerchant() {
    //_merchantStreamSubscription!.cancel();
    //Harguilar Commented
    _navigationService.navigateTo(Routes.getProuctByMerchantView);

    //  _amplitudeRouteObserver.routePush(currentRoute: ProfViewRoute);
  }

  void navToBookView({required MerchantData merchantData}) {
    _navigationService.navigateTo(Routes.bookView);

    _productService.setMerchantData(merchantData: merchantData);
    //  _amplitudeRouteObserver.routePush(currentRoute: ProfViewRoute);
  }

  void requestMoreMerchants() => _firestoreApi.requestMoreData();

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  void scrollListener() {
    if (scrollController.offset >=
            scrollController.position.maxScrollExtent / 2 &&
        !scrollController.position.outOfRange) {
      if (_merchantService.hasMoreMerchants) {
        fetchMerchants();
      }
    }
  }
}
