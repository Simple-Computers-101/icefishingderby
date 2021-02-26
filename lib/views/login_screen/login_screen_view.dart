import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:icefishingderby/constants/colors.dart';
import 'package:icefishingderby/constants/fonts.dart';
import 'package:icefishingderby/views/sign_up_screen/sign_up_screen_view.dart';

import 'package:icefishingderby/widgets/dumb_widgets/textField.dart';
import 'package:sign_button/sign_button.dart';
import 'package:stacked/stacked.dart';
import 'login_screen_view_model.dart';

class LoginScreenView extends StatefulWidget {
  @override
  _LoginScreenViewState createState() => _LoginScreenViewState();
}

class _LoginScreenViewState extends State<LoginScreenView> {
  var _passwordVisible = true;
  var email;
  var password;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoginScreenViewModel>.reactive(
      builder:
          (BuildContext context, LoginScreenViewModel viewModel, Widget _) {
        return Scaffold(
          backgroundColor: Colors.transparent,
          body: Container(
            decoration: BoxDecoration(
              // gradient: new LinearGradient(
              //   colors: [
              //     Color(0xff2389da),
              //     Color(0xff1ca3ec),
              //     Color(0xff0f5e9c),
              //   ],
              // ),
              color: Color(0xFF264487),
            ),
            child: Column(
              children: [
                Expanded(
                  flex: 2,
                  child: Center(
                      child: Image.asset(
                    'assets/derby-logo.png',
                    height: 120,
                  )),
                ),
                Expanded(
                    flex: 5,
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(50),
                              topRight: Radius.circular(50)),
                          color: Colors.black),
                      child: ListView(
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextFields(
                                onChanged: (em) {
                                  email = em;
                                },
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
                              SizedBox(
                                height: 20,
                              ),
                              TextFields(
                                show: IconButton(
                                  icon: Icon(
                                    _passwordVisible
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    color: Theme.of(context).primaryColorDark,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      _passwordVisible = !_passwordVisible;
                                    });
                                  },
                                ),
                                icon: Tab(
                                  child: Icon(
                                    Icons.lock,
                                    color: appColor,
                                  ),
                                ),
                                hintText: "Password",
                                onChanged: (pa) {
                                  password = pa;
                                },
                                secureText: _passwordVisible,
                                borderColor: appColor,
                                focusColor: Colors.white,
                                context: null,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              GestureDetector(
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 28.0),
                                  child: Align(
                                    alignment: Alignment.centerRight,
                                    child: Text('Forgot Your Password?',
                                        style: GoogleFonts.abel(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 13)),
                                  ),
                                ),
                                onTap: () {},
                              ),
                              SizedBox(
                                height: 25,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Center(
                                    child: Container(
                                  width: 240,
                                  height: 40,
                                  decoration: BoxDecoration(
                                      boxShadow: <BoxShadow>[
                                        BoxShadow(
                                          color: Colors.black45,
                                          blurRadius: 8,
                                          offset: Offset(4, 4),
                                        ),
                                      ],
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(25),
                                      border: Border.all(
                                          color: Colors.blueAccent)),
                                  child: GestureDetector(
                                      onTap: () {
                                        //Login Using Email
                                      },
                                      child: Center(
                                        child: Text(
                                          "     Login     ",
                                          style: t10appColor,
                                        ),
                                      )),
                                )),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Center(
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                SignUpScreenView()),
                                      );
                                    },
                                    child: Text(
                                        'Dont have an account? Sign Up',
                                        style: GoogleFonts.abel(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 15)),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Center(
                                  child: Text(
                                    'OR',
                                    style: GoogleFonts.abel(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),
                                ),
                              ),
                              Center(
                                child: Text(
                                    'Create account using social media',
                                    style: GoogleFonts.abel(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 15)),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SignInButton.mini(
                                    buttonType: ButtonType.google,
                                    onPressed: () {
                                      //Google SignIn
                                    },
                                  ),
                                  SignInButton.mini(
                                    buttonType: ButtonType.apple,
                                    onPressed: () {
                                      //Apple SignIn
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    )),
              ],
            ),
          ),
        );
      },
      viewModelBuilder: () => LoginScreenViewModel(),
    );
  }
}
