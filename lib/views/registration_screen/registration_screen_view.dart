import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:icefishingderby/classes/time_date.dart';
import 'package:icefishingderby/constants/colors.dart';
import 'package:icefishingderby/constants/fonts.dart';
import 'package:icefishingderby/constants/size.dart';
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

  var caseStatus;
  var age;

  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<RegistrationScreenViewModel>.reactive(
      builder: (BuildContext context, RegistrationScreenViewModel viewModel,
          Widget _) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: appColor,
            //shadowColor: ,
            title: Text(
              'Registration Form',
              style: t1,
            ),
            centerTitle: true,
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView(
              children: [
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 26),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(38)),
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                          color: Colors.black45,
                          blurRadius: 8,
                          offset: Offset(4, 4),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 30),
                      child: Center(
                        child: DropdownButtonHideUnderline(
                          child: new DropdownButton<String>(
                            hint: Text(
                              "Registration Days",
                              style: t10appColor,
                            ),
                            style: t10appColor,
                            value: caseStatus,
                            elevation: 2,
                            items: <String>['Saturday', 'Sunday', 'Both']
                                .map((String value) {
                              return new DropdownMenuItem<String>(
                                value: value,
                                child: new Text(value),
                              );
                            }).toList(),
                            onChanged: (_) {
                              setState(() {
                                caseStatus = _;
                              });
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
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
                SizedBox(
                  height: 15,
                ),
                FlatButton(
                  onPressed: _light
                      ? () async {
                          final selectedDate = await _selectedDateTime(context);

                          setState(() {
                            dateOfBirth = DateMonthYear(selectedDate);
                          });
                        }
                      : null,
                  child: Padding(
                    padding: EdgeInsets.only(left: 10, right: 10, top: 5),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(38)),
                          boxShadow: <BoxShadow>[
                            BoxShadow(
                              color: Colors.black45,
                              blurRadius: 8,
                              offset: Offset(4, 4),
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 38),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  "Date of Birth",
                                  style: t10appColor,
                                ),
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
                SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 26),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(38)),
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                          color: Colors.black45,
                          blurRadius: 8,
                          offset: Offset(4, 4),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 30),
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
                              return new DropdownMenuItem<String>(
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
                SizedBox(
                  height: 15,
                ),
                TextFields(
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
                SizedBox(
                  height: 15,
                ),
                TextFields(
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
                SizedBox(
                  height: 15,
                ),
                TextFields(
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
                SizedBox(
                  height: 15,
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
