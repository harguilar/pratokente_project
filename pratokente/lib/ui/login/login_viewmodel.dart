import 'package:pratokente/app/app.locator.dart';
import 'package:pratokente/app/app.router.dart';
import 'package:pratokente/ui/base/authentication_viewModel.dart';
import 'package:stacked_firebase_auth/stacked_firebase_auth.dart';
import 'login_view.form.dart';

class LoginViewModel extends AuthenticationViewModel {
  final FirebaseAuthenticationService? _firebaseAuthenticationService =
      locator<FirebaseAuthenticationService>();

  LoginViewModel() : super(successRoute: Routes.addressSelectionView);

  @override
  Future<FirebaseAuthenticationResult> runAuthentication() =>
      _firebaseAuthenticationService!.loginWithEmail(
        email: emailValue!.trim(),
        password: passwordValue!,
      );

  void navigateToCreateAccount() =>
      navigationService.navigateTo(Routes.createAccountView);
}
