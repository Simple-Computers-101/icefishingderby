import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:icefishingderby/constants/colors.dart';
import 'package:icefishingderby/constants/fonts.dart';
import 'package:icefishingderby/views/search_screen/search_screen_view.dart';
import 'package:icefishingderby/widgets/dumb_widgets/header_curved.dart';
import 'package:icefishingderby/widgets/dumb_widgets/textField.dart';
import 'package:image_picker/image_picker.dart';
import 'package:stacked/stacked.dart';
import 'fish_form_screen_view_model.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

import 'dart:async';

class FishFormScreenView extends StatefulWidget {
  @override
  _FishFormScreenViewState createState() => _FishFormScreenViewState();
}

class _FishFormScreenViewState extends State<FishFormScreenView> {
  DocumentSnapshot data;

  final db = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<FishFormScreenViewModel>.reactive(
      builder:
          (BuildContext context, FishFormScreenViewModel viewModel, Widget _) {
        return Scaffold(
          backgroundColor: backgroundcolor,
          appBar: AppBar(
            backgroundColor: backgroundcolor,
            automaticallyImplyLeading: false,
            elevation: 0,
            title: Text(
              'Register Fish',
              style: t1,
            ),
            centerTitle: true,
          ),
          body: ListView(
            children: [
              HomeHeader2(
                title: 'Find User Registration',
              ),
              FlatButton.icon(
                onPressed: () async {
                  await FlutterBarcodeScanner.scanBarcode(
                          "#ff6666", "Cancel", true, ScanMode.QR)
                      .then((value) => () async {
                            var doc = await db
                                .collection('eventRegistration')
                                .doc(value)
                                .get();
                            print(doc.data()['email']);
                            viewModel.username = doc.data()['name'];
                            setState(() {
                              viewModel.uid = doc.data()['email'];
                            });
                          });
                },
                icon: Icon(
                  FontAwesome5Solid.qrcode,
                  color: Colors.white,
                ),
                label: Text(
                  "Scan QR Code",
                  style: t1,
                ),
                textColor: Colors.white,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Text(
                    'OR',
                    style: t1,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(3.0),
                child: GestureDetector(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.search,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                      Text(
                        "Search By Email",
                        style: t1,
                      ),
                    ],
                  ),
                  onTap: () async {
                    final result = await Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SearchScreenView()),
                    );
                    setState(() {
                      data = result;
                      viewModel.username = data['name'];
                      viewModel.uid = data['uid'];
                    });
                  },
                ),
              ),
              (data != null)
                  ? Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        color: widgetcolor,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      data['name'],
                                      style: t1,
                                    ),
                                    Icon(
                                      FontAwesome5Solid.user_friends,
                                      color: Colors.white,
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      data['docId'],
                                      style: t1,
                                    ),
                                    Icon(
                                      FontAwesome5Solid.id_card_alt,
                                      color: Colors.white,
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Flexible(
                                        child: Text(
                                      data['address'],
                                      style: t1,
                                    )),
                                    Icon(
                                      FontAwesome5Solid.home,
                                      color: Colors.white,
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  : Container(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: HomeHeader2(
                  title: 'Fish Details',
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Center(
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(4),
                      child: DropdownButtonHideUnderline(
                        child: new DropdownButton<String>(
                          hint: Text(
                            "Fish Category",
                            style: t10appColor,
                          ),
                          style: t10appColor,
                          value: viewModel.fish,
                          elevation: 2,
                          items: <String>[
                            'Salmon',
                            'Brook Trout',
                            'Togue',
                            'Muskie',
                            'Cusk',
                            'Most Perch',
                            'Largest Perch',
                          ].map((String value) {
                            return new DropdownMenuItem<String>(
                              value: value,
                              child: new Text(value),
                            );
                          }).toList(),
                          onChanged: (_) {
                            setState(() {
                              viewModel.fish = _;
                            });
                          },
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
                    viewModel.length = na;
                  },
                  icon: Tab(
                    child: Icon(
                      FontAwesome5Solid.pencil_ruler,
                      color: appColor,
                    ),
                  ),
                  hintText: "Length",
                  secureText: false,
                  borderColor: appColor,
                  focusColor: Colors.white,
                  input: TextInputType.numberWithOptions(),
                  context: null,
                  suffix: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('inch'),
                  ),
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: TextFields(
                      onChanged: (na) {
                        viewModel.lbs = na;
                      },
                      icon: Tab(
                        child: Icon(
                          FontAwesomeIcons.weightHanging,
                          color: appColor,
                        ),
                      ),
                      hintText: "Lbs",
                      secureText: false,
                      borderColor: appColor,
                      focusColor: Colors.white,
                      input: TextInputType.numberWithOptions(),
                      context: null,
                      suffix: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('lbs'),
                      ),
                    ),
                  ),
                  Expanded(
                    child: TextFields(
                      onChanged: (na) {
                        viewModel.oz = na;
                      },
                      icon: Tab(
                        child: Icon(
                          FontAwesomeIcons.weightHanging,
                          color: appColor,
                        ),
                      ),
                      hintText: "Oz",
                      secureText: false,
                      borderColor: appColor,
                      focusColor: Colors.white,
                      input: TextInputType.numberWithOptions(),
                      context: null,
                      suffix: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('oz'),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: viewModel.img == null
                      ? Text(
                          'No image selected.',
                          style: t1,
                        )
                      : Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                              height: ScreenUtil().setHeight(250),
                              width: ScreenUtil().setWidth(350),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12)),
                              child: Image.file(viewModel.img)),
                        ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: FlatButton.icon(
                  onPressed: () {
                    viewModel.getImageFromCamera();
                  },
                  icon: Icon(
                    FontAwesome5Solid.camera,
                    color: Colors.white,
                  ),
                  label: Text(
                    "Add Picture",
                    style: t1,
                  ),
                  textColor: Colors.white,
                ),
              ),
              Container(
                color: Colors.greenAccent,
                child: FlatButton(
                    color: Colors.white,
                    onPressed: () {
                      viewModel.register();
                    },
                    child: Text(
                      'SUBMIT',
                      style: t10appColor,
                    )),
              )
            ],
          ),
        );
      },
      viewModelBuilder: () => FishFormScreenViewModel(),
    );
  }
}
