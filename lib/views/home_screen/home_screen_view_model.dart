import 'package:icefishingderby/core/locator.dart';
import 'package:icefishingderby/views/all_prizes_screen/all_prizes_screen_view.dart';
import 'package:icefishingderby/views/view_event/view_event_view.dart';
import 'package:logger/logger.dart';
import 'package:stacked/stacked.dart';
import 'package:icefishingderby/core/logger.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeScreenViewModel extends BaseViewModel {
  Logger log;
  final _navService = locator<NavigationService>();

  final List<String> imgList = [
    'f1.png',
    'f2.png',
    'f3.png',
  ];


    navigateToEventsScreen() {
    _navService.navigateToView(ViewEventScreen());
  }

      navigateToPrizeScreen() {
    _navService.navigateToView(AllPrizesScreenView());
  }

  HomeScreenViewModel() {
    this.log = getLogger(this.runtimeType.toString());
  }
}
