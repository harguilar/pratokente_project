//import 'package:places_service/places_service.dart';
import 'package:places_service/places_service.dart';
import 'package:pratokente/app/app.locator.dart';
import 'package:pratokente/app/app.logger.dart';
import 'package:pratokente/app/app.router.dart';
import 'package:pratokente/constants/constants.dart';
import 'package:pratokente/core/services/cart/cart_service.dart';
import 'package:pratokente/core/services/environment_services.dart';
import 'package:pratokente/core/services/users/users_services.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class StartUpViewModel extends BaseViewModel {
  final log = getLogger('StartUpViewModel');
  final _userService = locator<UserService>();
  //final _cartService = locator<CartService>();
  final _placesService = locator<PlacesService>();
  final _navigationService = locator<NavigationService>();

  Future<void> runStartupLogic() async {
    final _environmentService = locator<EnvironmentService>();
    final _cartServices = locator<CartService>();

    await _environmentService.initialise();
    _placesService.initialize(
        apiKey: _environmentService.getValue(GoogleMapsEnvKey));
    //List<CartProduct>? _cartListOfProducts = [];

    if (_userService.hasLoggedInUser) {
      log.v('We have a user session on disk. Sync the user profile ...');
      await _userService.syncUserAccount();

      final currentUser = _userService.getCurrentUser;

      log.v('User sync complete. User profile: $currentUser');

      final _cartListOfProducts = await _cartServices.getCartListOfProducts(
          userId: _userService.getCurrentUser.id);

      _cartServices.setCartOfListProducts(
          cartListOfProduct: _cartListOfProducts);

      if (!currentUser.hasAddress) {
        // _navigationService.navigateTo(Routes.addressSelectionView);
        _navigationService.replaceWith(Routes.homeView);
      } else {
        // navigate to home view
        _navigationService.replaceWith(Routes.homeView);
      }
    } else {
      log.v('No user on disk, navigate to the LoginView');
      _navigationService.replaceWith(Routes.loginView);
    }
  }
}
