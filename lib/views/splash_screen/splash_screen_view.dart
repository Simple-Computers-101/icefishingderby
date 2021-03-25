import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icefishingderby/classes/SplashScreenCustom.dart';
import 'package:icefishingderby/constants/colors.dart';
import 'package:icefishingderby/views/leaderboard_screen/leaderboard_screen_view.dart';
import 'package:icefishingderby/views/my_fish_screen/my_fish_screen_view.dart';
import 'package:stacked/stacked.dart';
import '../view_registration_screen/view_registration_screen_view.dart';
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
            child: LeaderboardScreenView(),
          ),
        );
      },
      viewModelBuilder: () => SplashScreenViewModel(),
    );
  }
}
