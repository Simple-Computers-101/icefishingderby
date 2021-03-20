// [ This is an auto generated file ]

import 'package:flutter/material.dart';
import 'package:icefishingderby/core/router_constants.dart';

import 'package:icefishingderby/views/splash_screen/splash_screen_view.dart' as view0;
import 'package:icefishingderby/views/login_screen/login_screen_view.dart' as view1;
import 'package:icefishingderby/views/sign_up_screen/sign_up_screen_view.dart' as view2;
import 'package:icefishingderby/views/registration_screen/registration_screen_view.dart' as view3;
import 'package:icefishingderby/views/fish_form_screen/fish_form_screen_view.dart' as view4;
import 'package:icefishingderby/views/view_registration_screen/view_registration_screen_view.dart' as view5;
import 'package:icefishingderby/views/forgot_password/forgot_password_view.dart' as view6;
import 'package:icefishingderby/views/buy_products/buy_products_view.dart' as view7;
import 'package:icefishingderby/views/product_description/product_description_view.dart' as view8;

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splashScreenViewRoute:
        return MaterialPageRoute(builder: (_) => view0.SplashScreenView());
      case loginScreenViewRoute:
        return MaterialPageRoute(builder: (_) => view1.LoginScreenView());
      case signUpScreenViewRoute:
        return MaterialPageRoute(builder: (_) => view2.SignUpScreenView());
      case registrationScreenViewRoute:
        return MaterialPageRoute(builder: (_) => view3.RegistrationScreenView());
      case fishFormScreenViewRoute:
        return MaterialPageRoute(builder: (_) => view4.FishFormScreenView());
      case viewRegistrationScreenViewRoute:
        return MaterialPageRoute(builder: (_) => view5.ViewRegistrationScreenView());
      case forgotPasswordViewRoute:
        return MaterialPageRoute(builder: (_) => view6.ForgotPasswordView());
      case buyProductsViewRoute:
        return MaterialPageRoute(builder: (_) => view7.BuyProductsView());
      case productDescriptionViewRoute:
        return MaterialPageRoute(builder: (_) => view8.ProductDescriptionView());
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