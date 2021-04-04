import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icefishingderby/constants/colors.dart';
import 'package:icefishingderby/widgets/dumb_widgets/leaderboard_card_widget.dart';
import 'package:icefishingderby/widgets/dumb_widgets/leaderboard_widget1.dart';
import 'package:stacked/stacked.dart';
import 'leaderboard_screen_view_model.dart';

class LeaderboardScreenView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LeaderboardScreenViewModel>.reactive(
      builder: (BuildContext context, LeaderboardScreenViewModel viewModel,
          Widget _) {
        return DefaultTabController(
          length: 6,
          child: Scaffold(
              backgroundColor: backgroundcolor,
              appBar: AppBar(
                backgroundColor: backgroundcolor,
                bottom: TabBar(isScrollable: true, tabs: [
                  Tab(
                    child: Text('Salmon'),
                  ),
                  Tab(
                    child: Text('Brook Trout'),
                  ),
                  Tab(
                    child: Text('Togue'),
                  ),
                  Tab(
                    child: Text('Muskie'),
                  ),
                  Tab(
                    child: Text('Cusk'),
                  ),
                  Tab(
                    child: Text('Perch'),
                  ),
                ]),
                title: Text(
                  "Leaderboard",
                  style: GoogleFonts.montserrat(),
                ),
              ),
              body: TabBarView(children: [
                TabViewWidget(),
                TabViewWidget(),
                TabViewWidget(),
                TabViewWidget(),
                TabViewWidget(),
                TabViewWidget(),
              ])),
        );
      },
      viewModelBuilder: () => LeaderboardScreenViewModel(),
    );
  }
}

class TabViewWidget extends StatelessWidget {
  const TabViewWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 100, left: 20, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Leaderboard1(
                        ranking: '2',
                        image: 'profile.jpg',
                        username: '@bobx125',
                        weight: 20,
                        length: 1,
                        crownColor: Color(0xFFD1D1D1),
                      ),
                      SizedBox(
                        width: 90,
                      ),
                      Leaderboard1(
                        ranking: '3',
                        image: 'profile2.jpg',
                        username: '@hailey899',
                        weight: 20,
                        length: 1,
                        crownColor: Color(0xFFcd7f32),
                      ),
                    ],
                  ),
                ),
                Center(
                  child: Leaderboard1(
                    ranking: '1',
                    image: 'profile3.jpg',
                    username: '@angela123',
                    weight: 20,
                    length: 1,
                    crownColor: Colors.yellow,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: ScreenUtil().setHeight(20),
            ),
            LeaderboardCard(
              rank: "4",
              image: 'profile.jpg',
              username: '@abdulMoeed98',
              weight: 30,
              length: 1,
            ),
            LeaderboardCard(
              rank: "5",
              image: 'profile.jpg',
              username: '@abdulMoeed98',
              weight: 30,
              length: 1,
            ),
            LeaderboardCard(
              rank: "6",
              image: 'profile.jpg',
              username: '@abdulMoeed98',
              weight: 30,
              length: 1,
            ),
            LeaderboardCard(
              rank: "7",
              image: 'profile.jpg',
              username: '@abdulMoeed98',
              weight: 30,
              length: 1,
            ),
          ],
        ),
      ),
    );
  }
}
