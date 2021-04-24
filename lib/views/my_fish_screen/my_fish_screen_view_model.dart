import 'package:icefishingderby/core/locator.dart';
import 'package:icefishingderby/views/view_fish_rank_screen/view_fish_rank_screen_view.dart';
import 'package:logger/logger.dart';
import 'package:stacked/stacked.dart';
import 'package:icefishingderby/core/logger.dart';
import 'package:stacked_services/stacked_services.dart';

class MyFishScreenViewModel extends BaseViewModel {
  Logger log;
  final _navService = locator<NavigationService>();
  Map<String, List<String>> fish = {
    "Salmon": [
      "Salmon is the common name for several species of ray-finned fish in the family Salmonidae. Other fish in the same family include trout, char, grayling, and whitefish. Salmon are native to tributaries of the North Atlantic and Pacific Ocean",
      'salmon.png'
    ],
    "Brook Trout": [
      "The brook trout is a species of freshwater fish in the char genus Salvelinus of the salmon family Salmonidae. It is native to Eastern North America in the United States and Canada, but has been introduced elsewhere in North America, as well as to Iceland, Europe, and Asia.",
      "brooktrout.png"
    ],
    "Togue": [
      "The lake trout is a freshwater char living mainly in lakes in northern North America. Other names for it include mackinaw, namaycush, lake char, touladi, togue, and grey trout. In Lake Superior, it can also be variously known as siscowet, paperbelly and lean.",
      "togue.png"
    ],
    "Muskie": [
      "A Muskie has an elongated body and a flat head, with light colored with dark bars running down the sides of their body. Their underside is plain white in color. The biggest difference between male and female muskie is size. Both genders continually grow with age.",
      "muskie.png"
    ],
    "Cusk": [
      "Cusk is long-bodied food fish of the cod family, Gadidae, found along the ocean bottom in deep offshore waters on either side of the North Atlantic. The cusk is a small-scaled fish with a large mouth and a barbel on its chin. ",
      "cusk.png"
    ],
    "Perch ": [
      "Perch are carnivorous fish most commonly found in small ponds, lakes, streams, or rivers. These fish feed on smaller fish, shellfish, or insect larvae, but can be caught with nearly any bait. They have two dorsal fins, the first spiny and the second soft-rayed.",
      "perch.png"
    ],
  };

  navigateToFishScreen(String type) {
    _navService
        .navigateToView(ViewFishRankScreenView(), arguments: {"type": type});
  }

  MyFishScreenViewModel() {
    this.log = getLogger(this.runtimeType.toString());
  }
}
