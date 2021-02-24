import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icefishingderby/classes/SplashScreenCustom.dart';
import 'package:stacked/stacked.dart';
import 'splash_screen_view_model.dart';
          
class SplashScreenView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SplashScreenViewModel>.reactive(
      builder: (BuildContext context, SplashScreenViewModel viewModel, Widget _) {
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
    //    child: LoginScreen(),


      ),
        );
      },
      viewModelBuilder: () => SplashScreenViewModel(),
    );
  }
}
