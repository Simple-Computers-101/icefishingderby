import 'package:logger/logger.dart';
import 'package:stacked/stacked.dart';
import 'package:icefishingderby/core/logger.dart';

class ProductDescriptionViewModel extends BaseViewModel {
  Logger log;

  ProductDescriptionViewModel() {
    this.log = getLogger(this.runtimeType.toString());
  }
}
