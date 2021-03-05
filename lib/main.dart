import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:icefishingderby/services/firebase_auth.dart';
import 'package:icefishingderby/views/splash_screen/splash_screen_view.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart' as apple;

import 'core/locator.dart';
import 'core/router_constants.dart';
import 'core/router.dart' as router;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  AuthService.appleSignInAvailable = await apple.SignInWithApple.isAvailable();
  await LocatorInjector.setUpLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: locator<NavigationService>().navigatorKey,
      onGenerateRoute: router.Router.generateRoute,
      initialRoute: splashScreenViewRoute,
      home: SplashScreenView(),
    );
  }
}
