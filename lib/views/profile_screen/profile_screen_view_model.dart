import 'package:logger/logger.dart';
import 'package:stacked/stacked.dart';
import 'package:icefishingderby/core/logger.dart';

class ProfileScreenViewModel extends BaseViewModel {
  Logger log;

  ProfileScreenViewModel() {
    this.log = getLogger(this.runtimeType.toString());
  }
}
