import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:icefishingderby/services/firebase_auth.dart';
import 'package:logger/logger.dart';
import 'package:stacked/stacked.dart';
import 'package:icefishingderby/core/logger.dart';

class DetailScreenViewModel extends MultipleFutureViewModel {
  Logger log;

  DetailScreenViewModel() {
    this.log = getLogger(this.runtimeType.toString());
  }

  Future<QuerySnapshot> getPrizes() async {
    var prizes = await FirebaseFirestore.instance
        .collection('prizes')
        // .where('winner', isEqualTo: AuthService.currUID.uid)
        .get();
    return prizes;
  }

  QuerySnapshot get prizes => dataMap['prizes'];
  bool get isFetchingPrizes => busy('prizes');

  @override
  // TODO: implement futuresMap
  Map<String, Future Function()> get futuresMap => {
        'prizes': getPrizes,
      };
}
