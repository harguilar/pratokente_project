import 'package:flutter/widgets.dart';
import 'package:pratokente/apis/firestore_api.dart';
import 'package:pratokente/app/app.locator.dart';
import 'package:pratokente/core/datamodels/merchants/merchant_data.dart';
import 'package:pratokente/core/services/merchants/merchants_services.dart';
import 'package:stacked/stacked.dart';
import 'package:universal_html/js.dart';

class MerchantsViewModel extends BaseViewModel {
  final _firestoreApi = locator<FirestoreApi>();
  final _merchantService = locator<MerchantsService>();
  ScrollController scrollController = ScrollController();

  double? height;
  MerchantsViewModel({this.height});

  List<MerchantData>? _merchants = [];

  List<MerchantData>? get getMerchants => _merchants!;

  void listenToMerchants() {
    setBusy(true);
    _firestoreApi.listenToMerchantsRealTime().listen((merchantsData) {
      List<MerchantData> merchants = merchantsData;
      if ((merchants != null) && (merchants.length > 0)) {
        _merchants = merchants;
        notifyListeners();
      }
      setBusy(false);
    });
/*     scrollController.addListener(() {
      double maxScroll = scrollController.position.maxScrollExtent;
      double currentScroll = scrollController.position.pixels;
      double delta = height! * 0.25;
      if (maxScroll - currentScroll < delta) {
        requestMoreData();
      }
    }); */
  }

  void navToProductByMerchant() {
    //Harguilar Commented
    //_navigationService.navigateTo(Routes.getProuctByMerchantView);

    //  _amplitudeRouteObserver.routePush(currentRoute: ProfViewRoute);
  }

  void navToBookView() {
    // _navigationService.navigateTo(Routes.bookView);
    //  _amplitudeRouteObserver.routePush(currentRoute: ProfViewRoute);
  }

  void requestMoreData() => _firestoreApi.requestMoreData();
}
