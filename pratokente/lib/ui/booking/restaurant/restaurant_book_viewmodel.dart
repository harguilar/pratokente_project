import 'package:flutter/material.dart';
import 'package:pratokente/app/app.locator.dart';
import 'package:pratokente/app/app.logger.dart';
import 'package:pratokente/app/app.router.dart';
import 'package:pratokente/core/datamodels/booked/booked_data.dart';
import 'package:pratokente/core/datamodels/merchants/merchant_data.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:pratokente/core/services/products/product_service.dart';

class RestaurantBookViewModel extends FormViewModel {
  final log = getLogger('RestaurantBookViewModel');

  final _snackbarService = locator<SnackbarService>();

  final ProductService _productService = locator<ProductService>();
  final _navigationService = locator<NavigationService>();

  String _dataChanged = '';
  String _dataValidate = '';
  String _dataSaved = '';

  String _horaChanged = '';
  String _horaValidate = '';
  String _horaSaved = '';

  String? timeOfDayMinutes;
  String? timeofDayHours;
  var hours;
  var lastMinutes;

  RestaurantBookViewModel(
      {this.timeOfDayMinutes,
      this.timeofDayHours,
      this.lastMinutes,
      this.hours});

  setDataChanged({String? dataChanged}) {
    _dataChanged = dataChanged!;
    notifyListeners();
    return _dataChanged;
  }

  setDataValidate({required String dataValidate}) {
    _dataValidate = dataValidate;
    notifyListeners();
    return _dataValidate;
  }

  setDataSaved({String? dataSaved}) {
    _dataSaved = dataSaved!;
    notifyListeners();
    return _dataSaved;
  }

  setHoraSaved({String? horaSaved}) {
    _horaSaved = horaSaved!;
    notifyListeners();
    return _horaSaved;
  }

  setHoraValidate({String? horaValidate}) {
    _horaValidate = horaValidate!;
    notifyListeners();
    return _horaValidate;
  }

  setHoraChanged({String? horaChanged}) {
    _horaChanged = horaChanged!;
    notifyListeners();
    return _horaChanged;
  }

  get getBookReference => _productService.getBookReference();

  int _count = 1;

  //final bookedRef = FirebaseFirestore.instance.collection('booked');

  int get quantity => _count;
  MerchantData get getMerchantData => _productService.getMerchantData!;

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

  Future<void> saveBookingInfo({BookedData? makeBooking}) async {
    _productService.addBookingInfo(makeBooking!);
    log.i('This is the Value of ${makeBooking.date} and ${makeBooking.time}');
    snackBarAgendamento(
        data: makeBooking.date.toString(), hora: makeBooking.time.toString());
    await navigate();
  }

  void snackBarAgendamento({required String hora, required String data}) {
    _snackbarService.showSnackbar(
      message: ' Hora: ' + hora + ' Data: ' + data.toString(),
      title: 'Solicitação de Reserva Efectuada ',
      duration: Duration(seconds: 10),
    );
  }

  Future<void> navigate() async {
    await Future.delayed(const Duration(seconds: 11), () {
      //_navigationService.replaceWith(Routes.merchantViewList);
      _navigationService.clearStackAndShow(Routes.merchantViewList);
    });
  }

  @override
  void setFormStatus({String? validateDateTime}) {
    setDataValidate(dataValidate: validateDateTime!);
  }
}
