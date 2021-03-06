import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
  var screen_color = Color(0xff2389da);
  var text_style = TextStyle(color: Colors.white, fontWeight: FontWeight.bold);
  var container_color = Color(0xFF264487);

  Widget build(BuildContext context) {
    return ViewModelBuilder<ViewRegistrationScreenViewModel>.reactive(
      builder: (BuildContext context, ViewRegistrationScreenViewModel viewModel,
          Widget _) {
        return Scaffold(
          backgroundColor: screen_color,
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(ScreenUtil().setHeight(100)),
            child: AppBar(
              title: Padding(
                padding: const EdgeInsets.only(
                  top: 30,
                ),
                child: Center(
                    child: Text(
                  'Registered Events',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: ScreenUtil().setSp(25),
                  ),
                )),
              ),
              backgroundColor: container_color,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.elliptical(200,50),
                  bottomRight: Radius.elliptical(200,50),
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
                    height: ScreenUtil().setHeight(40),
                  ),
                  Container(
                    height: ScreenUtil().setHeight(150),
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
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: ScreenUtil().setHeight(150),
                              width: ScreenUtil().setWidth(150),
                              decoration: BoxDecoration(
                                color: container_color,
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(100),
                                  bottomRight: Radius.circular(100),
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  "1232342",
                                  style: TextStyle(
                                      fontSize: ScreenUtil().setSp(20),
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: ScreenUtil().setWidth(20),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: ScreenUtil().setHeight(25),
                                ),
                                Text(
                                  'Avril Lavigne',
                                  style: GoogleFonts.josefinSans(
                                      color: Colors.black,
                                      fontSize: ScreenUtil().setSp(25),
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: ScreenUtil().setHeight(10),
                                ),
                                Text(
                                  'Type: Two days',
                                  style: GoogleFonts.josefinSans(
                                    color: Colors.black,
                                    fontSize: ScreenUtil().setSp(15),
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                                SizedBox(
                                  height: ScreenUtil().setHeight(5),
                                ),
                                Text(
                                  'Date: 12-08-21',
                                  style: GoogleFonts.josefinSans(
                                    color: Colors.black,
                                    fontSize: ScreenUtil().setSp(15),
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                                SizedBox(
                                  height: ScreenUtil().setHeight(5),
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 170),
                                  height: 40,
                                  width: 40,
                                  child: FloatingActionButton(
                                    onPressed: () {},
                                    child: Icon(Icons.qr_code),
                                    backgroundColor: container_color,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        )),
                      ],
                    ),
                  ),
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
