import 'package:flutter/material.dart';
import 'package:pratokente/ui/widgets/authentication_layout.dart';
import 'package:pratokente_ui/pratokente_ui.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import 'login_view.form.dart';
import 'login_viewmodel.dart';

@FormView(fields: [
  FormTextField(name: 'email'),
  FormTextField(name: 'password', isPassword: true),
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
            title: PratokenteText.headingOne(
              'PratoKente',
              align: TextAlign.center,
            ),
            subtitle: PratokenteText.subheading(
                'Enter your email address to sign in. Enjoy your food'),
            mainButtonTitle: 'SIGN IN',
            form: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                PratokenteText.headingLogin('Email: '),
                PratokenteInputField(
                  controller: emailController,
                  leading: Icon(Icons.email),
                  //  placeholder: "Email",
                  trailing: Icon(Icons.close),
                  trailingTapped: () => emailController.clear(),
                  //leading: Text('Email'),
                ),
                verticalSpaceRegular,
                PratokenteText.headingLogin('Password: '),
                PratokenteInputField(
                  leading: Icon(Icons.lock),
                  controller: passwordController,
                  // placeholder: "Password",
                  //leading: Text('Password'),
                  password: true,
                  trailing: Icon(Icons.close),
                  trailingTapped: () => passwordController.clear(),
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
