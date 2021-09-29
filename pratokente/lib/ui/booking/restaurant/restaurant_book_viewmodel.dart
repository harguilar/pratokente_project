import 'package:flutter/material.dart';
import 'package:pratokente/app/app.locator.dart';
import 'package:pratokente/app/app.logger.dart';
import 'package:pratokente/app/app.router.dart';
import 'package:pratokente/core/datamodels/booked/booked_data.dart';
import 'package:pratokente/core/datamodels/merchants/merchant_data.dart';
import 'package:pratokente/core/services/product_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class RestaurantBookViewModel extends FormViewModel {
  final log = getLogger('RestaurantBookViewModel');

  String _dataChanged = '';
  String _dataValidate = '';
  String _dataSaved = '';

  String _horaChanged = '';
  String _horaValidate = '';
  String _horaSaved = '';

  setDataChanged({String? dataChanged}) {
    setBusy(true);
    _dataChanged = dataChanged!;
    setBusy(false);
    notifyListeners();
    return _dataChanged;
  }

  setDataValidate({String? dataValidate}) {
    setBusy(true);
    _dataValidate = dataValidate!;
    setBusy(false);
    notifyListeners();
    return _dataValidate;
  }

  setDataSaved({String? dataSaved}) {
    setBusy(true);
    _dataSaved = dataSaved!;
    setBusy(false);
    notifyListeners();
    return _dataSaved;
  }

  setHoraSaved({String? horaSaved}) {
    setBusy(true);
    _horaSaved = horaSaved!;
    setBusy(false);
    notifyListeners();
    return _horaSaved;
  }

  setHoraValidate({String? horaValidate}) {
    setBusy(true);
    _horaValidate = horaValidate!;
    setBusy(false);
    notifyListeners();
    return _horaValidate;
  }

  setHoraChanged({String? horaChanged}) {
    setBusy(true);
    _horaChanged = horaChanged!;
    setBusy(false);
    notifyListeners();
    return _horaChanged;
  }

  Future<void> _getValue() async {
    await Future.delayed(const Duration(seconds: 3), () {
      setBusy(true);
      String lstHour = TimeOfDay.now().hour.toString().padLeft(2, '0');
      String lstMinute = TimeOfDay.now().minute.toString().padLeft(2, '0');

      DateTime.now().month.toString();

      lstHour + ':' + lstMinute;

      setBusy(false);
      notifyListeners();
    });
  }

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

  @override
  void setFormStatus({String? dataValidate, String? horaValidate}) {
    setDataValidate(dataValidate: dataValidate);
    // TODO: implement setFormStatus
  }
}
