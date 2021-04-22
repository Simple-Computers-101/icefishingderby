import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icefishingderby/constants/colors.dart';
import 'package:icefishingderby/widgets/dumb_widgets/detail.dart';
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
                  'Events Registrations',
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
                        .snapshots() ,
                    builder: (context, snapshot) {

                      print(viewModel.auth.currentUser.uid);
                      
                      return (snapshot.connectionState ==
                              ConnectionState.waiting)
                          ? Center(
                              child: CircularProgressIndicator(
                              backgroundColor: widgetcolor,
                            ))
                          : ListView.builder(
                              itemCount: snapshot.data.docs.length,
                              itemBuilder: (context, index) {
                                 DocumentSnapshot data =
                                    snapshot.data.docs[index];

                                return RegisteredEvent(
                                     id: data['uid'],
                                    viewModel: viewModel,
                                    email: data['email'],
                                    name: data['name'],
                                    address: data['address'],
                                    dob: data['dob'],
                                    docId: data['docId'],
                                   

                                    
                                );
                              });
                    }),
          ),
        );
      },
      viewModelBuilder: () => ViewRegistrationScreenViewModel(),
    );
  }
}

class RegisteredEvent extends StatelessWidget {

  final String id;
  final String name;
  final String email;
  final String address;
  final String dob;
  final String docId;
  final ViewRegistrationScreenViewModel viewModel;
  const RegisteredEvent({
    Key key, this.id, this.name, this.email, this.address, this.viewModel, this.dob, this.docId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
      child: Container(
        height: ScreenUtil().setHeight(110),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: ScreenUtil().setHeight(110),
                  width: ScreenUtil().setWidth(300),
                  decoration: BoxDecoration(
                    color: widgetcolor,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(100),
                      bottomRight: Radius.circular(100),
                    ),
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 8.0, top: 8.0, bottom: 5.0),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Detail(
                            title: "ID",
                            text: docId,
                            size: 12,
                          ),
                          Detail(
                            title: "Name",
                            text: name,
                            size: 12,
                          ),
                          Detail(
                            title: "Email",
                            text: email,
                            size: 12,
                          ),
                          Detail(
                            title: "Address",
                            text: address,
                            size: 12,
                          ),
                          Detail(
                            title: "Date of Birth",
                            text: dob,
                            size: 12,
                          ),
                        ]),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: ScreenUtil().setHeight(60),
                    width: ScreenUtil().setWidth(60),
                    child: MaterialButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100.0)),
                      onPressed: () {
                         // viewModel.navigateToQrScreen(registrationId: docId);
                         viewModel.openDialogWithQR(registrationId: docId, context: context);
                      },
                      child: Icon(
                        Icons.qr_code,
                        color: Colors.white,
                      ),
                      color: widgetcolor,
                    ),
                  ),
                ),
              ],
            )),
          ],
        ),
      ),
    );
  }
}
