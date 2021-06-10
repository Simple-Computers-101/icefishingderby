import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:icefishingderby/classes/time_date.dart';
import 'package:icefishingderby/core/locator.dart';
import 'package:logger/logger.dart';
import 'package:stacked/stacked.dart';
import 'package:icefishingderby/core/logger.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:icefishingderby/views/credit_card_screen/credit_card_screen_view.dart';

class RegistrationScreenViewModel extends BaseViewModel {
  Logger log;
  var user = FirebaseAuth.instance.currentUser;
  final _snackbarService = locator<SnackbarService>();
  final _navService = locator<NavigationService>();

  String name;
  String email;
  String address;
  String contactNumber;
  String ageGroup;
  String registrationDays;
  String feeToBeCharged;
  String dateOfBirth = DateMonthYear(DateTime.now());

  RegistrationScreenViewModel() {
    this.log = getLogger(this.runtimeType.toString());
  }

  Future eventRegistration() async {
    var doc = await FirebaseFirestore.instance
        .collection('events')
        .where('status', isEqualTo: 'Ongoing')
        .get();
    DocumentReference documentReference =
        FirebaseFirestore.instance.collection('eventRegistration').doc();
    if (doc.docs[0]['eventId'] != null) {
      if (name != "" &&
          email != "" &&
          address != "" &&
          contactNumber != "" &&
          ageGroup != "" &&
          registrationDays != "" &&
          feeToBeCharged != "" &&
          dateOfBirth != "") {
        var payment = await _navService.navigateToView(
          CreditCardView(),
          arguments: {
            "reason": "Event Registeration.",
            "fee": feeToBeCharged,
          },
        );
        print("back args $payment");
        if (payment == null || !payment) {
          _snackbarService.showSnackbar(
              message: "FAILURE: Issue with the card details.");
          return;
        }
        FirebaseFirestore.instance
            .collection('eventRegistration')
            .doc(documentReference.id)
            .set({
              'name': name,
              'email': email,
              'address': address,
              'dob': dateOfBirth,
              'contact': contactNumber,
              'ageGroup': ageGroup,
              'fee': feeToBeCharged,
              'eventId': doc.docs[0]['eventId'],
              'docId': documentReference.id,
              "uid": user.uid,
            })
            .then((value) => {
                  _snackbarService.showSnackbar(
                    message: "Event registered successfully",
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
}

double returnTicketCost({String ageGroup, String days}) {
  if (days == 'Saturday' || days == 'Sunday') {
    if (ageGroup == '13 And Under') {
      return 5.0;
    } else {
      return 15.0;
    }
  } else {
    if (ageGroup == '13 And Under') {
      return 10.0;
    } else {
      return 25.0;
    }
  }
}
