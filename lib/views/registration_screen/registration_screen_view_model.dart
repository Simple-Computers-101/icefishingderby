import 'package:firebase_auth/firebase_auth.dart';
import 'package:icefishingderby/classes/time_date.dart';
import 'package:logger/logger.dart';
import 'package:stacked/stacked.dart';
import 'package:icefishingderby/core/logger.dart';

class RegistrationScreenViewModel extends BaseViewModel {
  Logger log;
  var user = FirebaseAuth.instance.currentUser;
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

  eventRegistration(){

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



