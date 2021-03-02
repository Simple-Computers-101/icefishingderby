import 'package:logger/logger.dart';
import 'package:stacked/stacked.dart';
import 'package:icefishingderby/core/logger.dart';

class HomeScreenViewModel extends BaseViewModel {
  Logger log;

  final List<String> imgList = [
    'f1.png',
    'f2.png',
    'f3.png',
  ];

  HomeScreenViewModel() {
    this.log = getLogger(this.runtimeType.toString());
  }
}
