import 'package:logger/logger.dart';
import 'package:stacked/stacked.dart';
import 'package:icefishingderby/core/logger.dart';

class ForgotPasswordViewModel extends BaseViewModel {
  Logger log;
  String email;
  String password;
  ForgotPasswordViewModel() {
    this.log = getLogger(this.runtimeType.toString());
  }
}
