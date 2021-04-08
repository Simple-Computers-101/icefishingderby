import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icefishingderby/constants/colors.dart';
import 'package:icefishingderby/constants/fonts.dart';
import 'package:icefishingderby/widgets/dumb_widgets/detail.dart';
import 'package:icefishingderby/widgets/dumb_widgets/header_curved.dart';
import 'package:stacked/stacked.dart';
import 'home_screen_view_model.dart';

class HomeScreenView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeScreenViewModel>.reactive(
      builder: (BuildContext context, HomeScreenViewModel viewModel, Widget _) {
        return Scaffold(
          appBar: AppBar(
            title: Text("Fishing Derby", style: t1,),
            backgroundColor: backgroundcolor,),
            backgroundColor: backgroundcolor,
          body: ListView(
           
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                      Padding(
                        padding: EdgeInsets.only(bottom: 12),
                        child: Center(child: Image.asset('assets/derby-logo.png', height: ScreenUtil().setHeight(80),)),
                      ),

                    HomeHeader2(
                      title: 'Events',
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Material(
                        borderRadius: BorderRadius.circular(20),
                        color: widgetcolor,
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Row(
                            children: [
                              Expanded(

                                flex: 3,
                                child: Row(
                                  // crossAxisAlignment:
                                  //     CrossAxisAlignment.baseline,
                                  children: [
                                    Text("27",
                                        style: GoogleFonts.josefinSans(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 80)),
                                    Text("Dec",
                                        style: GoogleFonts.josefinSans(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 20)),
                                  ],
                                ),
                              ),
                              Expanded(
                                flex: 5,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.center,
                                  children: [
                                    Detail(
                                      title: "Event",
                                      text: "FishDerby",
                                    ),
                                    Detail(
                                      title: "Status",
                                      text: "Ongoing",
                                    ),
                                    Detail(
                                      title: "Timing",
                                      text: "9 am - 6 pm",
                                    ),
                                    Detail(
                                      title: "Location",
                                      text: "Cape Hatteras, North Carolina",
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: GestureDetector(
                          child: Text(
                            "See Past Events",
                            style: GoogleFonts.josefinSans(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                color: Colors.white),
                          ),
                          onTap: () {},
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: HomeHeader2(
                      title: 'Exciting Prizes',
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                    child: CarouselSlider(
                      options: CarouselOptions(
                        autoPlay: true,
                        aspectRatio: 2.4,
                        enlargeCenterPage: true,
                      ),
                      items: viewModel.imgList
                          .map((item) => Center(
                                  child: Container(
                                child: Material(
                                  color: widgetcolor,
                                  borderRadius: BorderRadius.circular(15),
                                  shadowColor: Colors.black38,
                                  elevation: 9.0,
                                  clipBehavior: Clip.antiAlias,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: PageView(
                                      children: <Widget>[
                                        Image.asset(
                                          "assets/" + item,
                                          fit: BoxFit.contain,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              )))
                          .toList(),
                    ),
                  ),
                ],
              )
            ],
          ),
        );
      },
      viewModelBuilder: () => HomeScreenViewModel(),
    );
  }
}
