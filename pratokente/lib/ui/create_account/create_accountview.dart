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
  FormTextField(name: 'email', isPassword: true),
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
            title: PratokenteText.headingOne('Create Account'),
            subtitle: PratokenteText.subheading(
                'Enter Your Name, Email and Password'),
            mainButtonTitle: 'SIGN UP',
            form: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                PratokenteText.headingLogin('Full Name: '),
                PratokenteInputField(
                  leading: Icon(Icons.person),
                  controller: fullNameController,
                  trailing: Icon(Icons.close),
                  trailingTapped: () => fullNameController.clear(),
                  //leading: Text('Email'),
                ),
                verticalSpaceRegular,
                PratokenteText.headingLogin('Email: '),
                PratokenteInputField(
                  controller: emailController,
                  leading: Icon(Icons.email),
                  trailing: Icon(Icons.close),
                  trailingTapped: () => emailController.clear(),
                  //leading: Text('Email'),
                ),
                verticalSpaceRegular,
                PratokenteText.headingLogin('Password: '),
                PratokenteInputField(
                  leading: Icon(Icons.lock),
                  controller: passwordController,
                  password: true,
                  trailing: Icon(Icons.close),
                  trailingTapped: () => passwordController.clear(),
                  //leading: Text('Email'),
                ),
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
