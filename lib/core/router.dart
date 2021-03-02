// [ This is an auto generated file ]

import 'package:flutter/material.dart';
import 'package:icefishingderby/core/router_constants.dart';

import 'package:icefishingderby/views/splash_screen/splash_screen_view.dart'
    as view0;
import 'package:icefishingderby/views/login_screen/login_screen_view.dart'
    as view1;
import 'package:icefishingderby/views/sign_up_screen/sign_up_screen_view.dart'
    as view2;
import 'package:icefishingderby/views/home_screen/home_screen_view.dart'
    as view3;
import 'package:icefishingderby/views/bottom_bar/bottom_bar_view.dart' as view4;

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splashScreenViewRoute:
        return MaterialPageRoute(builder: (_) => view0.SplashScreenView());
      case loginScreenViewRoute:
        return MaterialPageRoute(builder: (_) => view1.LoginScreenView());
      case signUpScreenViewRoute:
        return MaterialPageRoute(builder: (_) => view2.SignUpScreenView());
      case homeScreenViewRoute:
        return MaterialPageRoute(builder: (_) => view3.HomeScreenView());
      case bottomBarViewRoute:
        return MaterialPageRoute(builder: (_) => view4.BottomBarView());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
