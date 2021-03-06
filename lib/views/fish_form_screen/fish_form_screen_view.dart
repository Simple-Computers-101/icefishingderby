import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:icefishingderby/constants/colors.dart';
import 'package:icefishingderby/constants/fonts.dart';
import 'package:icefishingderby/widgets/dumb_widgets/header_curved.dart';
import 'package:icefishingderby/widgets/dumb_widgets/textField.dart';
import 'package:image_picker/image_picker.dart';
import 'package:stacked/stacked.dart';
import 'fish_form_screen_view_model.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class FishFormScreenView extends StatefulWidget {
  @override
  _FishFormScreenViewState createState() => _FishFormScreenViewState();
}

class _FishFormScreenViewState extends State<FishFormScreenView> {
  String uid;
  String fish;
  String length;
  String weight;
    File _image;
  final picker = ImagePicker();

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<FishFormScreenViewModel>.reactive(
      builder:
          (BuildContext context, FishFormScreenViewModel viewModel, Widget _) {
        return Scaffold(
          backgroundColor: Color(0xff2393D9),
          appBar: AppBar(
            backgroundColor: Color(0xff2393D9),
            elevation: 0,
            title: Text(
              'Register Fish',
              style: t1,
            ),
            centerTitle: true,
          ),
          body: ListView(
            children: [
              CircleAvatar(
                backgroundColor: Colors.white,
                child: Text(
                  '1',
                ),
              ),
              HomeHeader2(
                title: 'Find User Registration',
              ),
              FlatButton.icon(
                onPressed: () async {
                  uid = await FlutterBarcodeScanner.scanBarcode(
                      "#ff6666", "Cancel", true, ScanMode.QR);
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
              TextFields(
                icon: Tab(
                  child: Icon(FontAwesome5Solid.search),
                ),
                hintText: 'Search User',
                context: null,
                secureText: false,
                borderColor: Colors.white,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  color: appColor,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'JASON BORUN',
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'AS78834JSD324',
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                                child: Text(
                              'House 12, Street 75, LA',
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
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Text(
                    '2',
                  ),
                ),
              ),
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
                          value: fish,
                          elevation: 2,
                          items: <String>[
                            'FISH A',
                            'FISH B',
                          ].map((String value) {
                            return new DropdownMenuItem<String>(
                              value: value,
                              child: new Text(value),
                            );
                          }).toList(),
                          onChanged: (_) {
                            setState(() {
                              fish = _;
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
                    length = na;
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
                  input: TextInputType.multiline,
                  context: null,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: TextFields(
                  onChanged: (na) {
                    weight = na;
                  },
                  icon: Tab(
                    child: Icon(
                      FontAwesomeIcons.weightHanging,
                      color: appColor,
                    ),
                  ),
                  hintText: "Weight",
                  secureText: false,
                  borderColor: appColor,
                  focusColor: Colors.white,
                  input: TextInputType.multiline,
                  context: null,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
        child: _image == null
            ? Text('No image selected.', style: t1,)
            : Image.file(_image),
      ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: FlatButton.icon(
                  onPressed: getImage,
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
                    onPressed: null,
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
