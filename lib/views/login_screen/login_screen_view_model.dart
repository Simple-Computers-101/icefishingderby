import 'package:logger/logger.dart';
import 'package:stacked/stacked.dart';
import 'package:icefishingderby/core/logger.dart';

class LoginScreenViewModel extends BaseViewModel {
  Logger log;
  bool checkedValue = false;

  LoginScreenViewModel() {
    this.log = getLogger(this.runtimeType.toString());
  }
}
