import 'package:logger/logger.dart';
import 'package:stacked/stacked.dart';
import 'package:icefishingderby/core/logger.dart';

class ShowQrCodeViewModel extends BaseViewModel {
  Logger log;

  ShowQrCodeViewModel() {
    this.log = getLogger(this.runtimeType.toString());
  }
}
