import 'package:flutter/material.dart';
import 'package:pratokente/ui/widgets/authentication_layout.dart';
import 'package:pratokente_ui/pratokente_ui.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import 'login_view.form.dart';
import 'login_viewmodel.dart';

@FormView(fields: [
  FormTextField(name: 'email'),
  FormTextField(name: 'password'),
])
class LoginView extends StatelessWidget with $LoginView {
  LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoginViewModel>.reactive(
      onModelReady: (model) => listenToFormUpdated(model),
      builder: (context, model, child) => Scaffold(
        body: Container(
          height: screenHeight(context),
          width: screenWidth(context),

          /// Set Background image in splash screen layout (Click to open code)
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/Template2/loginBackground.png'),
                fit: BoxFit.cover),
          ),
          child: AuthenticationLayout(
            busy: model.isBusy,
            onMainButtonTapped: model.saveData,
            onCreateAccountTapped: model.navigateToCreateAccount,
            validationMessage: model.validationMessage,
            title: 'PratoKente',
            subtitle: 'Enter your email address to sign in. Enjoy your food',
            mainButtonTitle: 'SIGN IN',
            form: Column(
              children: [
                TextField(
                  autofocus: true,
                  decoration: InputDecoration(labelText: 'Email'),
                  controller: emailController,
                ),
                TextField(
                  decoration: InputDecoration(labelText: 'Password'),
                  controller: passwordController,
                  obscureText: true,
                ),
              ],
            ),
            onForgotPassword: () {
              if (emailController.text.isNotEmpty) {
                model.recoverPass(email: emailController.text);
                emailController.clear();
              } else {
                emailFocusNode.requestFocus();
                model.snackBarTextBoxEmpty();
                //emailController.selection.
              }
            },
            onSignInWithGoogle: model.useGoogleAuthentication,
            onSignInWithApple: model.useAppleAuthentication,
            //onSignInFaceBook: ,
          ),
        ),
      ),
      viewModelBuilder: () => LoginViewModel(),
    );
  }
}
