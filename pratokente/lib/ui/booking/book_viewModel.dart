import 'package:intl/intl.dart';
import 'package:pratokente/app/app.locator.dart';
import 'package:pratokente/app/app.router.dart';
import 'package:pratokente/core/datamodels/booked/booked_data.dart';
import 'package:pratokente/core/datamodels/merchants/merchant_data.dart';
import 'package:pratokente/core/services/products/product_service.dart';

//import 'package:cloud_firestore/src/utils/auto_id_generator.dart';
//import 'package:pratokente/injections/locator.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class BookViewModel extends FormViewModel {
  final _snackbarService = locator<SnackbarService>();

  final ProductService _productService = locator<ProductService>();
  final _navigationService = locator<NavigationService>();

  String? timeOfDayMinutes;
  String? timeofDayHours;

  BookViewModel({this.timeOfDayMinutes, this.timeofDayHours});

  int _count = 1;

  //final bookedRef = FirebaseFirestore.instance.collection('booked');

  get getBookReference => _productService.getBookReference();
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

  void initState() {
    Intl.defaultLocale = 'pt_BR';
    //_initialValue = DateTime.now().toString();
    String lsHour = timeofDayHours!;

    String lsMinute = timeOfDayMinutes!;

    //_controller3 = TextEditingController(text: DateTime.now().toString());

    //_controller4 = TextEditingController(text: '$lsHour:$lsMinute');

    _getValue();
  }

  Future<void> _getValue() async {
    await Future.delayed(const Duration(seconds: 3), () {
      setBusy(true);
      String lstHour = timeofDayHours!;
      String lstMinute = timeOfDayMinutes!;
      //  _controller3!.text = DateTime.now().month.toString();
      //_controller4!.text = lstHour + ':' + lstMinute;
      setBusy(false);
      notifyListeners();
    });
  }

  void saveBookingInfo({BookedData? makeBooking}) {
    _productService.addBookingInfo(makeBooking!);
    _snackbarService.showSnackbar(
        message: 'Agendamento Socitado com Sucesso !!!');
    _navigationService.replaceWith(Routes.merchantViewList);
  }

  MerchantData get getMerchantData => _productService.getMerchantData!;

  @override
  void setFormStatus() {
    // TODO: implement setFormStatus
  }
}
