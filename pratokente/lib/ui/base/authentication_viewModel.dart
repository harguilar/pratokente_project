import 'package:pratokente/app/app.locator.dart';
import 'package:pratokente/app/app.logger.dart';
import 'package:pratokente/core/datamodels/user/user_models.dart';
//import 'package:pratokente/app/app.router.dart';
import 'package:pratokente/core/services/users/users_services.dart';
import 'package:pratokente/expections/firestore_api_exceptions.dart';
import 'package:pratokente/global/global.dart';
import 'package:pratokente/ui/create_account/create_accountview.form.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_firebase_auth/stacked_firebase_auth.dart';
import 'package:stacked_services/stacked_services.dart';

abstract class AuthenticationViewModel extends FormViewModel {
  final log = getLogger('AuthenticationViewModel');
  final userService = locator<UserService>();
  final navigationService = locator<NavigationService>();

  final firebaseAuthenticationService =
      locator<FirebaseAuthenticationService>();

  //final storageService = locator<LocalStorageService>();

  final _snackbarService = locator<SnackbarService>();

  final String successRoute;
  AuthenticationViewModel({required this.successRoute});

  @override
  //For RealTime Validation
  void setFormStatus() {}

  Future<FirebaseAuthenticationResult> runAuthentication();

  Future saveData() async {
    log.i('valued: $formValueMap');
    //RunBusy Future keeps the view Busy while this function is executing.
    try {
      final result =
          await runBusyFuture(runAuthentication(), throwException: true);

      // Global.userId = result.user!.uid.toString();

      await _handleAuthenticationResponse(result);
    } on FirestoreApiExceptions catch (error) {
      log.e(error.toString());
    }
  }

  Future<void> useGoogleAuthentication() async {
    try {
      final result = await firebaseAuthenticationService.signInWithGoogle();
      // Global.userId = result.user!.uid.toString();

      await _handleAuthenticationResponse(result);
    } catch (err) {
      print(err.toString());
    }
  }

  Future<void> useAppleAuthentication() async {
    // https://pratokente.firebaseapp.com/__/auth/handler
    final result = await firebaseAuthenticationService.signInWithApple(
      appleClientId: 'harguee@hotmail.com',
      appleRedirectUri: 'https://pratokente.firebaseapp.com/__/auth/handler',
    );
    if (result.user!.uid == '') {
      Global.userId = result.user!.uid.toString();
    }

    await _handleAuthenticationResponse(result);
  }

  /// Checks if the result has an error. If it doesn't we navigate to the success view
  /// else we show the friendly validation message.
  Future<void> _handleAuthenticationResponse(
      FirebaseAuthenticationResult authResult) async {
    log.v('Auth Error ${authResult.hasError}');

    if (!authResult.hasError && authResult.user != null) {
      final user = authResult.user!;
      await userService.syncOrCreateUserAccount(
        user: User(
          id: user.uid,
          email: user.email,
          name: user.displayName ?? fullNameValue,
          role: 'buyer',
        ),
      );
      // navigate to success route
      navigateToHome();
      //navigationService.replaceWith(successRoute);
    } else {
      if (!authResult.hasError && authResult.user == null) {
        log.wtf('You have no Error, but the user is Null');
      }
      log.w('Authentication Failed ${authResult.errorMessage.toString()}');
      setValidationMessage(authResult.errorMessage);
      notifyListeners();
    }
  }

  recoverPass({required String email}) {
    firebaseAuthenticationService.sendResetPasswordLink(email);
    snackBarPassworLinkReset();
  }

  void snackBarPassworLinkReset() {
    _snackbarService.showSnackbar(
      message: 'Link Enviado Com Sucesso',
      title: 'Link To Reset Password',
      duration: Duration(seconds: 10),
      onTap: (_) {
        print('snackbar tapped');
      },
      // mainButtonTitle: 'Undo',
      //onMainButtonTapped: () => print('Undo the action!'),
    );
  }

  void snackBarTextBoxEmpty() {
    _snackbarService.showSnackbar(
      message: 'Enter Email Address',
      title: 'Email Should not Be empty',
      duration: Duration(seconds: 5),
      onTap: (_) {
        print('snackbar tapped');
      },
      mainButtonTitle: 'Ok',
      onMainButtonTapped: () => print('Undo the action!'),
    );
  }

  void navigateToHome() => navigationService.replaceWith(successRoute);
}
