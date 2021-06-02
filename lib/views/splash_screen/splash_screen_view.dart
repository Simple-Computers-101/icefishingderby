import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icefishingderby/classes/SplashScreenCustom.dart';
import 'package:icefishingderby/constants/colors.dart';
import 'package:icefishingderby/views/all_prizes_screen/all_prizes_screen_view.dart';
import 'package:icefishingderby/views/bottom_bar/bottom_bar_view.dart';
import 'package:icefishingderby/views/credit_card_screen/credit_card_screen_view.dart';
import 'package:icefishingderby/views/drawings_screen/drawings_view.dart';
import 'package:icefishingderby/views/fish_form_screen/fish_form_screen_view.dart';
import 'package:icefishingderby/views/forgot_password/forgot_password_view.dart';
import 'package:icefishingderby/views/login_screen/login_screen_view.dart';
import 'package:icefishingderby/views/my_fish_screen/my_fish_screen_view.dart';
import 'package:icefishingderby/views/prize_details/prize_details_view.dart';
import 'package:icefishingderby/views/product_description/product_description_view.dart';
import 'package:icefishingderby/views/registration_screen/registration_screen_view.dart';
import 'package:icefishingderby/views/show_qr_code/show_qr_code_view.dart';
import 'package:icefishingderby/views/sign_up_screen/sign_up_screen_view.dart';
import 'package:icefishingderby/views/test_multi_future/test_multi_future_view.dart';
import 'package:icefishingderby/views/view_fish_rank_screen/view_fish_rank_screen_view.dart';
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
            appTitleStyle: GoogleFonts.abel(
                color: Colors.white, fontSize: 28, fontWeight: FontWeight.w600),
            seconds: 3,
            colorList: [
              widgetcolor,
              backgroundcolor,
              widgetcolor,
            ],
            
          ),
        );
      },
      viewModelBuilder: () => SplashScreenViewModel(),
    );
  }
}
