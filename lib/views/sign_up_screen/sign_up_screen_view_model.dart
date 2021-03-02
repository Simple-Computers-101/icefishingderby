import 'package:firebase_auth/firebase_auth.dart';
import 'package:icefishingderby/services/firebase_auth.dart';
import 'package:logger/logger.dart';
import 'package:stacked/stacked.dart';
import 'package:icefishingderby/core/logger.dart';

class SignUpScreenViewModel extends BaseViewModel {
  Logger log;
  String email, password, username;

  SignUpScreenViewModel() {
    this.log = getLogger(this.runtimeType.toString());
  }
  Future provideRegisteration() async {
    try {
      var reg = await AuthService().registerUser(email, password);

      await reg.user.updateProfile(displayName: username);
      await reg.user.sendEmailVerification();
      return reg;
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }
}
