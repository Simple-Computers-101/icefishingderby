import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:icefishingderby/core/locator.dart';
import 'package:icefishingderby/views/prize_details/prize_details_view.dart';
import 'package:logger/logger.dart';
import 'package:stacked/stacked.dart';
import 'package:icefishingderby/core/logger.dart';
import 'package:stacked_services/stacked_services.dart';

class AllPrizesScreenViewModel extends BaseViewModel {
  Logger log;
  var firebase = FirebaseFirestore.instance;
  var _navService = locator<NavigationService>();

  Stream<QuerySnapshot> getPrizes() {
    return firebase.collection('prizes').snapshots();
  }

  navigateToDetailsView(category, prize) {
    _navService.navigateToView(
      PrizeDetailsView(),
      arguments: {
        "category": category,
        "raw_details": prize,
      },
    );
  }

  AllPrizesScreenViewModel() {
    this.log = getLogger(this.runtimeType.toString());
  }
}
