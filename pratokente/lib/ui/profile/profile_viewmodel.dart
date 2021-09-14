import 'package:pratokente/apis/firestore_api.dart';
import 'package:pratokente/app/app.locator.dart';
import 'package:pratokente/app/app.logger.dart';
import 'package:pratokente/app/app.router.dart';
import 'package:pratokente/core/datamodels/user/user_models.dart';
import 'package:pratokente/core/services/users/users_services.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_firebase_auth/stacked_firebase_auth.dart';
import 'package:stacked_services/stacked_services.dart';

class ProfileViewModel extends FormViewModel {
  final _firestoreApi = locator<FirestoreApi>();

  final _firebaseAuthenticationService =
      locator<FirebaseAuthenticationService>();
  final _snackbarService = locator<SnackbarService>();

  final log = getLogger('ProfileViewModel');

  final _userService = locator<UserService>();

  final navigationService = locator<NavigationService>();

  User get currentUser => _userService.getCurrentUser;

  Future<void> signOut() async {
    _firebaseAuthenticationService.logout();
    navigateToLogin();
    notifyListeners();
  }

  Future<void> updateUser({required User updatedUser}) async {
    try {
      setBusy(true);
      _firestoreApi.updateUser(updatedUser);
      setBusy(false);
      notifyListeners();
      _snackbarService.showSnackbar(message: 'Dados editados com successo !');
    } catch (e) {
      _snackbarService.showSnackbar(
          message: 'Ocorreu um erro, tente mais tarde');
    }
  }

  void navigateToLogin() => navigationService.replaceWith(Routes.loginView);

  @override
  void setFormStatus() {}
}
