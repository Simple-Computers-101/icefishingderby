import 'dart:core';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:icefishingderby/core/locator.dart';
import 'package:icefishingderby/core/logger.dart';
import 'package:icefishingderby/services/firebase_auth.dart';
import 'package:icefishingderby/services/stripe_payment.dart';
import 'package:logger/logger.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

const _GetCards = 'GetCards';

class CreditCardViewModel extends MultipleStreamViewModel {
  Logger log;

  final dialogService = locator<DialogService>();
  final snackService = locator<SnackbarService>();

  CreditCardViewModel() {
    log = getLogger(this.runtimeType.toString());
  }

  Map get fetchedCards {
    DocumentSnapshot ds = dataMap[_GetCards];
    return ds == null ? {} : ds.data();
  }

  bool get fetchingCards => busy(_GetCards);
  bool get errorFetchingCards => hasErrorForKey(_GetCards);

  @override
  Map<String, StreamData> get streamsMap => {
        _GetCards: StreamData<DocumentSnapshot>(getCardFromFirebase()),
      };

  Future saveCardToFirebase(holder, number, cvv, expiry) async {
    var thisCard = {
      'holder_name': holder,
      'card_number': number,
      'cvv': cvv,
      'expiry': expiry
    };
    /* var currUser = await AuthService.currUID;
    var currUID = currUser.uid;
    */
    await FirebaseFirestore.instance
        .collection('users')
        .doc(AuthService.testUid)
        .update({
      'cards': FieldValue.arrayUnion([thisCard])
    });
  }

  Stream<DocumentSnapshot> getCardFromFirebase() {
    /* var currUser = await AuthService.currUID;
    var currUID = currUser.uid;
    */
    return FirebaseFirestore.instance
        .collection('users')
        .doc(AuthService.testUid)
        .snapshots();
    /*
    List cards = userDoc.data()['cards'];
    print("${cards.length} cards found");
    print("Is busy :$fetchingCards");
    return cards;
    */
  }

  confirmPayment(card) async {
    DialogResponse response = await dialogService.showDialog(
        title: 'Confirm Payment?',
        description:
            "\$120 will be charged on this Card.\n${card.number}\n${card.name}",
        buttonTitle: "OK",
        cancelTitle: 'Cancel');
    if (response.confirmed)
      StripeService.payViaExistingCard(
              amount: '120', currency: 'USD', card: card)
          .then((value) {
        snackService.showSnackbar(message: value.message);
      });

    //Send Card to Stripe.
  }
}
