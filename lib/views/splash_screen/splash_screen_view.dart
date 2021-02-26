import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icefishingderby/classes/SplashScreenCustom.dart';
import 'package:icefishingderby/views/bottom_bar/bottom_bar_view.dart';
import 'package:icefishingderby/views/home_screen/home_screen_view.dart';
import 'package:icefishingderby/views/login_screen/login_screen_view.dart';
import 'package:icefishingderby/views/sign_up_screen/sign_up_screen_view.dart';
import 'package:stacked/stacked.dart';
import 'splash_screen_view_model.dart';
          
class SplashScreenView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SplashScreenViewModel>.reactive(
      builder: (BuildContext context, SplashScreenViewModel viewModel, Widget _) {
        ScreenUtil.init(context, allowFontScaling: true, height: 683, width: 411);
        return Scaffold(
          body: AdvancedSplashScreen(
        animate: true,
        appIcon: 'assets/derby-logo.png',
        appTitle: '2021',
        appTitleStyle:
            GoogleFonts.abel(fontSize: 28, fontWeight: FontWeight.w600),
        seconds: 3,
        colorList: [
          Color(0xff0f5e9c),
          Color(0xff2389da),
          Color(0xff1ca3ec),
        ],
        child: LoginScreenView(),


      ),
        );
      },
      viewModelBuilder: () => SplashScreenViewModel(),
    );
  }
}
