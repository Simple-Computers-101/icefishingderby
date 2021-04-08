import 'package:logger/logger.dart';
import 'package:stacked/stacked.dart';
import 'package:icefishingderby/core/logger.dart';

class RegistrationScreenViewModel extends BaseViewModel {
  Logger log;

  RegistrationScreenViewModel() {
    this.log = getLogger(this.runtimeType.toString());
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



