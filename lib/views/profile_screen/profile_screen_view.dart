import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icefishingderby/constants/colors.dart';
import 'package:icefishingderby/views/credit_card_screen/credit_card_screen_view.dart';
import 'package:icefishingderby/views/transaction_history/transaction_history_view.dart';
import 'package:icefishingderby/views/view_fish_rank_screen/view_fish_rank_screen_view.dart';
import 'package:icefishingderby/widgets/dumb_widgets/profile_card.dart';
import 'package:stacked/stacked.dart';
import 'profile_screen_view_model.dart';

class ProfileScreenView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ProfileScreenViewModel>.reactive(
      builder:
          (BuildContext context, ProfileScreenViewModel viewModel, Widget _) {
        return Scaffold(
          backgroundColor: backgroundcolor,
          appBar: AppBar(
            backgroundColor: widgetcolor,
            title: Text("Profile", style: GoogleFonts.josefinSans()),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(left: 18, right: 18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: ScreenUtil().setHeight(10),
                  ),
                  Material(
                    color: widgetcolor,
                    borderRadius: BorderRadius.circular(20),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            //crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: ScreenUtil().setHeight(100),
                                width: ScreenUtil().setWidth(100),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                      color: Color(0xFF83A1E1), width: 4),
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage('assets/profile.jpg'),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(13.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Alan Walker",
                                      style: GoogleFonts.josefinSans(
                                          fontSize: ScreenUtil().setSp(25),
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      "Fisherman",
                                      style: GoogleFonts.josefinSans(
                                        fontSize: ScreenUtil().setSp(18),
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: ScreenUtil().setHeight(20),
                  ),
                  Material(
                    borderRadius: BorderRadius.circular(20),
                    color: widgetcolor,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 15.0, bottom: 15.0, left: 5, right: 5),
                      child: Column(children: [
                        ProfileCard(
                          icon: Icons.person,
                          title: "My Information",
                          subtitle:
                              "Update your address, Email, Phone\nnumber, etc.",
                          onpressed: () {
                            viewModel.navigateToEditProfileScreen();
                          },
                        ),
                        ProfileCard(
                          icon: Icons.file_copy_outlined,
                          title: "My Event Registrations",
                          subtitle:
                              "View your current and past event registrations.\n",
                          onpressed: () {
                            viewModel.navigateToMyRegistrationScreen();
                          },
                        ),
                        ProfileCard(
                          icon: FlutterIcons.trophy_ent,
                          title: "My Prizes",
                          subtitle: "View the prizes you won.\n",
                          onpressed: () {},
                        ),

                            ProfileCard(
                          icon: FlutterIcons.fish_mco,
                          title: "My Fish",
                          subtitle: "View your fish ranking.\n",
                          onpressed: () {
                              viewModel.navigateToMyRegistrationScreen();

                          },
                        ),
                        ProfileCard(
                            icon: Icons.credit_card,
                            title: "Payment Information",
                            subtitle: "Manage Payment Cards.\n",
                            onpressed: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return CreditCardView();
                              }));
                            }),
                        ProfileCard(
                            icon: FontAwesome.sticky_note,
                            title: "Payment History",
                            subtitle: "View Past Payments.\n",
                            onpressed: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return TransactionHistoryView();
                              }));
                            }),
                        ProfileCard(
                          icon: FlutterIcons.setting_ant,
                          title: "Settings",
                          subtitle: "Manager your account.\n",
                          onpressed: () {},
                        ),
                        ProfileCard(
                          icon: FlutterIcons.logout_mco,
                          title: "Logout",
                          subtitle: "Sign out of your account.\n",
                          onpressed: () async {
                           await viewModel.auth.signOut();
                           viewModel.navigateToMyLoginScreen();
                          },
                        ),
                      ]),
                    ),
                  ),
                  //SizedBox(height: ScreenUtil().setHeight(20)),
                  // Text(
                  //   "Other Preference",
                  //   style: GoogleFonts.abel(
                  //       fontSize: ScreenUtil().setSp(25),
                  //       color: Colors.white,
                  //       fontWeight: FontWeight.w500),
                  // ),
                  // SizedBox(
                  //   height: ScreenUtil().setHeight(20),
                  // ),
                  // Material(
                  //   borderRadius: BorderRadius.circular(20),
                  //   color: Colors.blue,
                  //   child: Padding(
                  //     padding: const EdgeInsets.only(
                  //         top: 15.0, bottom: 15.0, left: 5, right: 5),
                  //     child: Column(children: [
                  //       ProfileCard(
                  //         icon: FlutterIcons.contact_phone_mco,
                  //         title: "Contact Information",
                  //         subtitle: "Manage How we should Contact You.\n",
                  //         onpressed: () {},
                  //       ),
                  //       ProfileCard(
                  //         icon: FlutterIcons.handshake_faw5s,
                  //         title: "Socializing",
                  //         subtitle: "Connect your soical accounts.\n",
                  //         onpressed: () {},
                  //       ),
                  //     ]),
                  //   ),
                  // ),
                  SizedBox(height: ScreenUtil().setHeight(20)),
                ],
              ),
            ),
          ),
        );
        ;
      },
      viewModelBuilder: () => ProfileScreenViewModel(),
    );
  }
}
