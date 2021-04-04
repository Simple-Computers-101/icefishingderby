import 'package:logger/logger.dart';
import 'package:stacked/stacked.dart';
import 'package:icefishingderby/core/logger.dart';

class ViewFishRankScreenViewModel extends BaseViewModel {
  Logger log;

  ViewFishRankScreenViewModel() {
    this.log = getLogger(this.runtimeType.toString());
  }
}
