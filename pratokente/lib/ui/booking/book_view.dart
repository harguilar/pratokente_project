import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pratokente/core/datamodels/booked/booked_data.dart';
import 'package:pratokente_ui/pratokente_ui.dart';
import 'package:stacked/stacked.dart';
import 'book_viewModel.dart';

class BookView extends StatefulWidget {
  // MyHomePage({Key? key}) : super(key: key);

  @override
  _BookViewState createState() => _BookViewState();
}

class _BookViewState extends State<BookView> {
  GlobalKey<FormState> _oFormKey = GlobalKey<FormState>();

  TextEditingController? _controller3;
  TextEditingController? _controller4;

  String _valueChanged3 = '';
  String _valueToValidate3 = '';
  String _valueSaved3 = '';

  String _valueChanged4 = '';
  String _valueToValidate4 = '';
  String _valueSaved4 = '';

  @override
  void initState() {
    super.initState();
    Intl.defaultLocale = 'pt_BR';
    //_initialValue = DateTime.now().toString();
    String lsHour = TimeOfDay.now().hour.toString().padLeft(2, '0');

    String lsMinute = TimeOfDay.now().minute.toString().padLeft(2, '0');

    _controller3 = TextEditingController(text: DateTime.now().toString());

    _controller4 = TextEditingController(text: '$lsHour:$lsMinute');

    _getValue();
  }

  /// This implementation is just to simulate a load data behavior
  /// from a data base sqlite or from a API
  Future<void> _getValue() async {
    await Future.delayed(const Duration(seconds: 3), () {
      setState(() {
        String lstHour = TimeOfDay.now().hour.toString().padLeft(2, '0');
        String lstMinute = TimeOfDay.now().minute.toString().padLeft(2, '0');
        _controller3!.text = DateTime.now().month.toString();
        _controller4!.text = lstHour + ':' + lstMinute;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<BookViewModel>.reactive(
        builder: (context, model, child) => Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.orange,
                title: PratokenteText.headingThree(
                    model.getMerchantData.name.toString()),
                centerTitle: true,
                //leading: Container(),
              ),
              body: Container(
                height: screenHeight(context),
                width: screenWidth(context),

                /// Set Background image in splash screen layout (Click to open code)
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/Template2/loginBackground.png'),
                      fit: BoxFit.cover),
                ),
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      PratokenteText.body(
                        'Solicitar Agendamento',
                      ),
                      verticalSpaceRegular,
                      SingleChildScrollView(
                        padding: EdgeInsets.only(left: 20, right: 20, top: 10),
                        child: Form(
                          key: _oFormKey,
                          child: Column(
                            children: <Widget>[
                              DateTimePicker(
                                  type: DateTimePickerType.date,
                                  dateMask: 'dd/MM/yyyy',
                                  controller: _controller3,
                                  firstDate: DateTime(2000),
                                  lastDate: DateTime(2100),
                                  icon: Icon(Icons.event, color: Colors.orange),
                                  dateLabelText: 'Selectionar a Data',
                                  locale: Locale('pt', 'BR'),
                                  onChanged: (val) =>
                                      setState(() => _valueChanged3 = val),
                                  validator: (val) {
                                    setState(
                                        () => _valueToValidate3 = val ?? '');
                                    return null;
                                  },
                                  onSaved: (val) =>
                                      setState(() => _valueSaved3 = val ?? '')),
                              SizedBox(height: 40),
                              DateTimePicker(
                                  type: DateTimePickerType.time,
                                  controller: _controller4,
                                  //initialValue: _initialValue,
                                  icon: Icon(Icons.access_time,
                                      color: Colors.orange),
                                  timeLabelText: "Selectionar a Hora",
                                  //use24HourFormat: false,
                                  locale: Locale('pt', 'BR'),
                                  onChanged: (val) =>
                                      setState(() => _valueChanged4 = val),
                                  validator: (val) {
                                    setState(
                                        () => _valueToValidate4 = val ?? '');
                                    return null;
                                  },
                                  onSaved: (val) =>
                                      setState(() => _valueSaved4 = val ?? '')),
                              SizedBox(height: 40),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Icon(
                                    Icons.person,
                                    color: Colors.orange,
                                  ),
                                  IconButton(
                                      icon: Icon(Icons.remove),
                                      color: Theme.of(context).primaryColor,
                                      onPressed: () {
                                        model.decrement();
                                      }),
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(
                                        0.0, 14.0, 20.0, 0.0),
                                    child: PratokenteText.body(
                                      model.quantity.toString(),
                                    ),
                                  ),
                                  IconButton(
                                      icon: Icon(Icons.add),
                                      color: Theme.of(context).primaryColor,
                                      onPressed: () {
                                        model.increment();
                                      }),
                                ],
                              ),
                              SizedBox(height: 40),
                              PratokenteButton(
                                onTap: model.isBusy
                                    ? null
                                    : () {
                                        final loForm = _oFormKey.currentState;
                                        model.saveBookingInfo(
                                            makeBooking: BookedData(
                                                bookId: model.getBookReference,
                                                restaurantName:
                                                    model.getMerchantData.name,
                                                restaurantId:
                                                    model.getMerchantData.id,
                                                date: _valueChanged3.toString(),
                                                time: _valueChanged4.toString(),
                                                bookStatus: 1,
                                                numPerson: model.quantity));
                                        print('Harguilar Nhanga: ' +
                                            'Data Harguilar : ' +
                                            _valueChanged3.toString());
                                        print('Hora HARGUILAR:' +
                                            _valueChanged4.toString());

                                        if (loForm?.validate() == true) {
                                          loForm?.save();
                                        }
                                      },
                                // color: Colors.orange,
                                title: 'Submit',
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
        viewModelBuilder: () => BookViewModel());
  }
}
