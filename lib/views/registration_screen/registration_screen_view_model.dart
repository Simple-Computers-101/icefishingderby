import 'package:logger/logger.dart';
import 'package:stacked/stacked.dart';
import 'package:icefishingderby/core/logger.dart';

class RegistrationScreenViewModel extends BaseViewModel {
  Logger log;

  RegistrationScreenViewModel() {
    this.log = getLogger(this.runtimeType.toString());
  }
}
