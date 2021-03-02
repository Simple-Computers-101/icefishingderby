import 'package:firebase_auth/firebase_auth.dart';
import 'package:icefishingderby/services/firebase_auth.dart';
import 'package:logger/logger.dart';
import 'package:stacked/stacked.dart';
import 'package:icefishingderby/core/logger.dart';

class LoginScreenViewModel extends BaseViewModel {
  Logger log;
  bool checkedValue = false;
  String email, password;

  LoginScreenViewModel() {
    this.log = getLogger(this.runtimeType.toString());
  }
  Future provideEmailSign() async {
    if (email != null && password != null) {
      try {
        var user = await AuthService().emailAuth(email, password);
        if (user.user.emailVerified) {
          return user;
        } else
          throw FirebaseAuthException(
              message: "Email not verified.", code: "092");
      } on FirebaseAuthException catch (_) {
        return _.message;
      }
    }
  }

  Future provideGoogleSign() async {
    try {
      var uc = await AuthService().googleAuth();
      return uc;
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  Future provideAppleSign() async {
    try {
      var uc = await AuthService().appleAuth();
      return uc;
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }
}
