import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:icefishingderby/constants/colors.dart';
import 'package:icefishingderby/constants/fonts.dart';
import 'package:icefishingderby/widgets/dumb_widgets/textField.dart';
import 'package:stacked/stacked.dart';
import 'search_screen_view_model.dart';

class SearchScreenView extends StatefulWidget {
  @override
  _SearchScreenViewState createState() => _SearchScreenViewState();
}

class _SearchScreenViewState extends State<SearchScreenView> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SearchScreenViewModel>.reactive(
      builder:
          (BuildContext context, SearchScreenViewModel viewModel, Widget _) {
        return Scaffold(
          appBar: AppBar(
            elevation: 0,
            title: Text(
              'Search Fisherman',
              style: t1,
            ),
          ),
          body: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              TextFields(
                icon: Tab(
                  child: Icon(FontAwesome5Solid.search),
                ),
                hintText: 'Search User',
                context: null,
                secureText: false,
                borderColor: Colors.white,
                onChanged: (val) {
                  setState(() {
                    viewModel.uid = val;
                  });
                },
              ),
              Container(
                height: ScreenUtil().setHeight(500),
                child: StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestore.instance
                        .collection('eventRegistration')
                        .where('email', isEqualTo: viewModel.uid)
                        .snapshots(),
                    builder: (context, snapshot) {
                      return (snapshot.connectionState ==
                              ConnectionState.waiting)
                          ? Center(
                              child: CircularProgressIndicator(
                              backgroundColor: widgetcolor,
                            ))
                          : ListView.builder(
                              itemCount: snapshot.data.docs.length,
                              itemBuilder: (context, index) {
                                DocumentSnapshot data =
                                    snapshot.data.docs[index];
                                viewModel.uid = data['docId'];
                                viewModel.username = data['name'];
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: GestureDetector(
                                    child: Card(
                                      color: widgetcolor,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    data['name'],
                                                    style: t1,
                                                  ),
                                                  Icon(
                                                    FontAwesome5Solid
                                                        .user_friends,
                                                    color: Colors.white,
                                                  )
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    data['docId'],
                                                    style: t1,
                                                  ),
                                                  Icon(
                                                    FontAwesome5Solid
                                                        .id_card_alt,
                                                    color: Colors.white,
                                                  )
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Flexible(
                                                      child: Text(
                                                    data['address'],
                                                    style: t1,
                                                  )),
                                                  Icon(
                                                    FontAwesome5Solid.home,
                                                    color: Colors.white,
                                                  )
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    onTap: (){
                                      Navigator.pop(context, data);
                                    },
                                  ),
                                );
                              });
                    }),
              ),
            ],
          ),
        );
      },
      viewModelBuilder: () => SearchScreenViewModel(),
    );
  }
}
