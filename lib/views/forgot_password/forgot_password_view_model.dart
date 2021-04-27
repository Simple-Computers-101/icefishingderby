import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:icefishingderby/core/locator.dart';
import 'package:icefishingderby/services/firebase_auth.dart';
import 'package:logger/logger.dart';
import 'package:stacked/stacked.dart';
import 'package:icefishingderby/core/logger.dart';
import 'package:stacked_services/stacked_services.dart';

class ForgotPasswordViewModel extends BaseViewModel {
  Logger log;
  String email;

  var _auth = FirebaseAuth.instance;
  final _snackbarService = locator<SnackbarService>();

  

  sendResetEmail()   {
    
     _auth.sendPasswordResetEmail(email: email).then((_){
        _snackbarService.showSnackbar(
        message: "Please check email to reset your password", duration: Duration(seconds: 5), title: "Reset Email Sent" );
     }).catchError((error){
        _snackbarService.showSnackbar(
        message: error.message.toString(), duration: Duration(seconds: 5), title: "Error" );
     });
        
    
    
   
      
    
    
  }

  ForgotPasswordViewModel() {
    this.log = getLogger(this.runtimeType.toString());
  }
}
