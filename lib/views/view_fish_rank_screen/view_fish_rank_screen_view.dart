import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked/stacked.dart';
import '../../constants/colors.dart';
import '../../constants/colors.dart';
import '../../widgets/dumb_widgets/detail.dart';
import 'view_fish_rank_screen_view_model.dart';

class ViewFishRankScreenView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ViewFishRankScreenViewModel>.reactive(
      builder: (BuildContext context, ViewFishRankScreenViewModel viewModel,
          Widget _) {
        return Scaffold(
          backgroundColor: backgroundcolor,
          appBar: AppBar(
            backgroundColor: backgroundcolor,
            title: Text(
              "My Fish",
              style: GoogleFonts.montserrat(),
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Material(
                      borderRadius: BorderRadius.circular(20),
                      color: widgetcolor,
                      child: Row(
                        //crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Detail(title: "Rank", text: "24", size: 18),
                                  Detail(
                                      title: "Catch Time",
                                      text: "10:30 am",
                                      size: 12),
                                  Detail(
                                      title: "Fish Weight",
                                      text: "50 Kg",
                                      size: 12),
                                  Detail(
                                      title: "Fish Length",
                                      text: "1.5 meters",
                                      size: 12),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: Image.asset("assets/fish.jpeg"),
                          )
                        ],
                      ),
                    )),
              ],
            ),
          ),
        );
      },
      viewModelBuilder: () => ViewFishRankScreenViewModel(),
    );
  }
}
