import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked/stacked.dart';
import '../../constants/colors.dart';
import '../../widgets/dumb_widgets/detail.dart';
import 'view_fish_rank_screen_view_model.dart';

class ViewFishRankScreenView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Map<String, String> data = ModalRoute.of(context).settings.arguments;
    print(data);
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
                StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestore.instance
                        .collection('fishRegistration')
                        .doc(data['type'])
                        .collection(data['type'])
                        .where('registrationId',
                            isEqualTo: data['registrationId'])
                        .snapshots(),
                    builder: (context, snapshot) {
                      return (snapshot.connectionState ==
                              ConnectionState.waiting)
                          ? Center(
                              child: CircularProgressIndicator(
                              backgroundColor: widgetcolor,
                            ))
                          : Column(
                              children: snapshot.data.docs.map((e) {
                              return Container(
                                height: ScreenUtil().setHeight(150),
                                child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Material(
                                      borderRadius: BorderRadius.circular(20),
                                      color: widgetcolor,
                                      child: Row(
                                        //crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Expanded(
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceAround,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Detail(
                                                      title: "Rank",
                                                      text: "24",
                                                      size: 20),
                                                  Detail(
                                                      title: "Catch Date",
                                                      text: e['DateTime']
                                                          .toString()
                                                          .substring(0, 10),
                                                      size: 14),
                                                  Detail(
                                                      title: "Catch Time",
                                                      text: e['DateTime']
                                                          .toString()
                                                          .substring(11, 19),
                                                      size: 14),
                                                  Detail(
                                                      title: "Fish Weight",
                                                      text: e['weight'] + " Kg",
                                                      size: 14),
                                                  Detail(
                                                      title: "Fish Length",
                                                      text: e['length'] +
                                                          " inches",
                                                      size: 14),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Image.network(
                                              e['image'],
                                              fit: BoxFit.cover,
                                            ),
                                          )
                                        ],
                                      ),
                                    )),
                              );
                            }).toList());
                    }),
              ],
            ),
          ),
        );
      },
      viewModelBuilder: () => ViewFishRankScreenViewModel(),
    );
  }
}
