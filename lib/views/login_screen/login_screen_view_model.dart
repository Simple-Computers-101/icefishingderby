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
        return await AuthService().emailAuth(email, password);
      } on Exception catch (_) {
        return null;
      }
    }
  }

  Future provideGoogleSign() async {
    var uc = await AuthService().googleAuth();
    return uc;
  }

  Future provideAppleSign() async {
    var uc = await AuthService().appleAuth();
    if (uc != null)
      print("User exists");
    else
      print("User null");
  }
}
