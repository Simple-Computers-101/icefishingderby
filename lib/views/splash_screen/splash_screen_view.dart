import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icefishingderby/classes/SplashScreenCustom.dart';
import 'package:icefishingderby/constants/colors.dart';
import 'package:icefishingderby/views/buy_products/buy_products_view.dart';
import 'package:icefishingderby/views/forgot_password/forgot_password_view.dart';
import 'package:icefishingderby/views/login_screen/login_screen_view.dart';
import 'package:icefishingderby/views/product_description/product_description_view.dart';

import 'package:icefishingderby/views/registration_screen/registration_screen_view.dart';
import 'package:icefishingderby/views/view_registration_screen/view_registration_screen_view.dart';


import 'package:stacked/stacked.dart';
import 'splash_screen_view_model.dart';

class SplashScreenView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SplashScreenViewModel>.reactive(
      builder:
          (BuildContext context, SplashScreenViewModel viewModel, Widget _) {
        ScreenUtil.init(context,
            allowFontScaling: true, height: 683, width: 411);
        return Scaffold(
          body: AdvancedSplashScreen(
        animate: true,
        appIcon: 'assets/derby-logo.png',
        appTitle: DateTime.now().year.toString(),
        appTitleStyle:
            GoogleFonts.abel(fontSize: 28, fontWeight: FontWeight.w600),
        seconds: 3,
        colorList: [
          widgetcolor,
                  backgroundcolor,
                  widgetcolor,
        ],
        child: ProductDescriptionView(),


      ),
        );
      },
      viewModelBuilder: () => SplashScreenViewModel(),
    );
  }
}
