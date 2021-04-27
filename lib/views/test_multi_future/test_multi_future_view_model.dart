import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:icefishingderby/services/firebase_auth.dart';
import 'package:logger/logger.dart';
import 'package:stacked/stacked.dart';
import 'package:icefishingderby/core/logger.dart';

const String _NumberDelayFuture = 'delayedNumber';
const String _StringDelayFuture = 'delayedString';
const String _GetCards = 'Cards';

class TestMultiFutureViewModel extends MultipleFutureViewModel {
  Logger log;

  TestMultiFutureViewModel() {
    log = getLogger(this.runtimeType.toString());
  }

  int get fetchedNumber => dataMap[_NumberDelayFuture];
  String get fetchedString => dataMap[_StringDelayFuture];

  bool get fetchingNumber => busy(_NumberDelayFuture);
  bool get fetchingString => busy(_StringDelayFuture);

  @override
  Map<String, Future Function()> get futuresMap => {
        _NumberDelayFuture: getNumberAfterDelay,
        _StringDelayFuture: getStringAfterDelay,
        _GetCards: getCardFromFirebase
      };

  Future<int> getNumberAfterDelay() async {
    await Future.delayed(Duration(seconds: 2));
    return 3;
  }

  Future<String> getStringAfterDelay() async {
    await Future.delayed(Duration(seconds: 3));
    return 'String data';
  }

  Future<DocumentSnapshot> getCardFromFirebase() async {
    /* var currUser = await AuthService.currUID;
    var currUID = currUser.uid;
    */
    return await FirebaseFirestore.instance
        .collection('users')
        .doc(AuthService.testUid)
        .get();

    // List cards = userDoc.data()['cards'];
    // print("${cards.length} cards found");
    // print("Is busy :$fetchingCards");
    // return cards;
  }
}
