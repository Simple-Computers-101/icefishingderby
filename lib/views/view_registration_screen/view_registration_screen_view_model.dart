import 'package:logger/logger.dart';
import 'package:stacked/stacked.dart';
import 'package:icefishingderby/core/logger.dart';

class ViewRegistrationScreenViewModel extends BaseViewModel {
  Logger log;

  ViewRegistrationScreenViewModel() {
    this.log = getLogger(this.runtimeType.toString());
  }
}
