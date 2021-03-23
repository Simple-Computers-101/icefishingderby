import 'package:logger/logger.dart';
import 'package:stacked/stacked.dart';
import 'package:icefishingderby/core/logger.dart';

class AllPrizesScreenViewModel extends BaseViewModel {
  Logger log;

  AllPrizesScreenViewModel() {
    this.log = getLogger(this.runtimeType.toString());
  }
}
