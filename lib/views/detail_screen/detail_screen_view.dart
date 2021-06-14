import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icefishingderby/constants/colors.dart';
import 'package:icefishingderby/views/leaderboard_screen/leaderboard_screen_view.dart';
import 'package:stacked/stacked.dart';
import 'detail_screen_view_model.dart';
          
class DetailScreenView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<DetailScreenViewModel>.reactive(
      builder: (BuildContext context, DetailScreenViewModel viewModel, Widget _) {
        return DefaultTabController(
          length: 3,
          child: Scaffold(
              backgroundColor: backgroundcolor,
              appBar: AppBar(
                backgroundColor: backgroundcolor,
                bottom: TabBar(isScrollable: true, tabs: [
                  Tab(
                    child: Text('My Fish'),
                  ),
                  Tab(
                    child: Text('My Prize'),
                  ),
                  Tab(
                    child: Text('My Chances'),
                  ),
                ]),
                title: Text(
                  "My Detail",
                  style: GoogleFonts.montserrat(),
                ),
              ),
              body: TabBarView(children: [
                TabViewWidget(
                  status: 'fish',
                ),
                TabViewWidget(
                  status: 'prizes',
                ),
                 TabViewWidget(
                  status: 'chances',
                ),
              ])),
        );
      },
      viewModelBuilder: () => DetailScreenViewModel(),
    );
  }
}

class TabViewWidget extends StatelessWidget {
  const TabViewWidget({
    Key key,
    this.status,
  }) : super(key: key);
  final status;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(),
    );
  }
}
