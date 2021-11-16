import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pratokente/ui/addres_selection/address_selection_view.form.dart';
import 'package:pratokente_ui/pratokente_ui.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'address_selection_viewmodel.dart';

@FormView(fields: [
  FormTextField(
    name: 'address',
  )
])
class AddressSelectionView extends StatelessWidget with $AddressSelectionView {
  AddressSelectionView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AddressSelectionViewModel>.reactive(
      onModelReady: (model) => listenToFormUpdated(model),
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          foregroundColor: kcPrimaryColor,
        ),

        /// Makes the button center
        bottomNavigationBar: Visibility(
          visible: model.hasSelectedPlace,
          child: Container(
            margin: EdgeInsets.all(20.0),
            child: PratokenteButton(
              title: 'Continue',
              busy: model.isBusy,
              disabled: !model.hasSelectedPlace,
              onTap: () => model.selectAddressSuggestion(),
            ),
          ),
        ),
        body: ListView(
          padding: EdgeInsets.all(20.0),
          children: [
            Container(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  PratokenteText.headingTwo("Encontrar restaurantes próximos"),
                  verticalSpaceSmall,
                  PratokenteText.body(
                    "Por Favor adicionar a tua localização ou permitir acesso a sua localização",
                    align: TextAlign.center,
                  ),
                ],
              ),
            ),
            FocusScope(
              child: Focus(
                onFocusChange: model.onFocusChanged,
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 400),
                  margin: model.focus
                      ? EdgeInsets.only(top: 30.0)
                      : EdgeInsets.only(top: 50.0),
                  child: PratokenteInputField(
                    controller: addressController,
                    leading: Icon(Icons.location_on),
                    trailing: Icon(Icons.close),
                    trailingTapped: () => addressController.clear(),
                    placeholder: "Entrar o seu endereço",
                  ),
                ),
              ),
            ),
            verticalSpaceMedium,
            if (!model.hasAutoCompleteResult &&
                model.hasAddress &&
                model.addressValue!.isEmpty)
              PratokenteText.body(' Não Temos sugestões para si'),
            if (model.hasAutoCompleteResult && !model.isBusy)
              ...model.autoCompleteResult.map(
                (autoCompleteResult) => AutoCompleteListItem(
                  city: autoCompleteResult.mainText ?? '',
                  state: autoCompleteResult.secondaryText ?? '',
                  onTap: () {
                    SystemChannels.textInput.invokeMethod('TextInput.hide');
                    model.setSelectedSuggestion(autoCompleteResult);
                    addressController.text = "${autoCompleteResult.mainText}";
                  },
                ),
              ),
          ],
        ),
      ),
      viewModelBuilder: () => AddressSelectionViewModel(),
    );
  }
}
