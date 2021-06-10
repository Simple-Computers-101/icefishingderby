import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:icefishingderby/core/locator.dart';
import 'package:icefishingderby/services/firebase_auth.dart';
import 'package:icefishingderby/views/credit_card_screen/credit_card_screen_view.dart';
import 'package:logger/logger.dart';
import 'package:stacked/stacked.dart';
import 'package:icefishingderby/core/logger.dart';
import 'package:stacked_services/stacked_services.dart';

class PrizeDetailsViewModel extends MultipleFutureViewModel {
  Logger log;
  var prize;

  var winner = "Not assigned";
  var totalTickets = 0;
  var yourTickets = 0;

  var dialogService = locator<DialogService>();
  var snackService = locator<SnackbarService>();
  var navService = locator<NavigationService>();

  var showDialog = false;
  var newChances;
  var dropDownvalue;
  setMoreChances(value) {
    newChances = value;
    notifyListeners();
    print("$newChances");
  }

  setCustomChances(val) {
    try {
      var temp = int.parse(val);
      if (temp <= 7) {
        // snackService.showSnackbar(message: "Enter a value above 7 here");
        newChances = null;
      } else
        newChances = val;
    } catch (e) {
      // snackService.showSnackbar(message: "Enter a value above 7 here");
      newChances = null;
    }
  }

  PrizeDetailsViewModel(BuildContext context) {
    this.log = getLogger(this.runtimeType.toString());
    prize = ModalRoute.of(context).settings.arguments;
    print(prize["raw_details"]['name']);
    print(prize['raw_details'].id);
  }

  openDialog() {
    var type = prize['category'];
    if (type == "Door" || type == "Medium") {
      snackService.showSnackbar(
          message: "This type doesnot qualify for extra chances.");
    } else if (prize['category'] == "Large") {
      showDialog = true;
      notifyListeners();
      snackService.showSnackbar(
          message: "Select the number of chances to buy.");
    }
  }

  buyChances() async {
    try {
      var temp = int.parse(newChances);
      if (newChances == null || temp == 0) {
        snackService.showSnackbar(
            message: "Invalid value or no value selected.");
      } else {
        snackService.showSnackbar(message: "Proceed to Payment.");
        // Create firebase entry for the prize;
        var feeToCharged = 0;
        if (temp == 1) {
          feeToCharged = 10;
        } else if (temp == 3) {
          feeToCharged = 20;
        } else if (temp == 7) {
          feeToCharged = 40;
        } else if (temp > 7) {
          feeToCharged = 40 + ((temp - 7) * 5);
        }
        print("Fee $feeToCharged");
        var payment =
            await navService.navigateToView(CreditCardView(), arguments: {
          "reason": "Event Registeration.",
          "fee": "$feeToCharged",
        });
        if (payment == null || !payment) {
          snackService.showSnackbar(
              message: "FAILURE: Issue with the card details.");
          return;
        }
        var ref = FirebaseFirestore.instance
            .collection('prizes')
            .doc(prize['raw_details'].id)
            .collection('tickets')
            .doc(AuthService.currUID.uid);

        if ((await ref.get()).exists) {
          ref.update({
            "ticket_count": FieldValue.increment(temp),
          });
        } else {
          ref.set({
            'ticket_count': temp,
          });
        }
      }
    } catch (e) {
      // throw e;
      snackService.showSnackbar(
          message:
              "Invalid number: Please specify a number greater than 7 in the field");
    }
  }

  closeDialog() {
    showDialog = false;
    notifyListeners();
  }

  DocumentSnapshot get myTickets => dataMap['your_tickets'];
  int get allTickets => dataMap['all_tickets'];

  Future<DocumentSnapshot> getMyTickets() {
    return FirebaseFirestore.instance
        .collection('prizes')
        .doc(prize['raw_details'].id)
        .collection('tickets')
        .doc(AuthService.currUID.uid)
        .get();
  }

  Future<int> getAllTickets() async {
    var docs = await FirebaseFirestore.instance
        .collection('prizes')
        .doc(prize['raw_details'].id)
        .collection('tickets')
        .get();
    var sum = 0;
    docs.docs.forEach((element) {
      sum = element['ticket_count'];
    });

    return sum;
  }

  bool get isFetchingMyTickets => busy("your_tickets");
  bool get isFetchingAllTickets => busy("all_tickets");
  @override
  // TODO: implement futuresMap
  Map<String, Future Function()> get futuresMap => {
        "your_tickets": getMyTickets,
        "all_tickets": getAllTickets,
      };
}
