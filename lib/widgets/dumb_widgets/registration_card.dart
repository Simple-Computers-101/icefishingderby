import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:icefishingderby/constants/colors.dart';
import 'package:icefishingderby/views/view_registration_screen/view_registration_screen_view_model.dart';
import 'package:icefishingderby/widgets/dumb_widgets/detail.dart';

class RegisteredEvent extends StatelessWidget {
  final String id;
  final String name;
  final String email;
  final String address;
  final String dob;
  final String docId;
  final ontap;
  final ViewRegistrationScreenViewModel viewModel;
  const RegisteredEvent({
    Key key,
    this.id,
    this.name,
    this.email,
    this.address,
    this.viewModel,
    this.dob,
    this.docId, this.ontap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
          child: Padding(
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
                          viewModel.openDialogWithQR(
                              registrationId: docId, context: context);
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
      ),
      onTap: ontap,
    );
  }
}