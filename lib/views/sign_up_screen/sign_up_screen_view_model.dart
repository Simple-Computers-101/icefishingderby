import 'package:logger/logger.dart';
import 'package:stacked/stacked.dart';
import 'package:icefishingderby/core/logger.dart';

class SignUpScreenViewModel extends BaseViewModel {
  Logger log;
   

  SignUpScreenViewModel() {
    this.log = getLogger(this.runtimeType.toString());
  }
}
