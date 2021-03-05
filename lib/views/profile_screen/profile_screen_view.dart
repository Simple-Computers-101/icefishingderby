import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icefishingderby/constants/colors.dart';
import 'package:stacked/stacked.dart';
import 'profile_screen_view_model.dart';
          
class ProfileScreenView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ProfileScreenViewModel>.reactive(
      builder: (BuildContext context, ProfileScreenViewModel viewModel, Widget _) {
        return Scaffold(
          backgroundColor: darktheme,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: darktheme,
            title: Text("Profile",style: GoogleFonts.josefinSans(),),
          )
          ,
          body: Center(
            child: Text('ProfileScreen View'),
          ),
        );
      },
      viewModelBuilder: () => ProfileScreenViewModel(),
    );
  }
}
