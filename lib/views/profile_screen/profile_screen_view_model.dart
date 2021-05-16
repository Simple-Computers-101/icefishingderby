import 'package:icefishingderby/core/locator.dart';
import 'package:icefishingderby/views/view_registration_screen/view_registration_screen_view.dart';
import 'package:logger/logger.dart';
import 'package:stacked/stacked.dart';
import 'package:icefishingderby/core/logger.dart';
import 'package:stacked_services/stacked_services.dart';

class ProfileScreenViewModel extends BaseViewModel {
  Logger log;
  final _navService = locator<NavigationService>();

  ProfileScreenViewModel() {
    this.log = getLogger(this.runtimeType.toString());
  }
  navigateToMyRegistrationScreen() {
    _navService.navigateToView(ViewRegistrationScreenView());
  }

  fetchTransactionHistory() {}
}
