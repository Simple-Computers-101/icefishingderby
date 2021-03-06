import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icefishingderby/classes/time_date.dart';
import 'package:icefishingderby/constants/colors.dart';
import 'package:icefishingderby/constants/fonts.dart';
import 'package:icefishingderby/constants/size.dart';
import 'package:icefishingderby/widgets/dumb_widgets/app_button.dart';
import 'package:icefishingderby/widgets/dumb_widgets/header_curved.dart';
import 'package:icefishingderby/widgets/dumb_widgets/textField.dart';
import 'package:stacked/stacked.dart';
import 'registration_screen_view_model.dart';

class RegistrationScreenView extends StatefulWidget {
  @override
  _RegistrationScreenViewState createState() => _RegistrationScreenViewState();
}

class _RegistrationScreenViewState extends State<RegistrationScreenView> {
  var name;

  Future<DateTime> _selectedDateTime(BuildContext context) => showDatePicker(
      context: context,
      initialDate: DateTime(1999),
      firstDate: DateTime(1940),
      lastDate: DateTime.now());

  bool _light = true;

  String dateOfBirth = DateMonthYear(DateTime.now());

  var days;
  var age;

  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<RegistrationScreenViewModel>.reactive(
      builder: (BuildContext context, RegistrationScreenViewModel viewModel,
          Widget _) {
        return Scaffold(
          backgroundColor: Color(0xff2389da),
          appBar: AppBar(
            backgroundColor: Color(0xff2389da),
            elevation: 0,
            //shadowColor: ,
            // title: Text(
            //   'Registration Form',
            //   style: t1,
            // ),
            // centerTitle: true,
          ),
          body: Padding(
            padding: const EdgeInsets.only(left: 10.0, right: 10),
            child: ListView(
              
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 30.0, right: 39),
                          child: Container(
                            color: Colors.white,
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Registration Form",
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.josefinSans(
                                      color: appColor,
                                      fontSize: ScreenUtil().setSp(30),
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  color: Color(0xff2389da),
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(50),
                                      bottomRight: Radius.circular(50))),
                              height: ScreenUtil().setHeight(47),
                              width: ScreenUtil().setWidth(70),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  color: Color(0xff2389da),
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(50),
                                      bottomLeft: Radius.circular(50))),
                              height: ScreenUtil().setHeight(47),
                              width: ScreenUtil().setWidth(70),
                            ),
                          ],
                        ),
                      ],
                    ),
                    // Padding(
                    //   padding: const EdgeInsets.only(top: 20.0),
                    //   child: Text(
                    //     "Personal Information",
                    //     style: GoogleFonts.josefinSans(
                    //         color: appColor,
                    //         fontSize: ScreenUtil().setSp(20),
                    //         fontWeight: FontWeight.bold),
                    //   ),
                    // ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15.0, bottom: 15),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 30.0, left: 10, right: 10, bottom: 30),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Padding(
                            //   padding:
                            //       const EdgeInsets.only(bottom: 10),
                            //   child: Text(
                            //     "Personal Information",
                            //     style: GoogleFonts.josefinSans(
                            //         color: Colors.white,
                            //         fontSize: ScreenUtil().setSp(23),
                            //         fontWeight: FontWeight.bold),
                            //   ),
                            // ),

                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: HomeHeader2(
                                title: 'Personal Information',
                              ),
                            ),
                            Material(
                              borderRadius: BorderRadius.circular(20),
                              elevation: 4,
                              shadowColor: Colors.white,
                              color: appColor,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    top: 30.0, left: 10, right: 10, bottom: 30),
                                child: Column(
                                  children: [
                                    TextFields(
                                      onChanged: (na) {
                                        name = na;
                                      },
                                      icon: Tab(
                                        child: Icon(
                                          FontAwesomeIcons.userAlt,
                                          color: appColor,
                                        ),
                                      ),
                                      hintText: "Name",
                                      secureText: false,
                                      borderColor: appColor,
                                      focusColor: Colors.white,
                                      context: null,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 5.0),
                                      child: TextFields(
                                        onChanged: (na) {
                                          name = na;
                                        },
                                        icon: Tab(
                                          child: Icon(
                                            Icons.email_rounded,
                                            color: appColor,
                                          ),
                                        ),
                                        hintText: "Email",
                                        secureText: false,
                                        borderColor: appColor,
                                        focusColor: Colors.white,
                                        input: TextInputType.emailAddress,
                                        context: null,
                                      ),
                                    ),
                                    FlatButton(
                                      onPressed: _light
                                          ? () async {
                                              final selectedDate =
                                                  await _selectedDateTime(
                                                      context);

                                              setState(() {
                                                dateOfBirth =
                                                    DateMonthYear(selectedDate);
                                              });
                                            }
                                          : null,
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                            left: 10, right: 10, top: 10),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                          ),
                                          child: Container(
                                            height: 50,
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(38)),
                                              boxShadow: <BoxShadow>[
                                                BoxShadow(
                                                  color: Colors.black45,
                                                  blurRadius: 8,
                                                  offset: Offset(4, 4),
                                                ),
                                              ],
                                            ),
                                            child: Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 14),
                                              child: Center(
                                                child: Row(
                                                  // mainAxisAlignment:
                                                  //     MainAxisAlignment.spaceBetween,
                                                  children: <Widget>[
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              right: 5.0),
                                                      child: Icon(
                                                        Icons.cake,
                                                        color: appColor,
                                                        size: 30,
                                                      ),
                                                    ),
                                                    // Text(
                                                    //   "Date of Birth",
                                                    //   style: t10appColor,
                                                    // ),
                                                    Text(
                                                      dateOfBirth,
                                                      style: t10appColor,
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 10.0),
                                      child: TextFields(
                                        onChanged: (na) {
                                          name = na;
                                        },
                                        icon: Tab(
                                          child: Icon(
                                            FontAwesomeIcons.solidAddressBook,
                                            color: appColor,
                                          ),
                                        ),
                                        hintText: "Address",
                                        secureText: false,
                                        borderColor: appColor,
                                        focusColor: Colors.white,
                                        input: TextInputType.multiline,
                                        context: null,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 5.0),
                                      child: TextFields(
                                        onChanged: (na) {
                                          name = na;
                                        },
                                        icon: Tab(
                                          child: Icon(
                                            FontAwesomeIcons.phoneAlt,
                                            color: appColor,
                                          ),
                                        ),
                                        hintText: "Contact Number",
                                        secureText: false,
                                        borderColor: appColor,
                                        focusColor: Colors.white,
                                        input: TextInputType.phone,
                                        context: null,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            // Padding(
                            //   padding:
                            //       const EdgeInsets.only(top: 20.0, bottom: 10),
                            //   child: Text(
                            //     "Event Information",
                            //     style: GoogleFonts.josefinSans(
                            //         color: Colors.white,
                            //         fontSize: ScreenUtil().setSp(20),
                            //         fontWeight: FontWeight.bold),
                            //   ),
                            // ),

                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: HomeHeader2(
                                title: 'Event Information',
                              ),
                            ),
                            Material(
                              borderRadius: BorderRadius.circular(20),
                              elevation: 4,
                              shadowColor: Colors.white,
                              color: appColor,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    top: 30.0, left: 10, right: 10, bottom: 30),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 8, horizontal: 26),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(38)),
                                          boxShadow: <BoxShadow>[
                                            BoxShadow(
                                              color: Colors.black45,
                                              blurRadius: 8,
                                              offset: Offset(4, 4),
                                            ),
                                          ],
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 30),
                                          child: Center(
                                            child: DropdownButtonHideUnderline(
                                              child: new DropdownButton<String>(
                                                hint: Text(
                                                  "Age Group",
                                                  style: t10appColor,
                                                ),
                                                style: t10appColor,
                                                value: age,
                                                elevation: 2,
                                                items: <String>[
                                                  '14 And Over',
                                                  '13 And Under',
                                                ].map((String value) {
                                                  return new DropdownMenuItem<
                                                      String>(
                                                    value: value,
                                                    child: new Text(value),
                                                  );
                                                }).toList(),
                                                onChanged: (_) {
                                                  setState(() {
                                                    age = _;
                                                  });
                                                },
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 8, horizontal: 26),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(38)),
                                          boxShadow: <BoxShadow>[
                                            BoxShadow(
                                              color: Colors.black45,
                                              blurRadius: 8,
                                              offset: Offset(4, 4),
                                            ),
                                          ],
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 30),
                                          child: Center(
                                            child: DropdownButtonHideUnderline(
                                              child: new DropdownButton<String>(
                                                hint: Text(
                                                  "Registration Days",
                                                  style: t10appColor,
                                                ),
                                                style: t10appColor,
                                                value: days,
                                                elevation: 2,
                                                items: <String>[
                                                  'Saturday',
                                                  'Sunday',
                                                  'Both'
                                                ].map((String value) {
                                                  return new DropdownMenuItem<
                                                      String>(
                                                    value: value,
                                                    child: new Text(value),
                                                  );
                                                }).toList(),
                                                onChanged: (_) {
                                                  setState(() {
                                                    days = _;
                                                  });
                                                },
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),

                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: HomeHeader2(
                                title: 'Registration Fee',
                              ),
                            ),

                            Card(
                              shadowColor: Colors.black,
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              elevation: 2,
                              child: Padding(
                                padding: const EdgeInsets.all(15),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Total Cost',
                                      style: t10appColor,
                                    ),
                                    Text(
                                      returnTicketCost(
                                                  ageGroup: age, days: days)
                                              .toString() +
                                          '\$',
                                      style: t10appColor,
                                    )
                                  ],
                                ),
                              ),
                            ),

                            Center(
                              child: Padding(
                                padding: const EdgeInsets.only(top: 20.0),
                                child: FlatButton(
                                  
                                  color: Colors.white,
                                  onPressed: () {},
                                  child: Padding(
                                    padding: const EdgeInsets.all(13),
                                    child: Text(
                                      'Register',
                                      style: t10appColor,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    // Column(
                    //   children: [
                    // SizedBox(
                    //   height: 20,
                    // ),
                    // Padding(
                    //   padding:
                    //       EdgeInsets.symmetric(vertical: 8, horizontal: 26),
                    //   child: Container(
                    //     decoration: BoxDecoration(
                    //       color: Colors.white,
                    //       borderRadius: BorderRadius.all(Radius.circular(38)),
                    //       boxShadow: <BoxShadow>[
                    //         BoxShadow(
                    //           color: Colors.black45,
                    //           blurRadius: 8,
                    //           offset: Offset(4, 4),
                    //         ),
                    //       ],
                    //     ),
                    //     child: Padding(
                    //       padding: EdgeInsets.symmetric(horizontal: 30),
                    //       child: Center(
                    //         child: DropdownButtonHideUnderline(
                    //           child: new DropdownButton<String>(
                    //             hint: Text(
                    //               "Registration Days",
                    //               style: t10appColor,
                    //             ),
                    //             style: t10appColor,
                    //             value: caseStatus,
                    //             elevation: 2,
                    //             items: <String>['Saturday', 'Sunday', 'Both']
                    //                 .map((String value) {
                    //               return new DropdownMenuItem<String>(
                    //                 value: value,
                    //                 child: new Text(value),
                    //               );
                    //             }).toList(),
                    //             onChanged: (_) {
                    //               setState(() {
                    //                 caseStatus = _;
                    //               });
                    //             },
                    //           ),
                    //         ),
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    // SizedBox(
                    //   height: 15,
                    // ),
                    // TextFields(
                    //   onChanged: (na) {
                    //     name = na;
                    //   },
                    //   icon: Tab(
                    //     child: Icon(
                    //       FontAwesomeIcons.userAlt,
                    //       color: appColor,
                    //     ),
                    //   ),
                    //   hintText: "Name",
                    //   secureText: false,
                    //   borderColor: appColor,
                    //   focusColor: Colors.white,
                    //   context: null,
                    // ),
                    // SizedBox(
                    //   height: 15,
                    // ),
                    // FlatButton(
                    //   onPressed: _light
                    //       ? () async {
                    //           final selectedDate =
                    //               await _selectedDateTime(context);

                    //           setState(() {
                    //             dateOfBirth = DateMonthYear(selectedDate);
                    //           });
                    //         }
                    //       : null,
                    //   child: Padding(
                    //     padding: EdgeInsets.only(left: 10, right: 10, top: 5),
                    //     child: Container(
                    //       decoration: BoxDecoration(
                    //         borderRadius: BorderRadius.circular(5),
                    //       ),
                    //       child: Container(
                    //         height: 50,
                    //         decoration: BoxDecoration(
                    //           color: Colors.white,
                    //           borderRadius:
                    //               BorderRadius.all(Radius.circular(38)),
                    //           boxShadow: <BoxShadow>[
                    //             BoxShadow(
                    //               color: Colors.black45,
                    //               blurRadius: 8,
                    //               offset: Offset(4, 4),
                    //             ),
                    //           ],
                    //         ),
                    //         child: Padding(
                    //           padding: EdgeInsets.symmetric(horizontal: 38),
                    //           child: Center(
                    //             child: Row(
                    //               mainAxisAlignment:
                    //                   MainAxisAlignment.spaceBetween,
                    //               children: <Widget>[
                    //                 Text(
                    //                   "Date of Birth",
                    //                   style: t10appColor,
                    //                 ),
                    //                 Text(
                    //                   dateOfBirth,
                    //                   style: t10appColor,
                    //                 )
                    //               ],
                    //             ),
                    //           ),
                    //         ),
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    // SizedBox(
                    //   height: 15,
                    // ),
                    // Padding(
                    //   padding:
                    //       EdgeInsets.symmetric(vertical: 8, horizontal: 26),
                    //   child: Container(
                    //     decoration: BoxDecoration(
                    //       color: Colors.white,
                    //       borderRadius: BorderRadius.all(Radius.circular(38)),
                    //       boxShadow: <BoxShadow>[
                    //         BoxShadow(
                    //           color: Colors.black45,
                    //           blurRadius: 8,
                    //           offset: Offset(4, 4),
                    //         ),
                    //       ],
                    //     ),
                    //     child: Padding(
                    //       padding: EdgeInsets.symmetric(horizontal: 30),
                    //       child: Center(
                    //         child: DropdownButtonHideUnderline(
                    //           child: new DropdownButton<String>(
                    //             hint: Text(
                    //               "Age Group",
                    //               style: t10appColor,
                    //             ),
                    //             style: t10appColor,
                    //             value: age,
                    //             elevation: 2,
                    //             items: <String>[
                    //               '14 And Over',
                    //               '13 And Under',
                    //             ].map((String value) {
                    //               return new DropdownMenuItem<String>(
                    //                 value: value,
                    //                 child: new Text(value),
                    //               );
                    //             }).toList(),
                    //             onChanged: (_) {
                    //               setState(() {
                    //                 age = _;
                    //               });
                    //             },
                    //           ),
                    //         ),
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    //     SizedBox(
                    //       height: 15,
                    //     ),
                    //     TextFields(
                    //       onChanged: (na) {
                    //         name = na;
                    //       },
                    //       icon: Tab(
                    //         child: Icon(
                    //           FontAwesomeIcons.solidAddressBook,
                    //           color: appColor,
                    //         ),
                    //       ),
                    //       hintText: "Address",
                    //       secureText: false,
                    //       borderColor: appColor,
                    //       focusColor: Colors.white,
                    //       input: TextInputType.multiline,
                    //       context: null,
                    //     ),
                    //     SizedBox(
                    //       height: 15,
                    //     ),
                    //     TextFields(
                    //       onChanged: (na) {
                    //         name = na;
                    //       },
                    //       icon: Tab(
                    //         child: Icon(
                    //           Icons.email_rounded,
                    //           color: appColor,
                    //         ),
                    //       ),
                    //       hintText: "Email",
                    //       secureText: false,
                    //       borderColor: appColor,
                    //       focusColor: Colors.white,
                    //       input: TextInputType.emailAddress,
                    //       context: null,
                    //     ),
                    //     SizedBox(
                    //       height: 15,
                    //     ),
                    //     TextFields(
                    //       onChanged: (na) {
                    //         name = na;
                    //       },
                    //       icon: Tab(
                    //         child: Icon(
                    //           FontAwesomeIcons.phoneAlt,
                    //           color: appColor,
                    //         ),
                    //       ),
                    //       hintText: "Contact Number",
                    //       secureText: false,
                    //       borderColor: appColor,
                    //       focusColor: Colors.white,
                    //       input: TextInputType.phone,
                    //       context: null,
                    //     ),
                    //     SizedBox(
                    //       height: 15,
                    //     ),
                    //   ],
                    // ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
      viewModelBuilder: () => RegistrationScreenViewModel(),
    );
  }
}
