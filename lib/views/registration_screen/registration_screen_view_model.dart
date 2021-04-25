import 'package:cloud_firestore/cloud_firestore.dart';
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

  Future eventRegistration(String name, String email,String address,String dOB,String contact,String ageGroup,String fee)
  async {
       var doc =  await FirebaseFirestore.instance.collection('events').where('status',isEqualTo: 'Ongoing').get();
    DocumentReference documentReference = FirebaseFirestore.instance.collection('eventRegistration').doc();
         FirebaseFirestore.instance.collection('eventRegistration').doc(documentReference.id).set({
          'name':name ,
          'email':email,
          'address':address,
          'dob':dOB,
          'contact':contact,
          'ageGroup':ageGroup,
          'fee':fee,
          'eventId':doc.docs[0]['eventId'],
          'docId':documentReference.id,
          "uid":user.uid,
        })
        .then((value) => print("user Registered"))
        .catchError((error) => print("Failed to add user: $error"));


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



