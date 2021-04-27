import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked/stacked.dart';
import '../../constants/colors.dart';
import 'my_fish_screen_view_model.dart';

class MyFishScreenView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Map<String, String> data = ModalRoute.of(context).settings.arguments;
    return ViewModelBuilder<MyFishScreenViewModel>.reactive(
      builder:
          (BuildContext context, MyFishScreenViewModel viewModel, Widget _) {
        return Scaffold(
          backgroundColor: backgroundcolor,
          appBar: AppBar(
            backgroundColor: backgroundcolor,
            title: Text(
              "Select Fish",
              style: GoogleFonts.montserrat(),
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: viewModel.fish.keys.map((f) {
                return TextButton(
                  child: Container(
                    child: Material(
                      borderRadius: BorderRadius.circular(20),
                      color: widgetcolor,
                      child: Container(
                        //  decoration: BoxDecoration(
                        // image: DecorationImage(
                        //   fit: BoxFit.cover,
                        //     image: AssetImage("assets/bubble.png"))),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Expanded(
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Text(
                                        f,
                                        style: GoogleFonts.montserrat(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w600,
                                            fontSize: ScreenUtil().setSp(18)),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Text(
                                        viewModel.fish[f][0],
                                        style: GoogleFonts.montserrat(
                                            color: Colors.white,
                                            fontSize: ScreenUtil().setSp(11)),
                                      ),
                                    ),
                                    // Padding(
                                    //   padding: const EdgeInsets.all(4.0),
                                    //   child: Row(
                                    //     children: [
                                    //       Text(
                                    //         "Registered: ",
                                    //         style: GoogleFonts.montserrat(
                                    //             color: Colors.white,
                                    //             fontWeight: FontWeight.bold,
                                    //             fontSize:
                                    //                 ScreenUtil().setSp(14)),
                                    //       ),
                                    //       Text(
                                    //         "2",
                                    //         style: GoogleFonts.montserrat(
                                    //             color: Colors.white,
                                    //             fontSize:
                                    //                 ScreenUtil().setSp(14)),
                                    //       ),
                                    //     ],
                                    //   ),
                                    // ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  height: ScreenUtil().setHeight(140),
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image:
                                              AssetImage("assets/bubble.png"))),
                                  child: Image.asset(
                                      "assets/fish/" + viewModel.fish[f][1]),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  onPressed: () {
                    viewModel.navigateToFishScreen(f, data['docId']);
                  },
                );
              }).toList(),
            ),
          ),
        );
      },
      viewModelBuilder: () => MyFishScreenViewModel(),
    );
  }
}
