import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:icefishingderby/constants/colors.dart';
import 'package:icefishingderby/constants/fonts.dart';
import 'package:icefishingderby/widgets/dumb_widgets/header_curved.dart';
import 'package:icefishingderby/widgets/dumb_widgets/textField.dart';
import 'package:stacked/stacked.dart';
import 'forgot_password_view_model.dart';

class ForgotPasswordView extends StatefulWidget {
  @override
  _ForgotPasswordViewState createState() => _ForgotPasswordViewState();
}

class _ForgotPasswordViewState extends State<ForgotPasswordView> {
  var _passwordVisible = true;
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ForgotPasswordViewModel>.reactive(
      builder:
          (BuildContext context, ForgotPasswordViewModel viewModel, Widget _) {
        return Scaffold(
            backgroundColor: backgroundcolor,
            appBar: AppBar(
              elevation: 0,
              backgroundColor: backgroundcolor,
              
            ),
            body: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: HomeHeader2(
                    title: 'Forgot Password',
                  ),
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
                  height: 5,
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
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextButton(
                      onPressed: () {

                          //Forgot Password Service

                      },
                      child: Text(
                        'Send Request',
                        style: t1,
                      )),
                )
              ],
            ));
      },
      viewModelBuilder: () => ForgotPasswordViewModel(),
    );
  }
}
