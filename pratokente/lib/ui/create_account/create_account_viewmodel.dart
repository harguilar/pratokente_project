import 'package:pratokente/app/app.locator.dart';
import 'package:pratokente/app/app.router.dart';
import 'package:pratokente/ui/base/authentication_viewModel.dart';
// ignore: implementation_imports
import 'package:stacked_firebase_auth/src/firebase_authentication_service.dart';
import 'create_accountview.form.dart';

class CreateAccountViewModel extends AuthenticationViewModel {
  CreateAccountViewModel()
      : super(
            successRoute: Routes
                .merchantViewList /* Harguilar Nhanga Routes.addressSelectionView*/);
  final _firebaseAuthenticationService =
      locator<FirebaseAuthenticationService>();

  @override
  Future<FirebaseAuthenticationResult> runAuthentication() =>
      _firebaseAuthenticationService.createAccountWithEmail(
        email: emailValue.toString(),
        password: passwordValue.toString(),
      );
  void navigateBack() => navigationService.back();
}
