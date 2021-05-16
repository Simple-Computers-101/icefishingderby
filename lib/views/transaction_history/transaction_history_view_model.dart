import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:icefishingderby/services/firebase_auth.dart';
import 'package:logger/logger.dart';
import 'package:stacked/stacked.dart';
import 'package:icefishingderby/core/logger.dart';

class TransactionHistoryViewModel extends StreamViewModel {
  Logger log;

  QuerySnapshot get tHistory => data;

  TransactionHistoryViewModel() {
    log = getLogger(this.runtimeType.toString());
  }

  Stream<QuerySnapshot> fetchTransactionHistory() {
    return FirebaseFirestore.instance
        .collection('transactions')
        .where('uid', isEqualTo: AuthService.currUID.uid)
        .snapshots();
  }

  @override
  // TODO: implement stream
  Stream get stream => fetchTransactionHistory();
}
