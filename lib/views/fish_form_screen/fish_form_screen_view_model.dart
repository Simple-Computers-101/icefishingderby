import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:icefishingderby/core/locator.dart';
import 'package:logger/logger.dart';
import 'package:stacked/stacked.dart';
import 'package:icefishingderby/core/logger.dart';
import 'package:stacked_services/stacked_services.dart';

class FishFormScreenViewModel extends BaseViewModel {
  Logger log;
  final _firebaseStorage = FirebaseStorage.instance;
  final _snackbarService = locator<SnackbarService>();
  String uid = "";
  String fish;
  String length;
  String weight;
  var putCmd;
  var downloadUrl;

  Future register(var image) async {
    var doc = await FirebaseFirestore.instance
        .collection('events')
        .where('status', isEqualTo: 'Ongoing')
        .get();

    if (doc.docs[0]['eventId'] != null) {
      DocumentReference documentReference =
          FirebaseFirestore.instance.collection('eventRegistration').doc();
      putCmd = await _firebaseStorage
          .ref()
          .child('fishRegistered')
          .child("/" + uid)
          .child("/" + documentReference.id)
          .putFile(image);
      var downloadUrl = await putCmd.ref.getDownloadURL();

      if (length != "" && uid != "" && weight != "") {
        FirebaseFirestore.instance
            .collection('fishRegistration')
            .doc(fish)
            .collection(fish)
            .doc(documentReference.id)
            .set({
              "DateTime": DateTime.now().toString(),
              "image": downloadUrl,
              "type": fish,
              "length": length,
              "weight": weight,
              "registrationId": uid,
              "eventId": doc.docs[0]['eventId'],
              "docId": documentReference.id
            })
            .then((value) => {
                  _snackbarService.showSnackbar(
                    message: "Fish registered successfully",
                  ),
                })
            .catchError((err) {
              _snackbarService.showSnackbar(
                  message: err.message.toString(), title: "Error");
            });
      } else {
        _snackbarService.showSnackbar(
            message: "Fields can not be empty ", title: "Error");
      }
    } else {
      _snackbarService.showSnackbar(
          message: "There is no event scheduled at this time",
          title: "No Event");
    }
  }

  FishFormScreenViewModel() {
    this.log = getLogger(this.runtimeType.toString());
  }
}
