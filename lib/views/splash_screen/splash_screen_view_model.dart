import 'package:firebase_auth/firebase_auth.dart';
import 'package:icefishingderby/core/locator.dart';
import 'package:icefishingderby/views/home_screen/home_screen_view.dart';
import 'package:icefishingderby/views/login_screen/login_screen_view.dart';
import 'package:logger/logger.dart';
import 'package:stacked/stacked.dart';
import 'package:icefishingderby/core/logger.dart';
import 'package:stacked_services/stacked_services.dart';

class SplashScreenViewModel extends BaseViewModel {
  Logger log;
  final _navService = locator<NavigationService>();
   var auth = FirebaseAuth.instance;
    

  navigateToHome(){
    _navService.navigateToView(HomeScreenView());

  }

  navigateToLoginScreen(){
    _navService.navigateToView(LoginScreenView());
  }

  SplashScreenViewModel() {
    this.log = getLogger(this.runtimeType.toString());
  }
}
