import 'package:stacked/stacked.dart';

class CreditCardViewModel extends BaseViewModel {
  var showBackSide = false;
  toggleView() {
    showBackSide = !showBackSide;
    notifyListeners();
  }
}
