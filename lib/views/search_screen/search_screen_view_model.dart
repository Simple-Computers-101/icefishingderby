import 'package:logger/logger.dart';
import 'package:stacked/stacked.dart';
import 'package:icefishingderby/core/logger.dart';

class SearchScreenViewModel extends BaseViewModel {
  Logger log;
    String uid = "";
    String username;

  SearchScreenViewModel() {
    this.log = getLogger(this.runtimeType.toString());
  }
}
