import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
    var isCustomer = true;
    var _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
      return ViewModelBuilder<BottomBarViewModel>.reactive(
      builder: (BuildContext context, BottomBarViewModel viewModel, Widget _) {

        return Scaffold(
          backgroundColor: Colors.white,
          body: StreamBuilder<DocumentSnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('users')
                  .doc(_auth.currentUser.uid)
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Container(
                    height: 0,
                    width: 0,
                  );
                } else {
                  if ((snapshot.data['type'] == 'customer')) {
                    isCustomer = true;
                  } else {
                    isCustomer = false;
                  }
                  
                  return getViewForIndex(viewModel.currentIndex, isCustomer);
                }
              }), // new
          bottomNavigationBar: StreamBuilder<DocumentSnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('users')
                  .doc(_auth.currentUser.uid)
                  .snapshots(),
              builder: (context, snapshot) {

                if (snapshot.connectionState == ConnectionState.waiting){
                    Future.delayed(Duration(seconds: 2));
                }
                else

                if ((snapshot.data['type'] == 'customer')) {
                  isCustomer = true;
                } else {
                  isCustomer = false;
                }
                return BottomNavigationBar(
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
                    if (isCustomer == false)
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
                );
              }),
        );
      },
      viewModelBuilder: () => BottomBarViewModel(),
    );
  }

  Widget getViewForIndex(int index, bool isCustomer) {
    if (isCustomer == true) {
      if (index == 0) {
        return HomeScreenView();
      } else if (index == 1) {
        return RegistrationScreenView();
      } else if (index == 2) {
        return LeaderboardScreenView();
      } else if (index == 3) {
        return ProfileScreenView();
      } else {
        return HomeScreenView();
      }
    } else {
      if (index == 0) {
        return HomeScreenView();
      } else if (index == 1) {
        return RegistrationScreenView();
      } else if (index == 2) {
        return LeaderboardScreenView();
      } else if (index == 3) {
        return FishFormScreenView();
      } else if (index == 4) {
        return ProfileScreenView();
      } else {
        return HomeScreenView();
      }
    }
  }
}
