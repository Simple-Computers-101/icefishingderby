import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icefishingderby/constants/colors.dart';
import 'package:icefishingderby/views/fish_form_screen/fish_form_screen_view.dart';
import 'package:icefishingderby/views/home_screen/home_screen_view.dart';
import 'package:icefishingderby/views/leaderboard_screen/leaderboard_screen_view.dart';
import 'package:icefishingderby/views/profile_screen/profile_screen_view.dart';
import 'package:icefishingderby/views/registration_screen/registration_screen_view.dart';
import 'package:stacked/stacked.dart';
import 'bottom_bar_view_model.dart';

class BottomBarView extends StatelessWidget {
  BottomBarView({this.type});
  final type;
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<BottomBarViewModel>.reactive(
      builder: (BuildContext context, BottomBarViewModel viewModel, Widget _) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: getViewForIndex(viewModel.currentIndex), // new
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            selectedLabelStyle: GoogleFonts.rubik(),
            selectedItemColor: Colors.white,

            unselectedIconTheme: IconThemeData(color: Colors.grey),
            elevation: 10,
            backgroundColor: widgetcolor,
            onTap: viewModel.setIndex, // new
            currentIndex: viewModel.currentIndex, // new
            items: [
              BottomNavigationBarItem(
                  icon: Icon(
                    FlutterIcons.home_ant,
                    size: 25,
                  ),
                  label: ""),
              BottomNavigationBarItem(
                  icon: Icon(
                    FlutterIcons.file_document_box_multiple_outline_mco,
                    size: 25,
                  ),
                  label: ""),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.leaderboard,
                    size: 25,
                  ),
                  label: ""),
              BottomNavigationBarItem(
                  icon: Icon(
                    FlutterIcons.fish_mco,
                    size: 25,
                  ),
                  label: ""),
              BottomNavigationBarItem(
                  icon: Icon(
                    FlutterIcons.person_mdi,
                    size: 25,
                  ),
                  label: ""),
            ],
          ),
        );
      },
      viewModelBuilder: () => BottomBarViewModel(),
    );
  }

  Widget getViewForIndex(int index) {
    print(index);
    switch (index) {
      case 0:
        return HomeScreenView();
      case 1:
        return RegistrationScreenView();
      case 2:
        return LeaderboardScreenView();
      case 3:
        return FishFormScreenView();
      case 4:
        return ProfileScreenView();
      default:
        return HomeScreenView();
    }
  }
}
