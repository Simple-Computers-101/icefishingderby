import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icefishingderby/constants/colors.dart';
import 'package:icefishingderby/constants/fonts.dart';
import 'package:icefishingderby/views/leaderboard_screen/leaderboard_screen_view.dart';
import 'package:icefishingderby/widgets/dumb_widgets/detail.dart';
import 'package:stacked/stacked.dart';
import 'view_event_view_model.dart';

class ViewEventScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ViewEventViewModel>.reactive(
      builder: (BuildContext context, ViewEventViewModel viewModel, Widget _) {
        return DefaultTabController(
          length: 2,
          child: Scaffold(
              backgroundColor: backgroundcolor,
              appBar: AppBar(
                backgroundColor: backgroundcolor,
                bottom: TabBar(isScrollable: true, tabs: [
                  Tab(
                    child: Text('Past'),
                  ),
                  Tab(
                    child: Text('Present'),
                  ),
                ]),
                title: Text(
                  "Events",
                  style: GoogleFonts.montserrat(),
                ),
              ),
              body: TabBarView(children: [
                TabViewWidget(
                  status: 'Completed',
                ),
                TabViewWidget(
                  status: 'Ongoing',
                ),
              ])),
        );
      },
      viewModelBuilder: () => ViewEventViewModel(),
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
      child: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection('events')
              .where('status', isEqualTo: status)
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
                'No Event',
                style: t1,
              ));
            } else {
              return ListView.builder(
                  shrinkWrap: true,
                  physics: ClampingScrollPhysics(),
                  itemCount: snapshot.data.size,
                  itemBuilder: (BuildContext context, int i) {
                    var data = snapshot.data;
                    return Padding(
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
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(data.docs[i]['startDate'],
                                            style: GoogleFonts.josefinSans(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20)),
                                       
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text("To",
                                          style: GoogleFonts.josefinSans(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20)),
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(data.docs[i]['endDate'],
                                            style: GoogleFonts.josefinSans(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20)),
                                        
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                flex: 5,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Detail(
                                      title: "Event",
                                      text: data.docs[i]['Name'],
                                    ),
                                    Detail(
                                      title: "Status",
                                      text: data.docs[i]['status'],
                                    ),
                                    Detail(
                                      title: "Timing",
                                      text:data.docs[i]['Time'],
                                    ),
                                    Detail(
                                      title: "Location",
                                      text: data.docs[i]['location'],
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  });
            }
          }),
    );
  }
}
