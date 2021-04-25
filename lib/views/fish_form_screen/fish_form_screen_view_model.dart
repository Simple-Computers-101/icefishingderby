import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:logger/logger.dart';
import 'package:stacked/stacked.dart';
import 'package:icefishingderby/core/logger.dart';

class FishFormScreenViewModel extends BaseViewModel {
  Logger log;
  final _firebaseStorage = FirebaseStorage.instance;
  String uid = "";
  String fish;
  String length;
  String weight;
  var putCmd;
  var downloadUrl;

  Future register(var image, var uid, var type, var length, var weight) async {
   
    DocumentReference documentReference = FirebaseFirestore.instance.collection('eventRegistration').doc();
     putCmd = await _firebaseStorage
        .ref()
        .child('fishRegistered')
        .child("/" + uid)
        .child("/"+documentReference.id)
        .putFile(image);
    var downloadUrl = await putCmd.ref.getDownloadURL();
    FirebaseFirestore.instance.collection('fishRegistration').doc(type).collection(type).doc(documentReference.id).set({
      "DateTime": DateTime.now().toString(),
      "image": downloadUrl,
      "type": type,
      "length": length,
      "weight": weight,
      "uid": uid,
      "docId":documentReference.id
    }).then((value) => {
          //navigate
        });
  }

  FishFormScreenViewModel() {
    this.log = getLogger(this.runtimeType.toString());
  }
}
