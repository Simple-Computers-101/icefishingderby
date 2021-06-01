import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:icefishingderby/constants/colors.dart';
import 'package:icefishingderby/constants/fonts.dart';
import 'package:icefishingderby/widgets/dumb_widgets/registration_card.dart';
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
            body: Padding(
                padding: const EdgeInsets.only(left: 5, right: 5),
                child: StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestore.instance
                        .collection('prizes')
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

                                return PrizeCard(
                                  details: data['description'],
                                  name: data['name'],
                                  image: data['image'],
                                );
                              });
                    })));
      },
      viewModelBuilder: () => AllPrizesScreenViewModel(),
    );
  }
}

class PrizeCard extends StatelessWidget {
  final String name;
  final String details;
  final String image;
  final String type;
  const PrizeCard({
    Key key,
    this.name,
    this.details,
    this.image,
    this.type,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4),
      child: Card(
        
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(22.0),
        ),
        elevation: 2,
        color: widgetcolor,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Center(
                child:  Text(
                      name,
                      style: t1,
                    ),
              ),
              Column(
                children: [
                 
                  SizedBox(
                    height: ScreenUtil().setHeight(15),
                  ),
                  Text(
                    details,
                    style: t1small,
                  ),
                    SizedBox(
                    height: ScreenUtil().setHeight(15),
                  ),
                  
                ],
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(bottomRight: Radius.circular(22), topRight: Radius.circular(22))
                ),
                
                child: Image.network(image, fit: BoxFit.contain, height: ScreenUtil().setHeight(150),)),
              Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                                color: backgroundcolor,
                                borderRadius: BorderRadius.circular(22)),
                            child: TextButton.icon(
                                onPressed: () {},
                                icon: Icon(
                                  FontAwesome.trophy,
                                  color: Colors.white,
                                ),
                                label: Text(
                                  "View Chances",
                                  style: t1small,
                                )),
                          ),
                        )
            ],
          ),
        ),
      ),
    );
  }
}
