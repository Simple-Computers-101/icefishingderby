import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icefishingderby/widgets/dumb_widgets/app_button.dart';
import 'package:icefishingderby/widgets/dumb_widgets/field.dart';
import 'package:sign_button/sign_button.dart';
import 'package:stacked/stacked.dart';
import 'sign_up_screen_view_model.dart';

class SignUpScreenView extends StatefulWidget {
  @override
  _SignUpScreenViewState createState() => _SignUpScreenViewState();
}

class _SignUpScreenViewState extends State<SignUpScreenView> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SignUpScreenViewModel>.reactive(
      builder:
          (BuildContext context, SignUpScreenViewModel viewModel, Widget _) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          backgroundColor: Color(0xFF264487),
          body: Padding(
            padding: const EdgeInsets.only(left: 12.0, right: 12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                    child: Image.asset(
                  'assets/derby-logo.png',
                  height: 80,
                )),
                SizedBox(
                  height: 20,
                ),
                Text("Sign Up",
                    style: GoogleFonts.nunito(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold)),
                SizedBox(
                  height: 10,
                ),
                Field(
                  hinttext: 'UserName',
                  type: false,
                  onchanged: (value) {
                    //username = value;
                  },
                ),
                Field(
                  hinttext: 'Email',
                  type: false,
                  onchanged: (value) {
                    //email = value;
                  },
                ),
                Field(
                  hinttext: 'Password',
                  type: true,
                  onchanged: (value) {
                    //password = value;
                  },
                ),
                 SizedBox(
                  height: 20,
                ),
                Center(
                    child: AppButton(
                  text: "SignUp",
                  onpressed: () {},
                )),
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: Text('Or SignUp With',
                      style: GoogleFonts.abel(
                          color: Colors.white, fontWeight: FontWeight.bold)),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SignInButton.mini(
                      buttonType: ButtonType.google,
                      onPressed: () {},
                    ),
                    SignInButton.mini(
                      buttonType: ButtonType.apple,
                      onPressed: () {},
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
      viewModelBuilder: () => SignUpScreenViewModel(),
    );
  }
}
