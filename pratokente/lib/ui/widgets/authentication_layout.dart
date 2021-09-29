import 'dart:io';
import 'package:auth_buttons/auth_buttons.dart';
import 'package:flutter/material.dart';
import 'package:pratokente_ui/pratokente_ui.dart';

class AuthenticationLayout extends StatelessWidget {
  final Widget? title;
  final Widget? subtitle;
  final String? mainButtonTitle;
  final Widget? form;
  final bool showTermsText;
  final void Function()? onMainButtonTapped;
  final void Function()? onCreateAccountTapped;
  final void Function()? onForgotPassword;
  final void Function()? onBackPressed;
  final void Function()? onSignInWithApple;
  final void Function()? onSignInWithGoogle;
  final void Function()? onSignInFaceBook;
  final String? validationMessage;
  final bool busy;

  const AuthenticationLayout({
    Key? key,
    this.title,
    this.subtitle,
    this.mainButtonTitle,
    this.form,
    this.onMainButtonTapped,
    this.onCreateAccountTapped,
    this.onForgotPassword,
    this.onBackPressed,
    this.onSignInWithApple,
    this.onSignInWithGoogle,
    this.onSignInFaceBook,
    this.validationMessage,
    this.showTermsText = false,
    this.busy = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const AuthButtonType buttonType = AuthButtonType.secondary;
    const AuthIconType authIconType = AuthIconType.outlined;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: ListView(
        children: [
          if (onBackPressed == null) verticalSpaceLarge,
          if (onBackPressed != null) verticalSpaceRegular,
          if (onBackPressed != null)
            IconButton(
              padding: EdgeInsets.zero,
              alignment: Alignment.centerLeft,
              icon: Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
              ),
              onPressed: onBackPressed,
            ),
          title!,
          verticalSpaceSmall,
          Align(
            alignment: Alignment.centerLeft,
            child: SizedBox(
                width: screenWidthPercentage(context, percentage: 0.7),
                child: subtitle),
          ),
          verticalSpaceRegular,
          form!,
          verticalSpaceRegular,
          if (onForgotPassword != null)
            Align(
              alignment: Alignment.centerRight,
              child: InkWell(
                onTap: onForgotPassword,
                child: Text(
                  'Forget Password?',
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 17.0)
                      .copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          verticalSpaceRegular,
          if (validationMessage != null)
            Text(
              validationMessage!,
              style: TextStyle(
                color: Colors.red,
                fontSize: 16,
              ),
            ),
          if (validationMessage != null) verticalSpaceRegular,
          PratokenteButton(title: mainButtonTitle!, onTap: onMainButtonTapped),
          verticalSpaceRegular,
          if (onCreateAccountTapped != null)
            GestureDetector(
              onTap: onCreateAccountTapped,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Don\'t have an account?'),
                  horizontalSpaceTiny,
                  Text(
                    'Create an account',
                    style: TextStyle(
                      color: kcPrimaryColor,
                    ),
                  )
                ],
              ),
            ),
          if (showTermsText)
            Text(
              'By signing up you agree to our terms, conditions and privacy policy.',
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 17.0),
              textAlign: TextAlign.center,
            ),
          verticalSpaceRegular,
          Align(
            alignment: Alignment.center,
            child: Text(
              'Or',
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 17.0),
            ),
          ),
          verticalSpaceRegular,
          if (Platform.isIOS)
            AppleAuthButton(
              onPressed: onSignInWithApple ?? () {},
              // darkMode: true,
              //iconSize: 24,
              //height: 50,
              text: 'CONTINUE WITH APPLE',
              //textStyle: TextStyle(color: Colors.white),
              //style: buttonType,
            ),
          verticalSpaceRegular,
          GoogleAuthButton(
            onPressed: onSignInWithGoogle ?? () {},
            // buttonColor: Color(0xff4285F4),
            //iconSize: 24,
            //iconBackground: Colors.white,
            style: const AuthButtonStyle(
              buttonType: buttonType,
              iconType: authIconType,
            ),
            //height: 50,
            //textStyle: TextStyle(color: Colors.white),
            text: 'CONTINUE WITH GOOGLE',
          ),
        ],
      ),
    );
  }
}
