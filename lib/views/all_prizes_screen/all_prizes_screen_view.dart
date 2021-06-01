import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:icefishingderby/constants/colors.dart';
import 'package:icefishingderby/constants/fonts.dart';
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
          body: ListView(
            children: [
              Stack(
                children: [
                  Center(
                      child: Container(
                          width: ScreenUtil().setWidth(double.infinity),
                          height: ScreenUtil().setHeight(100),
                          decoration: BoxDecoration(
                              color: widgetcolor,
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(35),
                                  bottomRight: Radius.circular(35))),
                          child: Image.asset(
                            'assets/trophy.png',
                            height: ScreenUtil().setHeight(100),
                          )))
                ],
              ),
              PrizeCard(
                image: Image.asset('assets/f1.png'),
                name: 'Cash Prize',
                details: '1000 \$ USD',
              ),
              PrizeCard(
                image: Image.asset('assets/f1.png'),
                name: 'Cash Prize',
                details: '1000 \$ USD',
              ),
              PrizeCard(
                image: Image.asset('assets/f1.png'),
                name: 'Cash Prize',
                details: '1000 \$ USD',
              ),
              PrizeCard(
                image: Image.asset('assets/f1.png'),
                name: 'Cash Prize',
                details: '1000 \$ USD',
              ),
            ],
          ),
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
      padding: const EdgeInsets.all(8.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        elevation: 2,
        color: widgetcolor,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    Text(
                      name,
                      style: t1,
                    ),
                    Text(
                      details,
                      style: t1,
                    )
                  ],
                ),
              ),
              Expanded(
                child: image,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
