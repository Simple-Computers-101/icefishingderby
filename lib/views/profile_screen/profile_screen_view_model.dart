import 'package:firebase_auth/firebase_auth.dart';
import 'package:icefishingderby/core/locator.dart';
import 'package:icefishingderby/views/login_screen/login_screen_view.dart';
import 'package:icefishingderby/views/view_registration_screen/view_registration_screen_view.dart';
import 'package:logger/logger.dart';
import 'package:stacked/stacked.dart';
import 'package:icefishingderby/core/logger.dart';
import 'package:stacked_services/stacked_services.dart';

class ProfileScreenViewModel extends BaseViewModel {
  Logger log;
  final _navService = locator<NavigationService>();
    var auth = FirebaseAuth.instance;
 

  ProfileScreenViewModel() {
    this.log = getLogger(this.runtimeType.toString());
  }
  navigateToMyRegistrationScreen() {
    _navService.navigateToView(ViewRegistrationScreenView());
  }

  navigateToMyLoginScreen() {
    _navService.navigateToView(LoginScreenView());
  }


  fetchTransactionHistory() {}


}
