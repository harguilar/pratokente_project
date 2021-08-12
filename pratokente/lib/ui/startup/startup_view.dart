import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:pratokente/constants/constants.dart';
import 'package:pratokente/ui/shared/shared_styles.dart';
import 'package:pratokente/ui/shared/ui_helpers.dart';
// ignore: import_of_legacy_library_into_null_safe
//import 'package:splashscreen/splashscreen.dart';
import 'package:stacked/stacked.dart';

import 'startup_viewModel.dart';

class StartupView extends StatelessWidget {
  //final PushNotificationService _pushNotificationService =locator<PushNotificationService>();

  @override
  Widget build(BuildContext context) {
    // _pushNotificationService.initialise();
    WidgetsFlutterBinding.ensureInitialized();
    //Keep the app alive.
    //Wakelock.enable();

    return ViewModelBuilder<StartUpViewModel>.reactive(
      onModelReady: (model) =>
          SchedulerBinding.instance?.addPostFrameCallback((timeStamp) {
        model.runStartupLogic();
      }),
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
          child: Center(
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  /*      Text(
                    APP_NAME,
                    style: ktMediumBody,
                  ), */
                  // Image(image: AssetImage('assets/logo/pratokente.png'))
                  // Image.asset('assets/logo/pratokente.png')
                ],
              ),
            ),
          ),
        ),
      ),
      viewModelBuilder: () => StartUpViewModel(),
    );
  }
}
