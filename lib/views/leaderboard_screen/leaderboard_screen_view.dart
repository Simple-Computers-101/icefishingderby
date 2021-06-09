import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icefishingderby/constants/colors.dart';
import 'package:icefishingderby/constants/fonts.dart';
import 'package:icefishingderby/widgets/dumb_widgets/leaderboard_card_widget.dart';
import 'package:icefishingderby/widgets/dumb_widgets/leaderboard_widget1.dart';
import 'package:stacked/stacked.dart';
import 'leaderboard_screen_view_model.dart';
import 'package:multi_sort/multi_sort.dart';

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
                automaticallyImplyLeading: false,
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
                TabViewWidget(
                  fishname: 'Salmon',
                  viewModel: viewModel,
                ),
                TabViewWidget(
                  fishname: 'Brook Trout',
                  viewModel: viewModel,
                ),
                TabViewWidget(
                  fishname: 'Togue',
                  viewModel: viewModel,
                ),
                TabViewWidget(
                  fishname: 'Muskie',
                  viewModel: viewModel,
                ),
                TabViewWidget(
                  fishname: 'Cusk',
                  viewModel: viewModel,
                ),
                TabViewWidget(
                  fishname: 'Peach',
                  viewModel: viewModel,
                ),
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
    this.fishname,
    this.viewModel,
  }) : super(key: key);
  final fishname;
  final LeaderboardScreenViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance
                .collection('fishRegistration')
                .doc(fishname)
                .collection(fishname)
                .snapshots(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                    child: CircularProgressIndicator(
                  backgroundColor: widgetcolor,
                ));
              }
              if (snapshot.data.size == 0) {
                return Center(
                    child: Text(
                  'No Fish Registered at the moment',
                  style: t1,
                ));
              } else {
                var data = snapshot.data;
                viewModel.sortingList = [];
                for (int i = 0; i < snapshot.data.size; i++) {
                  viewModel.sortingList.add(Fish(
                      username: data.docs[i].get('username'),
                      weight: double.parse(data.docs[i].get('weight')),
                      length: double.parse(data.docs[i].get('length'))));
                }
                viewModel.sortingList
                    .multisort(viewModel.criteria, viewModel.preferrence);
                return ListView(
                  children: [
                    Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 100, left: 20, right: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              (snapshot.data.size > 1)
                                  ? Leaderboard1(
                                      ranking: '2',
                                      image: 'profile.jpg',
                                      username: viewModel
                                          .sortingList[1].username
                                          .toString(),
                                      weight: double.parse(viewModel
                                          .sortingList[1].weight
                                          .toString()),
                                      length: double.parse(viewModel
                                          .sortingList[1].length
                                          .toString()),
                                      crownColor: Color(0xFFD1D1D1),
                                    )
                                  : Container(),
                              SizedBox(
                                width: 90,
                              ),
                              (snapshot.data.size > 2)
                                  ? Leaderboard1(
                                      ranking: '3',
                                      image: 'profile2.jpg',
                                      username: viewModel
                                          .sortingList[2].username
                                          .toString(),
                                      weight: double.parse(viewModel
                                          .sortingList[2].weight
                                          .toString()),
                                      length: double.parse(viewModel
                                          .sortingList[2].length
                                          .toString()),
                                      crownColor: Color(0xFFcd7f32),
                                    )
                                  : Container()
                            ],
                          ),
                        ),
                        (snapshot.data.size > 0)
                            ? Center(
                                child: Leaderboard1(
                                  ranking: '1',
                                  image: 'profile3.jpg',
                                  username: viewModel.sortingList[0].username
                                      .toString(),
                                  weight: double.parse(viewModel
                                      .sortingList[0].weight
                                      .toString()),
                                  length: double.parse(viewModel
                                      .sortingList[0].length
                                      .toString()),
                                  crownColor: Colors.yellow,
                                ),
                              )
                            : Container(),
                      ],
                    ),
                    SizedBox(
                      height: ScreenUtil().setHeight(20),
                    ),
                    (snapshot.data.size > 2)
                        ? ListView.builder(
                            shrinkWrap: true,
                            physics: ClampingScrollPhysics(),
                            itemCount: viewModel.sortingList.length - 3,
                            itemBuilder: (BuildContext context, int i) {
                              i = i + 3;
                              return LeaderboardCard(
                                rank: i.toString(),
                                image: 'profile.jpg',
                                username: viewModel.sortingList[i].username,
                                weight: viewModel.sortingList[i].weight,
                                length: viewModel.sortingList[i].length,
                              );
                            })
                        : Container(),
                  ],
                );
              }
            }),
      ),
    );
  }
}
