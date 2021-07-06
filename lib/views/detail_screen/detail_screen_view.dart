import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icefishingderby/constants/colors.dart';
import 'package:icefishingderby/views/leaderboard_screen/leaderboard_screen_view.dart';
import 'package:icefishingderby/views/my_fish_screen/my_fish_screen_view.dart';
import 'package:stacked/stacked.dart';
import 'detail_screen_view_model.dart';

class DetailScreenView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<DetailScreenViewModel>.reactive(
      builder:
          (BuildContext context, DetailScreenViewModel viewModel, Widget _) {
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
                MyFishScreenView(),
                buildMyPrizes(viewModel),
                TabViewWidget(
                  status: 'chances',
                ),
              ])),
        );
      },
      viewModelBuilder: () => DetailScreenViewModel(),
    );
  }

  buildMyPrizes(viewModel) {
    if (viewModel.isFetchingPrizes) return CircularProgressIndicator.adaptive();
    QuerySnapshot data = viewModel.prizes;
    return Column(children: [
      ...data.docs.map(
        (e) => Container(
          margin: EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.black,
          ),
          child: ListTile(
            leading: Image.network(e['image']),
            title: Text(
              e['name'],
              style: GoogleFonts.montserrat(color: Colors.white),
            ),
            subtitle: Text(
              e['description'],
              style: GoogleFonts.montserrat(color: Colors.grey),
            ),
          ),
        ),
      )
    ]);
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
