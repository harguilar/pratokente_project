//import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'app/app.locator.dart';
import 'app/app.router.dart';
import 'constants/constants.dart';
import 'core/services/setup_snackbar_ui.dart';
//import 'package:flutter_dotenv/flutter_dotenv.dart' as DotEnv;
import 'dart:io';

import 'shared/setup_dialog_ui.dart';

const bool USE_EMULATOR = true;
Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  if (USE_EMULATOR) {
    await _connectToFirebaseEmulator();
  }
  // await setupSharedPreferencesLocator();
  setupLocator();
  setupSnackbarUi();
  setupDialogUi();
  runApp(MyApp());
}

//Connect to the Firestore and Authentication
Future _connectToFirebaseEmulator() async {
  final localHostString = Platform.isAndroid ? '10.0.2.2' : 'localhost';
  FirebaseFirestore.instance.settings = Settings(
      host: '$localHostString:8080',
      sslEnabled: false,
      persistenceEnabled: false);
  await FirebaseAuth.instance.useEmulator('http://$localHostString:9099');
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: APP_NAME,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      navigatorKey: StackedService.navigatorKey,
      onGenerateRoute: StackedRouter().onGenerateRoute,
      localizationsDelegates: [
        GlobalWidgetsLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      //supportedLocales: [Locale('pt', 'BR')],
      debugShowCheckedModeBanner: false,
    );
  }
}
