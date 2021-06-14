import 'package:logger/logger.dart';
import 'package:stacked/stacked.dart';
import 'package:icefishingderby/core/logger.dart';

class DetailScreenViewModel extends BaseViewModel {
  Logger log;

  DetailScreenViewModel() {
    this.log = getLogger(this.runtimeType.toString());
  }
}
