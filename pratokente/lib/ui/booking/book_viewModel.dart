import 'package:pratokente/app/app.locator.dart';
import 'package:pratokente/app/app.router.dart';
import 'package:pratokente/core/datamodels/booked/booked_data.dart';
import 'package:pratokente/core/datamodels/merchants/merchant_data.dart';
import 'package:pratokente/core/services/product_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

//import 'package:cloud_firestore/src/utils/auto_id_generator.dart';
//import 'package:pratokente/injections/locator.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class BookViewModel extends BaseViewModel {
  final _snackbarService = locator<SnackbarService>();

  final ProductService _productService = locator<ProductService>();
  final _navigationService = locator<NavigationService>();

  int _count = 1;

  final bookedRef = FirebaseFirestore.instance.collection('booked');

  int get quantity => _count;

  // MerchantData? get getMerchantData => _productService.getMerchantData;

  int increment() {
    _count++;
    notifyListeners();
    return _count;
  }

  int decrement() {
    try {
      if (_count > 1) {
        _count--;
      }
    } catch (err) {
      print(err.toString());
    }
    notifyListeners();
    return _count;
  }

  void saveBookingInfo({BookedData? makeBooking}) {
    _productService.addBookingInfo(makeBooking!);
    _snackbarService.showSnackbar(
        message: 'Agendamento Socitado com Sucesso !!!');
    _navigationService.replaceWith(Routes.merchantView);
  }

  MerchantData get getMerchantData => _productService.getMerchantData!;
}
