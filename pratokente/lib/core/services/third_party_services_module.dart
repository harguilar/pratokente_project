//import 'package:injectable/injectable.dart';
import 'package:stacked_services/stacked_services.dart';

abstract class ThirdPartyServicesModule {
  NavigationService get navigationService;
  DialogService get dialogService;
  SnackbarService get snackBarService;
  // @lazySingleton
  BottomSheetService get bottomSheetService;
}
