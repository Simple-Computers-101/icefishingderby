import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:logger/logger.dart';
import 'package:stacked/stacked.dart';
import 'package:icefishingderby/core/logger.dart';

class AllPrizesScreenViewModel extends BaseViewModel {
  Logger log;
  var firebase =   FirebaseFirestore.instance;

  Stream<QuerySnapshot> getPrizes(){
    return firebase.collection('prizes').snapshots();
  }
  AllPrizesScreenViewModel() {
    this.log = getLogger(this.runtimeType.toString());
  }
}
