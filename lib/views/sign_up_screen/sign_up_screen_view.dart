import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'sign_up_screen_view_model.dart';
          
class SignUpScreenView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SignUpScreenViewModel>.reactive(
      builder: (BuildContext context, SignUpScreenViewModel viewModel, Widget _) {
        return Scaffold(
          appBar: AppBar(),
          body: Center(
            child: Text('SignUpScreen View'),
          ),
        );
      },
      viewModelBuilder: () => SignUpScreenViewModel(),
    );
  }
}
