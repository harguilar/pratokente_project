import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pratokente/apis/firestore_api.dart';
import 'package:pratokente/app/app.locator.dart';
import 'package:pratokente/app/app.router.dart';
import 'package:pratokente/core/datamodels/merchants/merchant_data.dart';
import 'package:pratokente/core/datamodels/products/product_data.dart';
import 'package:pratokente/core/services/merchants/merchants_services.dart';
import 'package:pratokente/core/services/products/product_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ProductsViewModel extends BaseViewModel {
  final _firestoreApi = locator<FirestoreApi>();
  final _merchantService = locator<MerchantsService>();
  final _productService = locator<ProductService>();
  final _navigationService = locator<NavigationService>();
  final bookedRef = FirebaseFirestore.instance.collection('booked');
  // var _listMerchant;

  //final scrollController = ScrollController();

  var scrollController;

  double? height;
  ProductsViewModel({this.height, this.scrollController});

  List<ProductData>? _products = [];

  List<ProductData>? get getProducts => _products!;

  void setToMerchants({required MerchantData merchantData}) {
    _productService.setMerchantData(merchantData: merchantData);
  }

  MerchantData? get getMerchantData => _productService.getMerchantData!;

  Future fetchProducts() async {
    setBusy(true);
    scrollController.addListener(scrollListener);

    await _productService.fetchAllProducts();

    _products = _productService.getProducts;

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
    // _navigationService.navigateTo(Routes.bookView);

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
      if (_productService.hasMoreProducts) {
        fetchProducts();
      }
    }
  }
}
