import 'package:intl/intl.dart';
import 'package:pratokente/app/app.locator.dart';
import 'package:pratokente/app/app.logger.dart';
import 'package:pratokente/app/app.router.dart';
import 'package:pratokente/core/datamodels/booked/booked_data.dart';
import 'package:pratokente/core/datamodels/merchants/merchant_data.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'restaurant_book_view.form.dart';
import 'package:pratokente/core/services/products/product_service.dart';

class RestaurantBookViewModel extends FormViewModel {
  final log = getLogger('RestaurantBookViewModel');

  String _dataChanged = '';
  String _dataValidate = '';
  String _dataSaved = '';

  String _horaChanged = '';
  String _horaValidate = '';
  String _horaSaved = '';

  String? timeOfDayMinutes;
  String? timeofDayHours;
  RestaurantBookViewModel({this.timeOfDayMinutes, this.timeofDayHours});

  setDataChanged({String? dataChanged}) {
    _dataChanged = dataChanged!;
    notifyListeners();
    return _dataChanged;
  }

  setDataValidate({String? dataValidate}) {
    _dataValidate = dataValidate!;
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

  void initState() {
    Intl.defaultLocale = 'pt_BR';
    //_initialValue = DateTime.now().toString();
    String lsHour = timeofDayHours!;
    String lsMinute = timeOfDayMinutes!;
    //dataValue = DateTime.now().toString();
    //horaValue = '$lsHour:$lsMinute';
    //dateValue! = DateTime.now().toString();
    //horaValue

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

  final _snackbarService = locator<SnackbarService>();

  final ProductService _productService = locator<ProductService>();
  final _navigationService = locator<NavigationService>();

  int _count = 1;

  //final bookedRef = FirebaseFirestore.instance.collection('booked');

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
    _navigationService.replaceWith(Routes.merchantViewList);
  }

  MerchantData get getMerchantData => _productService.getMerchantData!;

  @override
  void setFormStatus({String? dataValidate, String? horaValidate}) {
    setDataValidate(dataValidate: dataValidate);
    print('Harguilar Tested This Out');
  }
}
