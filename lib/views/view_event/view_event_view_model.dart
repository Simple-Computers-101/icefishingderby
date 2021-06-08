import 'package:logger/logger.dart';
import 'package:stacked/stacked.dart';
import 'package:icefishingderby/core/logger.dart';

class ViewEventViewModel extends BaseViewModel {
  Logger log;

  ViewEventViewModel() {
    this.log = getLogger(this.runtimeType.toString());
  }
}
