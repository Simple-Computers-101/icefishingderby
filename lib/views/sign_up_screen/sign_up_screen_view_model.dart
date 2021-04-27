import 'package:firebase_auth/firebase_auth.dart';
import 'package:icefishingderby/core/locator.dart';
import 'package:icefishingderby/services/firebase_auth.dart';
import 'package:icefishingderby/views/login_screen/login_screen_view.dart';
import 'package:logger/logger.dart';
import 'package:stacked/stacked.dart';
import 'package:icefishingderby/core/logger.dart';
import 'package:stacked_services/stacked_services.dart';

class SignUpScreenViewModel extends BaseViewModel {
  Logger log;
  String email, password, username;
  final _navService = locator<NavigationService>();
  final _snackbarService = locator<SnackbarService>();

  SignUpScreenViewModel() {
    this.log = getLogger(this.runtimeType.toString());
  }
  Future provideRegisteration() async {
    try {
      var reg = await AuthService().registerUser(email, password).then((_) async {
       await _.user.updateProfile(displayName: username);
        await _.user.sendEmailVerification().then((_) {
          _snackbarService.showSnackbar(
              message: "Please check verification email", title: "Email Sent");
        });
        _snackbarService.showSnackbar(
            message: "Tap here to login",
            title: "User Registered",
            onTap: navigateToLoginScreen());
      }).catchError((err) {
        _snackbarService.showSnackbar(message: (err.message==null)?"All fields must be filled":err.message.toString(), title: "Error");
      });

    
       
       
      

      return reg;
    } on FirebaseAuthException catch (e) {
      // _snackbarService.showSnackbar(message: e.message.toString(), title: "Error",  );
      return e.message;
    }
  }

  navigateToLoginScreen() {
    _navService.navigateToView(LoginScreenView());
  }
}
