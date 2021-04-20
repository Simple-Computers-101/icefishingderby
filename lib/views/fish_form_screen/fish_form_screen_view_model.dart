import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:logger/logger.dart';
import 'package:stacked/stacked.dart';
import 'package:icefishingderby/core/logger.dart';

class FishFormScreenViewModel extends BaseViewModel {
  Logger log;
  final _firebaseStorage = FirebaseStorage.instance;
  var putCmd;
  var downloadUrl;

  Future register(var image, var uid, var type, var length, var weight) async {
    putCmd = await _firebaseStorage
        .ref()
        .child('FishRegistered')
        .child("/" + uid)
        .child("/" + uid)
        .putFile(image)
        .whenComplete(() => {
              downloadUrl = putCmd.ref.getDownloadURL(),
            });

    FirebaseFirestore.instance.collection('FishRegistration').doc().set({
      "DateTime": DateTime.now().toString(),
      "image": downloadUrl,
      "type": type,
      "length": length,
      "weight": weight,
      "uid": uid,
    }).then((value) => {
          //navigate
        });
  }

  

  FishFormScreenViewModel() {
    this.log = getLogger(this.runtimeType.toString());
  }
}
