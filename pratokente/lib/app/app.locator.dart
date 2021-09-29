// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedLocatorGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:places_service/places_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_firebase_auth/stacked_firebase_auth.dart';
import 'package:stacked_services/stacked_services.dart';

import '../apis/firestore_api.dart';
import '../core/services/bottom_navigation_service.dart';
import '../core/services/cart/cart_service.dart';
import '../core/services/environment_services.dart';
import '../core/services/local_storage_service.dart';
import '../core/services/merchants/merchants_services.dart';
import '../core/services/orders_service.dart';
import '../core/services/product_service.dart';
import '../core/services/support/support_services.dart';
import '../core/services/users/users_services.dart';

final locator = StackedLocator.instance;

void setupLocator({String? environment, EnvironmentFilter? environmentFilter}) {
// Register environments
  locator.registerEnvironment(
      environment: environment, environmentFilter: environmentFilter);

// Register dependencies
  locator.registerLazySingleton(() => NavigationService());
  locator.registerSingleton(FirebaseAuthenticationService());
  locator.registerLazySingleton(() => BottomNavigation());
  locator.registerLazySingleton(() => CartService());
  locator.registerLazySingleton(() => OrdersService());
  locator.registerLazySingleton(() => ProductService());
  locator.registerLazySingleton(() => EnvironmentService());
  locator.registerLazySingleton(() => DialogService());
  locator.registerLazySingleton(() => SnackbarService());
  locator.registerLazySingleton(() => FirestoreApi());
  locator.registerLazySingleton(() => UserService());
  locator.registerLazySingleton(() => PlacesService());
  locator.registerLazySingleton(() => MerchantsService());
  locator.registerLazySingleton(() => SupportService());
  locator.registerLazySingleton(() => LocalStorageService());
}
