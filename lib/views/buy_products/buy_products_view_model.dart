import 'package:logger/logger.dart';
import 'package:stacked/stacked.dart';
import 'package:icefishingderby/core/logger.dart';

class BuyProductsViewModel extends BaseViewModel {
  Logger log;

  BuyProductsViewModel() {
    this.log = getLogger(this.runtimeType.toString());
  }
}
