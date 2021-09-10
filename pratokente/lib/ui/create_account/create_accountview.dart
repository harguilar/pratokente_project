import 'package:flutter/material.dart';
import 'package:pratokente/ui/widgets/authentication_layout.dart';
import 'package:pratokente_ui/pratokente_ui.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'create_account_viewmodel.dart';
import 'create_accountview.form.dart';

//Place form to Synch The userData to the ViewModel.
@FormView(fields: [
  FormTextField(name: 'fullName'),
  FormTextField(name: 'email'),
  FormTextField(name: 'password'),
])
class CreateAccountView extends StatelessWidget with $CreateAccountView {
  CreateAccountView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CreateAccountViewModel>.reactive(
      //Synch the Form with the ViewModel
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
            onMainButtonTapped: () => model.saveData(),
            onBackPressed: model.navigateBack,
            validationMessage: model.validationMessage,
            onCreateAccountTapped: () {},
            title: 'Create Account',
            subtitle: 'Enter Your Name, Email and Password',
            mainButtonTitle: 'SIGN UP',
            form: Column(
              children: [
                TextField(
                  decoration: InputDecoration(labelText: 'Full Name: '),
                  controller: fullNameController,
                ),
                TextField(
                  decoration: InputDecoration(labelText: 'Email: '),
                  controller: emailController,
                ),
                TextField(
                  decoration: InputDecoration(labelText: 'Password: '),
                  controller: passwordController,
                )
              ],
            ),
            showTermsText: true,
          ),
        ),
      ),
      viewModelBuilder: () => CreateAccountViewModel(),
    );
  }
}
