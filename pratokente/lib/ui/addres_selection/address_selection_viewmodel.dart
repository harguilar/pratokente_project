import 'package:places_service/places_service.dart';
import 'package:pratokente/app/app.locator.dart';
import 'package:pratokente/app/app.logger.dart';
import 'package:pratokente/app/app.router.dart';
import 'package:pratokente/constants/app_strings.dart';
import 'package:pratokente/core/datamodels/user/user_models.dart';
import 'package:pratokente/core/services/firestore_api.dart';
import 'package:pratokente/core/services/users_services.dart';
import 'package:pratokente/enums/basic_dialog_status.dart';
import 'package:pratokente/enums/dialog_type.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'address_selection_view.form.dart';
import 'package:pratokente/extensions/strings_extensions.dart';

class AddressSelectionViewModel extends FormViewModel {
  final log = getLogger('AddressSelectionViewModel');
  final _placesService = locator<PlacesService>();
  final _userService = locator<UserService>();
  final _navigationService = locator<NavigationService>();
  final _dialogService = locator<DialogService>();
  final _firestoreApi = locator<FirestoreApi>();

  List<PlacesAutoCompleteResult> _autoCompleteResult = [];

  List<PlacesAutoCompleteResult> get autoCompleteResult => _autoCompleteResult;

  PlacesAutoCompleteResult? _selectedResult;

  //PlacesAutoCompleteResult? _selected;
  bool focus = false;

  bool get hasAutoCompleteResult => _autoCompleteResult.isNotEmpty;

  bool get hasSelectedPlace => _selectedResult != null;

  @override
  void setFormStatus() {
    _getAutoCompleteResult();
  }

  Future<void> _getAutoCompleteResult() async {
    if (addressValue != null) {
      try {
        final placeResult = await _placesService.getAutoComplete(addressValue!);
        if (placeResult != null) {
          _autoCompleteResult = placeResult;
          notifyListeners();
        }
      } catch (err) {
        print(err.toString());
      }
    }
  }

/*   void setUserAddress({required String userAddress}) {
    _userService.updateUserAccount(
        userId: _userService.getCurrentUser.id, userAddress: userAddress);
  } */

  // void navigateToHome() => _navigationService.replaceWith(Routes.homeView);

  /// Gets the details from the Places Api and saves it to the backend
  Future<void> selectAddressSuggestion(
      {PlacesAutoCompleteResult? autoCompleteResult}) async {
    log.i("autoCompleteResult: $autoCompleteResult as suggestion");

    PlacesAutoCompleteResult selectedResult =
        autoCompleteResult ?? _selectedResult!;

    log.i('Selected $selectedResult as the suggestion');

    if (selectedResult.placeId == null) {
      _dialogService.showDialog(
          title: InvalidAddressCompletedDialogTitle,
          description: InvalidAddressCompletedDialogDescription);
    } else {
      setBusy(true);
      final placeDetails =
          await _placesService.getPlaceDetails(selectedResult.placeId ?? '');

      log.v('Place Details: $placeDetails');

      final city = placeDetails.city ?? '';
      final cityServed =
          await _firestoreApi.isCityServiced(city: city.toCityDocument);

      if (!cityServed) {
        await _dialogService.showCustomDialog(
          variant: DialogType.basic,
          customData: BasicDialogStatus.error,
          mainButtonTitle: CityNotServicedDialogMainButton,
          secondaryButtonTitle: CityNotServicedDialogSecondaryButton,
          title: cityNotServicedDialogTitle,
          description: cityNotServicedDialogDescription,
        );
        log.v('Place Details $placeDetails');
        final address = Address(
            placeId: placeDetails.placeId!,
            latitude: placeDetails.lat ?? -1,
            longitude: placeDetails.lng ?? -1,
            city: placeDetails.city,
            state: placeDetails.state,
            postCode: placeDetails.zip,
            street: placeDetails.streetLong ?? placeDetails.streetShort);

        final saveAddress = await _firestoreApi.saveAddress(
            address: address, user: _userService.getCurrentUser);

        if (!saveAddress) {
          log.v('Address save failed. Notify user to try again.');
          _dialogService.showDialog(
            title: AddressSaveFailedDialogTitle,
            description: AddressSaveFailedDialogDescription,
          );
        } else {
          log.v(
              'Address has been saved! We\'re ready to show them some products!');
          _navigationService.clearStackAndShow(Routes.homeView);
        }
      }
      setBusy(false);

      // notifyListeners();
    }
  }

  void setSelectedSuggestion(PlacesAutoCompleteResult autoCompleteResult) {
    log.i('Autocomplited Result $autoCompleteResult');
    _selectedResult = autoCompleteResult;
    _autoCompleteResult.clear();
    notifyListeners();
  }

  /// Updates the [PratokenteInputField] focus state
  void onFocusChanged(bool isFocus) {
    this.focus = isFocus;
    notifyListeners();
  }
}
