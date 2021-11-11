import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:pratokente/core/datamodels/booked/booked_data.dart';
import 'package:pratokente_ui/pratokente_ui.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'restaurant_book_view.form.dart';
import 'restaurant_book_viewmodel.dart';

//Place form to Synch The userData to the ViewModel.
@FormView(fields: [
  FormTextField(name: 'data'),
  FormTextField(name: 'hora'),
])
class RestaurantBookView extends StatelessWidget with $RestaurantBookView {
  RestaurantBookView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<RestaurantBookViewModel>.reactive(
      viewModelBuilder: () => RestaurantBookViewModel(
        timeOfDayMinutes: TimeOfDay.now().minute.toString().padLeft(2, '0'),
        timeofDayHours: TimeOfDay.now().hour.toString().padLeft(2, '0'),
      ),
      onModelReady: (model) => {
        listenToFormUpdated(model),
      },
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
              children: <Widget>[
                PratokenteText.body(
                  'Solicita Agendamento',
                ),
                verticalSpaceRegular,
                SingleChildScrollView(
                  padding: EdgeInsets.only(left: 20, right: 20, top: 10),
                  child: Column(
                    children: <Widget>[
                      DateTimePicker(
                        type: DateTimePickerType.date,
                        dateMask: 'dd/MM/yyyy',
                        controller: dataController,
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2100),
                        icon: Icon(Icons.event, color: Colors.orange),
                        dateLabelText: 'Selectionar a Data',
                        locale: Locale('pt', 'BR'),
                        onChanged: (val) =>
                            model.setDataChanged(dataChanged: val),
                        validator: (val) {
                          dataController.text = val!;
                          model.setFormStatus(validateDateTime: val);
                        },
                        onSaved: (val) =>
                            model.setDataSaved(dataSaved: val ?? ''),
                      ),
                      verticalSpaceSmall,
                      DateTimePicker(
                        type: DateTimePickerType.time,
                        // dateMask: 'dd/MM/yyyy',
                        controller: horaController,
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2100),
                        icon: Icon(Icons.access_time, color: Colors.orange),
                        dateLabelText: "Selectionar a Hora",
                        locale: Locale('pt', 'BR'),
                        onChanged: (val) =>
                            model.setHoraChanged(horaChanged: val),
                        validator: (val) {
                          horaController.text = val!;
                          model.setFormStatus(validateDateTime: val);
                        },
                        onSaved: (val) =>
                            model.setHoraSaved(horaSaved: val ?? ''),
                      ),
                      verticalSpaceMedium,
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                            padding: EdgeInsets.fromLTRB(0.0, 14.0, 20.0, 0.0),
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
                      verticalSpaceMediumLarge,
                      PratokenteButton(
                        onTap: model.isBusy
                            ? null
                            : () {
                                model.saveBookingInfo(
                                  makeBooking: BookedData(
                                      bookId: model.getBookReference,
                                      restaurantName:
                                          model.getMerchantData.name,
                                      restaurantId: model.getMerchantData.id,
                                      date: dataController.text.toString(),
                                      time: horaController.text.toString(),
                                      bookStatus: 1,
                                      numPerson: model.quantity),
                                );
                                print('Harguilar Nhanga: ' +
                                    'Data Harguilar : ' +
                                    dataController.text.toString());
                                print('Hora HARGUILAR:' +
                                    horaController.text.toString());
                              },
                        // color: Colors.orange,
                        title: 'Booked',
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
