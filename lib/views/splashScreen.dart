import 'package:icefishingderby/classes/SplashScreenCustom.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AdvancedSplashScreen(
        animate: true,
        appIcon: 'assets/derby-logo.png',
        
        appTitle: '2021',
        appTitleStyle: GoogleFonts.abel(
          fontSize: 28,
          fontWeight: FontWeight.w600

        ) ,

        
        seconds: 3,
         colorList: [
         Color(0xff0f5e9c),
        Color(0xff2389da),
        Color(0xff1ca3ec),
      ],
      ),
      
    );
  }
}