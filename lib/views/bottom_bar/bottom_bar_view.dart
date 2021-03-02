import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icefishingderby/constants/colors.dart';
import 'package:icefishingderby/views/home_screen/home_screen_view.dart';
import 'package:stacked/stacked.dart';
import 'bottom_bar_view_model.dart';

class BottomBarView extends StatelessWidget {
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
            selectedItemColor: darktheme,
            unselectedIconTheme: IconThemeData(color: Colors.grey),
            elevation: 10,
            backgroundColor: Colors.white,
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
                    Icons.developer_board_sharp,
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
        return HomeScreenView();
      case 2:
        return HomeScreenView();
      case 3:
        return HomeScreenView();
      default:
        return HomeScreenView();
    }
  }
}
