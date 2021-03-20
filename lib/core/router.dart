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
<<<<<<< Updated upstream
import 'package:icefishingderby/views/buy_products/buy_products_view.dart' as view7;
import 'package:icefishingderby/views/product_description/product_description_view.dart' as view8;
import 'package:icefishingderby/views/show_qr_code/show_qr_code_view.dart' as view9;
import 'package:icefishingderby/views/show_qr_code/show_qr_code_view.dart' as view9;
=======
import 'package:icefishingderby/views/show_qr_code/show_qr_code_view.dart' as view7;
import 'package:icefishingderby/views/my_fish_screen/my_fish_screen_view.dart' as view8;
import 'package:icefishingderby/views/view_fish_rank_screen/view_fish_rank_screen_view.dart' as view9;
>>>>>>> Stashed changes

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
      case showQrCodeViewRoute:
<<<<<<< Updated upstream
        return MaterialPageRoute(builder: (_) => view9.ShowQrCodeView());
      case showQrCodeViewRoute:
        return MaterialPageRoute(builder: (_) => view9.ShowQrCodeView());
=======
        return MaterialPageRoute(builder: (_) => view7.ShowQrCodeView());
      case myFishScreenViewRoute:
        return MaterialPageRoute(builder: (_) => view8.MyFishScreenView());
      case viewFishRankScreenViewRoute:
        return MaterialPageRoute(builder: (_) => view9.ViewFishRankScreenView());
>>>>>>> Stashed changes
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