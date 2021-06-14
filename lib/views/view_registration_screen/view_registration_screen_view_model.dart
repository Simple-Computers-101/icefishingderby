import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:icefishingderby/constants/colors.dart';
import 'package:icefishingderby/core/locator.dart';
import 'package:icefishingderby/views/detail_screen/detail_screen_view.dart';
import 'package:icefishingderby/views/my_fish_screen/my_fish_screen_view.dart';
import 'package:icefishingderby/views/show_qr_code/show_qr_code_view.dart';
import 'package:logger/logger.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:stacked/stacked.dart';
import 'package:icefishingderby/core/logger.dart';
import 'package:stacked_services/stacked_services.dart';

class ViewRegistrationScreenViewModel extends BaseViewModel {
  Logger log;
  var auth = FirebaseAuth.instance;
  final _navService = locator<NavigationService>();

  ViewRegistrationScreenViewModel() {
    this.log = getLogger(this.runtimeType.toString());
  }
  navigateToDetailScreen(String registrationId) {
    _navService.navigateToView(DetailScreenView(), arguments: {"registrationId": registrationId});
  }

  navigateToFishScreen(String registrationId) {
    _navService.navigateToView(MyFishScreenView(), arguments: {"registrationId": registrationId});
  }

  openDialogWithQR({String registrationId, context}) {
    showGeneralDialog(
      barrierLabel: "QR Code",
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: Duration(milliseconds: 700),
      context: context,
      pageBuilder: (_, __, ___) {
        return Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: 350,
            child: Center(
              child: QrImage(
                foregroundColor: Colors.white,
                gapless: true,
                data: registrationId,
                version: QrVersions.auto,
                size: 150,
              ),
            ),
            margin: EdgeInsets.only(bottom: 50, left: 12, right: 12),
            decoration: BoxDecoration(
              color: backgroundcolor,
              borderRadius: BorderRadius.circular(40),
            ),
          ),
        );
      },
      transitionBuilder: (_, anim, __, child) {
        return SlideTransition(
          position: Tween(begin: Offset(0, 1), end: Offset(0, 0)).animate(anim),
          child: child,
        );
      },
    );
  }
}
