import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icefishingderby/constants/colors.dart';
import 'package:icefishingderby/widgets/dumb_widgets/registration_card.dart';
import 'package:stacked/stacked.dart';
import 'view_registration_screen_view_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ViewRegistrationScreenView extends StatefulWidget {
  @override
  _ViewRegistrationScreenViewState createState() =>
      _ViewRegistrationScreenViewState();
}

class _ViewRegistrationScreenViewState
    extends State<ViewRegistrationScreenView> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ViewRegistrationScreenViewModel>.reactive(
      builder: (BuildContext context, ViewRegistrationScreenViewModel viewModel,
          Widget _) {
        return Scaffold(
          backgroundColor: backgroundcolor,
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(ScreenUtil().setHeight(100)),
            child: AppBar(
              title: Padding(
                padding: const EdgeInsets.only(
                  top: 30,
                ),
                child: Center(
                    child: Text(
                  'Select Registrations',
                  style: GoogleFonts.montserrat(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: ScreenUtil().setSp(25),
                  ),
                )),
              ),
              backgroundColor: widgetcolor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.elliptical(200, 50),
                  bottomRight: Radius.elliptical(200, 50),
                ),
              ),
              elevation: 0,
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection('eventRegistration')
                    .where('uid', isEqualTo: viewModel.auth.currentUser.uid)
                    .snapshots(),
                builder: (context, snapshot) {
                  print(viewModel.auth.currentUser.uid);

                  return (snapshot.connectionState == ConnectionState.waiting)
                      ? Center(
                          child: CircularProgressIndicator(
                          backgroundColor: widgetcolor,
                        ))
                      : ListView.builder(
                          itemCount: snapshot.data.docs.length,
                          itemBuilder: (context, index) {
                            DocumentSnapshot data = snapshot.data.docs[index];

                            return RegisteredEvent(
                              id: data['uid'],
                              viewModel: viewModel,
                              email: data['email'],
                              name: data['name'],
                              address: data['address'],
                              dob: data['dob'],
                              docId: data['docId'],
                              ontap: () {
                                viewModel.navigateToDetailScreen(
                                    data['docId'].toString());
                              },
                            );
                          }
                          );
                }),
          ),
        );
      },
      viewModelBuilder: () => ViewRegistrationScreenViewModel(),
    );
  }
}
