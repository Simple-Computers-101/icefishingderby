import 'package:logger/logger.dart';
import 'package:stacked/stacked.dart';
import 'package:icefishingderby/core/logger.dart';

class EditProfileScreenViewModel extends BaseViewModel {
  Logger log;

  EditProfileScreenViewModel() {
    this.log = getLogger(this.runtimeType.toString());
  }
}
