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
                  style: GoogleFonts.josefinSans(
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
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: ScreenUtil().setHeight(10),
                  ),
                  RegisteredEvent(),
                  RegisteredEvent(),
                  RegisteredEvent(),
                  RegisteredEvent(),
                  RegisteredEvent(),
                ],
              ),
            ),
          ),
        );
      },
      viewModelBuilder: () => ViewRegistrationScreenViewModel(),
    );
  }
}

class RegisteredEvent extends StatelessWidget {
  const RegisteredEvent({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top:8.0,bottom: 8.0),
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
                            text: "DWZURyE6XJa49pDS6gtv4PkwHOn1",
                            size: 12,
                          ),
                          Detail(
                            title: "Name",
                            text: "Avril Lavigne",
                            size: 12,
                          ),
                          Detail(
                            title: "Type",
                            text: "Sat-Sun",
                            size: 12,
                          ),
                          Detail(
                            title: "Start Date",
                            text: "12-08-2021",
                            size: 12,
                          ),
                          Detail(
                            title: "End Date",
                            text: "13-08-2021",
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
                    child: FloatingActionButton(
                      onPressed: () {},
                      child: Icon(Icons.qr_code),
                      backgroundColor: widgetcolor,
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
