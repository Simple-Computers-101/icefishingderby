import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icefishingderby/constants/colors.dart';
import 'package:icefishingderby/widgets/dumb_widgets/app_button.dart';
import 'package:icefishingderby/widgets/dumb_widgets/field.dart';
import 'package:icefishingderby/widgets/dumb_widgets/textField.dart';
import 'package:sign_button/sign_button.dart';
import 'package:stacked/stacked.dart';
import 'login_screen_view_model.dart';

class LoginScreenView extends StatefulWidget {
  @override
  _LoginScreenViewState createState() => _LoginScreenViewState();
}

class _LoginScreenViewState extends State<LoginScreenView> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoginScreenViewModel>.reactive(
      builder:
          (BuildContext context, LoginScreenViewModel viewModel, Widget _) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          backgroundColor: Color(0xFF264487),
          body: Padding(
            padding: const EdgeInsets.only(left: 12.0, right: 12.0),
            child: ListView(
              children: [
                Center(
                    child: Image.asset(
                  'assets/derby-logo.png',
                  height: 100,
                )),
                SizedBox(
                  height: 45,
                ),
                TextFields(
                  icon: Tab(
                    child: Icon(
                      Icons.email_rounded,
                      color: appColor,
                    ),
                  ),
                  hintText: "Email",
                  secureText: false,
                  borderColor: appColor,
                  focusColor: Colors.white,
                  context: null,
                ),
                TextFields(
                  icon: Tab(
                    child: Icon(
                      Icons.lock,
                      color: appColor,
                    ),
                  ),
                  hintText: "Password",
                  secureText: true,
                  borderColor: appColor,
                  focusColor: Colors.white,
                  context: null,
                ),
                SizedBox(
                  height: 35,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                      child: AppButton(
                    text: "Login",
                    onpressed: () {},
                  )),
                ),
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: Text('Or',
                      style: GoogleFonts.abel(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18)),
                ),
                SizedBox(
                  height: 20,
                ),


                
              ],
            ),
          ),
        );
      },
      viewModelBuilder: () => LoginScreenViewModel(),
    );
  }
}
