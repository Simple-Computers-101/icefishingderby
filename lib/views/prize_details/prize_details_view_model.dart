import 'package:logger/logger.dart';
import 'package:stacked/stacked.dart';
import 'package:icefishingderby/core/logger.dart';

class PrizeDetailsViewModel extends BaseViewModel {
  Logger log;

  PrizeDetailsViewModel() {
    this.log = getLogger(this.runtimeType.toString());
  }
}
