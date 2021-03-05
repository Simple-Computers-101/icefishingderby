import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icefishingderby/constants/colors.dart';
import 'package:icefishingderby/constants/fonts.dart';
import 'package:icefishingderby/views/login_screen/login_screen_view.dart';
import 'package:icefishingderby/widgets/dumb_widgets/app_button.dart';
import 'package:icefishingderby/widgets/dumb_widgets/field.dart';
import 'package:icefishingderby/widgets/dumb_widgets/header_curved.dart';
import 'package:icefishingderby/widgets/dumb_widgets/textField.dart';
import 'package:sign_button/sign_button.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'sign_up_screen_view_model.dart';

class SignUpScreenView extends StatefulWidget {
  @override
  _SignUpScreenViewState createState() => _SignUpScreenViewState();
}

class _SignUpScreenViewState extends State<SignUpScreenView> {
  var _passwordVisible = true;
  var email;
  var password;
  var name;
  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SignUpScreenViewModel>.reactive(
      builder:
          (BuildContext context, SignUpScreenViewModel viewModel, Widget _) {
        return SafeArea(
          child: Scaffold(
            
            body: Container(
               decoration: BoxDecoration(
            gradient: new LinearGradient(
              colors: [
                Color(0xff2389da),
                Color(0xff1ca3ec),
                Color(0xff0f5e9c),
              ],
            ),
            ),
              child: ListView(
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  Center(
                      child: Image.asset(
                    'assets/derby-logo.png',
                    height: 100,
                  )),
                  SizedBox(
                    height: 15,
                  ),
                  HomeHeader(
                    title: 'Registration',
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextFields(
                    onChanged: (na) {
                      setState(() {
                        viewModel.username = na;
                      });
                    },
                    icon: Tab(
                      child: Icon(
                        FontAwesomeIcons.userAlt,
                        color: appColor,
                      ),
                    ),
                    hintText: "Name",
                    secureText: false,
                    borderColor: appColor,
                    focusColor: Colors.white,
                    context: null,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextFields(
                    onChanged: (em) {
                      setState(() {
                        viewModel.email = em;
                      });
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
                    height: 15,
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
                      setState(() {
                        viewModel.password = pa;
                      });
                    },
                    secureText: _passwordVisible,
                    borderColor: appColor,
                    focusColor: Colors.white,
                    context: null,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                        child: Container(
                      width: 240,
                      height: 45,
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
                          border: Border.all(color: Colors.blueAccent)),
                      child: GestureDetector(
                          onTap: () {
                            //Register Using Email
                          },
                          child: Center(
                            child: Text(
                              "     Sign Up     ",
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
                                  builder: (context) => LoginScreenView()));
                        },
                        child: Text(
                          'Already have an account? Login',
                          style: t5,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
      viewModelBuilder: () => SignUpScreenViewModel(),
    );
  }
}
