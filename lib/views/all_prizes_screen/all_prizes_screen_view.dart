import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:icefishingderby/constants/colors.dart';
import 'package:icefishingderby/constants/fonts.dart';
import 'package:icefishingderby/widgets/dumb_widgets/header_curved.dart';
import 'package:stacked/stacked.dart';
import 'all_prizes_screen_view_model.dart';

class AllPrizesScreenView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AllPrizesScreenViewModel>.reactive(
      builder:
          (BuildContext context, AllPrizesScreenViewModel viewModel, Widget _) {
        return Scaffold(
          backgroundColor: backgroundcolor,
          appBar: AppBar(
            backgroundColor: widgetcolor,
            title: Icon(
              FontAwesome.trophy,
              size: 35,
            ),
            elevation: 0,
          ),
          body: StreamBuilder<QuerySnapshot>(
              stream: viewModel.getPrizes(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                }
                if (!snapshot.hasData) {
                  return Center(child: Text("No Prizes added yet"));
                } else {
                  return ListView(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: HomeHeader(
                          title: 'Door Prizes',
                        ),
                      ),
                      Container(
                        height: ScreenUtil().setHeight(280),
                        width: ScreenUtil().setWidth(90),
                        child: ListView.builder(
                            shrinkWrap: true,
                            physics: ClampingScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            itemCount: snapshot.data.docs.length,
                            itemBuilder: (context, index) {
                              DocumentSnapshot data = snapshot.data.docs[index];
                              if (data['type'] == 'Door') {
                                return PrizeCard(
                                  image: Image.network(
                                    data['image'],
                                    fit: BoxFit.fill,
                                  ),
                                  name: data['name'],
                                  details: data['description'],
                                );
                              } else {
                                return Container();
                              }
                            }),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: HomeHeader(
                          title: 'Ultimate Ice Fishing Package',
                        ),
                      ),
                      Container(
                        height: ScreenUtil().setHeight(280),
                        width: ScreenUtil().setWidth(90),
                        child: ListView.builder(
                            shrinkWrap: true,
                            physics: ClampingScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            itemCount: snapshot.data.docs.length,
                            itemBuilder: (context, index) {
                              DocumentSnapshot data = snapshot.data.docs[index];
                              if (data['type'] == 'Medium') {
                                return PrizeCard(
                                  image: Image.network(
                                    data['image'],
                                    fit: BoxFit.fitWidth,
                                  ),
                                  name: data['name'],
                                  details: data['description'],
                                );
                              } else {
                                return Container();
                              }
                            }),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: HomeHeader(
                          title: 'Large Prizes (Bonus Drawing)',
                        ),
                      ),
                      Container(
                        height: ScreenUtil().setHeight(280),
                        width: ScreenUtil().setWidth(90),
                        child: ListView.builder(
                            shrinkWrap: true,
                            physics: ClampingScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            itemCount: snapshot.data.docs.length,
                            itemBuilder: (context, index) {
                              DocumentSnapshot data = snapshot.data.docs[index];
                              if (data['type'] == 'Large') {
                                return PrizeCard(
                                  image: Image.network(
                                    data['image'],
                                    fit: BoxFit.fitWidth,
                                  ),
                                  name: data['name'],
                                  details: data['description'],
                                );
                              } else {
                                return Container();
                              }
                            }),
                      ),
                    ],
                  );
                }
              }),
        );
      },
      viewModelBuilder: () => AllPrizesScreenViewModel(),
    );
  }
}

class PrizeCard extends StatelessWidget {
  final String name;
  final String details;
  final Image image;
  const PrizeCard({
    Key key,
    this.name,
    this.details,
    this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        elevation: 2,
        color: widgetcolor,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: Container(
            width: ScreenUtil().setWidth(370),
            child: Column(
              children: [
                Expanded(
                  flex: 1,
                                  child: Center(
                    child: ClipPath(
                      clipper: MessageClipper(borderRadius: 20),
                      child: Container(
                        height: ScreenUtil().setHeight(55),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadiusDirectional.circular(8)),
                        child: Center(
                          child: Text(
                            name,
                            style: t10appColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                                  child: Column(
                    children: [
                      Expanded(
                        child: image,
                      ),
                      Expanded(
                        child: Text(
                          details,
                          style: t1,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
