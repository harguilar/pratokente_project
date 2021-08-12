import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:places_service/places_service.dart';
import 'package:pratokente/app/app.router.dart';
import 'package:pratokente/constants/app_strings.dart';
import 'package:pratokente/core/datamodels/user/user_models.dart';
import 'package:pratokente/ui/addres_selection/address_selection_viewmodel.dart';
import '../helpers/test_helpers.dart';

AddressSelectionViewModel _getModel() => AddressSelectionViewModel();
void main() {
  group('AddressSelectionViewmodelTest -', () {
    setUp(() => registerServices());
    tearDown(() => unregisterServices());

    group('selectAddressSuggestion -', () {
      test(
          'When called with AutoCompleteResult that has an id, should get place details using that id',
          () async {
        final placesService = getAndRegisterPlacesService();
        final model = _getModel();
        final placeIdInResult = 'id_to_us';
        await model.selectAddressSuggestion(
            autoCompleteResult:
                PlacesAutoCompleteResult(placeId: placeIdInResult));
        verify(placesService.getPlaceDetails(placeIdInResult));
      });

      test(
          'When called with AutoCompleteResult that has no id, should call dialog service to show dialog',
          () async {
        final dialogService = getAndRegisterDialogService();
        final model = _getModel();

        await model.selectAddressSuggestion(
            autoCompleteResult: PlacesAutoCompleteResult());
        verify(dialogService.showDialog(
          title: InvalidAutoCompleteDialogTitle,
          description: InvalidAutoCompleteDialogDescription,
        ));
      });

      test(
          'When placesDetails retrieved, should call saveAddress on firestoreApi',
          () async {
        final firestoreApi = getAndRegisterFirestoreApi();
        final model = _getModel();

        await model.selectAddressSuggestion(
            autoCompleteResult: PlacesAutoCompleteResult(placeId: 'id'));
        verify(
          firestoreApi.saveAddress(
            address: anyNamed('address'),
            user: anyNamed('user'),
          ),
        );
      });

      test(
          'When placesDetails retrieved, should get userId from userService to get id',
          () async {
        final userService = getAndRegisterUserService();
        final model = _getModel();

        await model.selectAddressSuggestion(
            autoCompleteResult: PlacesAutoCompleteResult(placeId: 'id'));

        verify(userService.getCurrentUser);
      });

      test(
          'When placesDetails returns all vales, should copy it over to the address',
          () async {
        final firestoreApi = getAndRegisterFirestoreApi();
        final placeDetailsToReturn = PlacesDetails(
          city: 'Paarl',
          lat: 19,
          lng: 20,
          placeId: 'placeId',
          state: 'Western Cape',
          streetLong: 'Langen hofen Road',
          streetNumber: '78',
          streetShort: 'Langen hofen Rd',
          zip: '144',
        );

        getAndRegisterPlacesService(placesDetails: placeDetailsToReturn);
        final model = _getModel();

        await model.selectAddressSuggestion(
            autoCompleteResult: PlacesAutoCompleteResult(placeId: 'id'));

        verify(firestoreApi.saveAddress(
          address: Address(
            placeId: 'placeId',
            latitude: 19,
            longitude: 20,
            city: 'Paarl',
            postalCode: '144',
            state: 'Western Cape',
            street: 'Langen hofen Road',
          ),
          user: anyNamed('user'),
        ));
      });

      test(
          'When placesDetails returns no values, should use default values for non-required values',
          () async {
        final firestoreApi = getAndRegisterFirestoreApi();
        final placeDetailsToReturn = PlacesDetails(
          placeId: 'placeId',
        );

        getAndRegisterPlacesService(placesDetails: placeDetailsToReturn);
        final model = _getModel();

        await model.selectAddressSuggestion(
            autoCompleteResult: PlacesAutoCompleteResult(placeId: 'id'));

        verify(firestoreApi.saveAddress(
          address: Address(
            placeId: 'placeId',
            latitude: -1,
            longitude: -1,
          ),
          user: anyNamed('user'),
        ));
      });

      test(
          'When saving address to firestore fails, should call show Dialog on DialogService',
          () async {
        final dialogService = getAndRegisterDialogService();
        getAndRegisterFirestoreApi(saveAddressSuccess: false);
        final model = _getModel();
        await model.selectAddressSuggestion(
            autoCompleteResult: PlacesAutoCompleteResult(placeId: 'id'));
        verify(dialogService.showDialog(
          title: AddressSaveFailedDialogTitle,
          description: AddressSaveFailedDialogDescription,
        ));
      });

      test(
          'When saving address to firestore is successful, We should clear stack and navigate to the HomeView',
          () async {
        final navigationService = getAndRegisterNavigationService();
        getAndRegisterFirestoreApi(saveAddressSuccess: true);
        final model = _getModel();
        await model.selectAddressSuggestion(
            autoCompleteResult: PlacesAutoCompleteResult(placeId: 'id'));
        verify(navigationService.clearStackAndShow(Routes.homeView));
      });

      test(
          'When saving address, should check if place is services on firestoreApi using the city from the details',
          () async {
        final firestoreApi = getAndRegisterFirestoreApi();

        getAndRegisterPlacesService(
            placesDetails: PlacesDetails(
          placeId: 'id',
          city: 'Test City',
        ));

        final model = _getModel();
        await model.selectAddressSuggestion(
          autoCompleteResult: PlacesAutoCompleteResult(placeId: 'id'),
        );

        verify(firestoreApi.isCityServiced(city: 'test-city'));
      });

      test(
          'When saving address and place is not serviced, should show user a dialog with not serviced title and description',
          () async {
        final dialogService = getAndRegisterDialogService();
        getAndRegisterFirestoreApi(isCityServiced: false);

        final model = _getModel();
        await model.selectAddressSuggestion(
          autoCompleteResult: PlacesAutoCompleteResult(placeId: 'id'),
        );

        verify(
          dialogService.showDialog(
            title: CityNotServicedDialogTitle,
            description: CityNotServicedDialogDescripton,
          ),
        );
      });

      test(
          'When saving address and place is not serviced, should not call saveAddress on the FirestoreApi',
          () async {
        final firestoreApi = getAndRegisterFirestoreApi(isCityServiced: false);

        final model = _getModel();
        await model.selectAddressSuggestion(
          autoCompleteResult: PlacesAutoCompleteResult(placeId: 'id'),
        );

        verifyNever(firestoreApi.saveAddress(
          address: anyNamed('address'),
          user: anyNamed('user'),
        ));
      });
    });
  });
}
