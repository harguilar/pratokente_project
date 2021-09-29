import 'package:pratokente/app/app.locator.dart';
import 'package:pratokente/core/services/local_storage_service.dart';

Future setupSharedPreferencesLocator() async {
  var instance = await LocalStorageService.getInstance();
  locator.registerSingleton<LocalStorageService>(instance!);
  // locator.registerLazySingleton(() => LocalStorageService(instance));
}
