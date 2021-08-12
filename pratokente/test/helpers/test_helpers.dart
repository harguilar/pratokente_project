import 'package:mockito/mockito.dart';
import 'package:places_service/places_service.dart';
import 'package:pratokente/app/app.locator.dart';
import 'package:pratokente/constants/constants.dart';
import 'package:pratokente/core/datamodels/user/user_models.dart';
import 'package:pratokente/core/services/environment_services.dart';
import 'package:pratokente/core/services/firestore_api.dart';
import 'package:pratokente/core/services/users_services.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:mockito/annotations.dart';
import 'test_helpers.mocks.dart';

const String UserIdTestKey = 'default_user';

@GenerateMocks([], customMocks: [
  MockSpec<UserService>(returnNullOnMissingStub: true),
  MockSpec<NavigationService>(returnNullOnMissingStub: true),
  MockSpec<PlacesService>(returnNullOnMissingStub: true),
  MockSpec<EnvironmentService>(returnNullOnMissingStub: true),
  MockSpec<DialogService>(returnNullOnMissingStub: true),
  MockSpec<FirestoreApi>(returnNullOnMissingStub: true),
])
MockUserService getAndRegisterUserService({
  bool hasLoggedInUser = false,
  User? currentUser,
}) {
  _removeRegistrationIfExists<UserService>();
  final service = MockUserService();
  when(service.hasLoggedInUser).thenReturn(hasLoggedInUser);
  when(service.getCurrentUser)
      .thenReturn(currentUser ?? User(id: UserIdTestKey));
  locator.registerSingleton<UserService>(service);
  return service;
}

MockNavigationService getAndRegisterNavigationService() {
  _removeRegistrationIfExists<NavigationService>();
  final service = MockNavigationService();
  locator.registerSingleton<NavigationService>(service);
  return service;
}

MockPlacesService getAndRegisterPlacesService({PlacesDetails? placesDetails}) {
  _removeRegistrationIfExists<PlacesService>();
  final service = MockPlacesService();

  when(service.getPlaceDetails(any))
      .thenAnswer((realInvocation) => Future<PlacesDetails>.value(
            placesDetails ??
                PlacesDetails(
                  placeId: 'TestId',
                  city: 'Test City',
                ),
          ));

  locator.registerSingleton<PlacesService>(service);
  return service;
}

MockEnvironmentService getAndRegisterEnvironmentService({
  String value = NoKey,
}) {
  _removeRegistrationIfExists<EnvironmentService>();
  final service = MockEnvironmentService();

  when(service.initialise()).thenAnswer((realInvocation) => Future.value());
  when(service.getValue(any)).thenReturn(value);

  locator.registerSingleton<EnvironmentService>(service);
  return service;
}

MockDialogService getAndRegisterDialogService() {
  _removeRegistrationIfExists<DialogService>();
  final service = MockDialogService();

  when(service.showDialog(
          barrierDismissible: anyNamed('barrierDismissible'),
          buttonTitle: anyNamed('buttonTitle'),
          buttonTitleColor: anyNamed('buttonTitleColor'),
          cancelTitle: anyNamed('cancelTitle'),
          cancelTitleColor: anyNamed('cancelTitleColor'),
          description: anyNamed('description'),
          dialogPlatform: anyNamed('dialogPlatform'),
          title: anyNamed('title')))
      .thenAnswer((realInvocation) => Future.value(DialogResponse()));

  locator.registerSingleton<DialogService>(service);
  return service;
}

MockFirestoreApi getAndRegisterFirestoreApi({
  bool saveAddressSuccess = true,
  bool isCityServiced = true,
}) {
  _removeRegistrationIfExists<FirestoreApi>();
  final service = MockFirestoreApi();

  when(service.isCityServiced(city: anyNamed('city')))
      .thenAnswer((realInvocation) => Future.value(isCityServiced));

  when(service.saveAddress(
    address: anyNamed('address'),
    user: anyNamed('user'),
  )).thenAnswer((realInvocation) => Future.value(saveAddressSuccess));

  locator.registerSingleton<FirestoreApi>(service);
  return service;
}

void registerServices() {
  getAndRegisterUserService();
  getAndRegisterNavigationService();
  getAndRegisterPlacesService();
  getAndRegisterEnvironmentService();
  getAndRegisterDialogService();
  getAndRegisterFirestoreApi();
}

void unregisterServices() {
  locator.unregister<UserService>();
  locator.unregister<NavigationService>();
  locator.unregister<PlacesService>();
  locator.unregister<EnvironmentService>();
  locator.unregister<DialogService>();
  locator.unregister<FirestoreApi>();
}

void _removeRegistrationIfExists<T extends Object>() {
  if (locator.isRegistered<T>()) {
    locator.unregister<T>();
  }
}
