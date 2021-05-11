import 'package:logger/logger.dart';
import 'package:stacked/stacked.dart';
import 'package:icefishingderby/core/logger.dart';
import 'package:multi_sort/multi_sort.dart';

class LeaderboardScreenViewModel extends BaseViewModel {
  Logger log;
  List<Fish> sortingList = [];
  //Criteria List
  List<bool> criteria = [false, false];
  //prefrrence List
  List<String> preferrence = ['weight', 'length'];

  LeaderboardScreenViewModel() {
    this.log = getLogger(this.runtimeType.toString());
  }
}

class Fish {
  String username;
  double weight;
  double length;

  Fish({this.username, this.weight, this.length});

  ///Mapping the properties
  Map<String, dynamic> _toMap() {
    return {'name': username, 'weight': weight, 'length': length};
  }

  ///get function to get the properties of Item
  dynamic get(String propertyName) {
    var _mapRep = _toMap();
    if (_mapRep.containsKey(propertyName)) {
      return _mapRep[propertyName];
    }
    throw ArgumentError('propery not found');
  }
}
