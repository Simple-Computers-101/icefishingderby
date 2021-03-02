import 'package:logger/logger.dart';
import 'package:stacked/stacked.dart';
import 'package:icefishingderby/core/logger.dart';

class BottomBarViewModel extends IndexTrackingViewModel {
  Logger log;

  BottomBarViewModel() {
    this.log = getLogger(this.runtimeType.toString());
  }
}
