import 'package:logger/logger.dart';
import 'package:stacked/stacked.dart';
import 'package:icefishingderby/core/logger.dart';

class FishFormScreenViewModel extends BaseViewModel {
  Logger log;

  FishFormScreenViewModel() {
    this.log = getLogger(this.runtimeType.toString());
  }
}


