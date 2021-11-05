import 'dart:async';
import 'package:flutter/material.dart';
import 'package:pratokente/apis/firestore_api.dart';
import 'package:pratokente/app/app.locator.dart';
import 'package:pratokente/app/app.router.dart';
import 'package:pratokente/core/datamodels/merchants/merchant_data.dart';
import 'package:pratokente/core/services/merchants/merchants_services.dart';
import 'package:pratokente/core/services/products/product_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class MerchantsViewModel extends BaseViewModel {
  final _firestoreApi = locator<FirestoreApi>();
  final _merchantService = locator<MerchantsService>();
  final _productService = locator<ProductService>();
  final _navigationService = locator<NavigationService>();
  final VoidCallback? scrollControllerCallFunction;
  var scrollController;

  double? offset;
  double? maxScrollExtent;
  bool? verifyScroll;

  MerchantsViewModel(
      {this.scrollControllerCallFunction,
      this.scrollController,
      this.verifyScroll,
      this.offset,
      this.maxScrollExtent});

  List<MerchantData>? _merchants = [];

  List<MerchantData>? get getMerchants => _merchants!;

  void setToMerchants({required MerchantData merchantData}) {
    _productService.setMerchantData(merchantData: merchantData);
  }

  bool get getHasMoreMerchants => _merchantService.getHasMoreMerchants;

  Future fetchMerchants() async {
    //scrollController.addListener(scrollControllerCallFunction);
    setBusy(true);
    await _merchantService.fetchAllMerchants();
    _merchants = _merchantService.merchants;
    setBusy(false);
    notifyListeners();
  }

  void navToProductByMerchant() {
    //_merchantStreamSubscription!.cancel();
    _navigationService.navigateTo(Routes.getProuctByMerchantView);
  }

  void navToBookView({required MerchantData merchantData}) {
    _productService.setMerchantData(merchantData: merchantData);

    _navigationService.navigateTo(Routes.restaurantBookView);

    ;
    //  _amplitudeRouteObserver.routePush(currentRoute: ProfViewRoute);
  }

  void requestMoreMerchants() => _firestoreApi.requestMoreData();

/*   @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }


  scrollListener() {
    if (scrollController.offset >=
            scrollController.position.maxScrollExtent / 2 &&
        !scrollController.position.outOfRange) {
      if (_merchantService.hasMoreMerchants) {
        fetchMerchants();
        notifyListeners();
      }
    }
  } */
}
