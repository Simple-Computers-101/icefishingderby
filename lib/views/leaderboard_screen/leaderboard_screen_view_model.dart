import 'package:logger/logger.dart';
import 'package:stacked/stacked.dart';
import 'package:icefishingderby/core/logger.dart';

class LeaderboardScreenViewModel extends BaseViewModel {
  Logger log;

  LeaderboardScreenViewModel() {
    this.log = getLogger(this.runtimeType.toString());
  }
}
