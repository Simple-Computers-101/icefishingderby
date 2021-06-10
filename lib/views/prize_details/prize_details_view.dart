import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icefishingderby/constants/colors.dart';
import 'package:icefishingderby/constants/fonts.dart';
import 'package:stacked/stacked.dart';
import 'prize_details_view_model.dart';

class PrizeDetailsView extends StatefulWidget {
  @override
  _PrizeDetailsViewState createState() => _PrizeDetailsViewState();
}

class _PrizeDetailsViewState extends State<PrizeDetailsView> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<PrizeDetailsViewModel>.reactive(
      builder:
          (BuildContext context, PrizeDetailsViewModel viewModel, Widget _) {
        return Stack(
          children: [
            Scaffold(
              backgroundColor: backgroundcolor,
              appBar: AppBar(
                backgroundColor: backgroundcolor,
                elevation: 0,
                title: Icon(
                  FontAwesome.trophy,
                  size: 30,
                ),
              ),
              body: ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                        width: ScreenUtil().setWidth(double.infinity),
                        height: ScreenUtil().setHeight(120),
                        decoration: BoxDecoration(
                            color: widgetcolor,
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(35),
                                bottomRight: Radius.circular(35))),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.network(
                            viewModel.prize['raw_details']['image'],
                            height: ScreenUtil().setHeight(100),
                          ),
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(15),
                                bottomRight: Radius.circular(15))),
                        child: Text(
                          viewModel.prize['raw_details']['name'],
                          style: t1,
                        ),
                      ),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListTile(
                          minLeadingWidth: 2,
                          horizontalTitleGap: 3,

                          tileColor: widgetcolor,
                          leading: Text(
                            'Winner',
                            style: t1,
                          ),
                          trailing: Text(
                            viewModel.winner,
                            style: t1,
                          ),
                          //  title: Icon(FontAwesome.trophy, color: Colors.orange,),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListTile(
                          tileColor: widgetcolor,
                          leading: Text(
                            'Total Tickets',
                            style: t1,
                          ),
                          trailing: Text(
                            viewModel.isFetchingAllTickets
                                ? "Fetching..."
                                : "${viewModel.allTickets}",
                            style: t1,
                          ),
                          //title: Icon(FontAwesome.ticket, color: Colors.orange,),
                        ),
                      ),
                      Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ListTile(
                            tileColor: widgetcolor,
                            leading: Text(
                              'Your Tickets',
                              style: t1,
                            ),
                            trailing: Text(
                              viewModel.isFetchingMyTickets
                                  ? "Fetching..."
                                  : viewModel.myTickets.exists
                                      ? "${viewModel.myTickets['ticket_count']}"
                                      : "0",
                              style: t1,
                            ),
                            //  title: Icon(FontAwesome.ticket, color: Colors.orange,),
                          )),
                    ],
                  ),
                  OutlinedButton.icon(
                      onPressed: () {
                        viewModel.openDialog();
                      },
                      icon: Icon(FontAwesome.cart_plus),
                      label: Text(
                        'Buy More Tickets',
                        style: t1,
                      ))
                ],
              ),
            ),
            if (viewModel.showDialog)
              Container(
                color: Colors.black54,
                child: SimpleDialog(
                  backgroundColor: backgroundcolor,
                  titleTextStyle: t1,
                  titlePadding: EdgeInsets.all(12.0),
                  elevation: 50,
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Buy more tickets."),
                      ButtonTheme(
                        padding: EdgeInsets.zero,
                        child: IconButton(
                            alignment: Alignment.centerRight,
                            icon: Icon(Icons.close, color: Colors.white),
                            onPressed: viewModel.closeDialog),
                      )
                    ],
                  ),
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 15),
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.white30,
                          ),
                          borderRadius: BorderRadius.circular(10)),
                      child: DropdownButtonFormField(
                          isExpanded: true,
                          // style: t1small,
                          hint: Text(
                            "Select chances",
                            style: t1small,
                          ),
                          // dropdownColor: Colors.white,
                          value: viewModel.newChances,
                          onChanged: viewModel.setMoreChances,
                          items: [
                            DropdownMenuItem(
                                child: Container(
                                  child: Text(
                                    "Select your tickets",
                                    style: t1small,
                                  ),
                                ),
                                value: "0"),
                            ...[1, 3, 7, -1].map(
                              (e) => DropdownMenuItem(
                                child: Text(
                                  e == -1 ? "Custom" : "$e",
                                  style: t1small,
                                ),
                                value: "$e",
                              ),
                            ),
                          ]),
                    ),
                    if (viewModel.newChances == "-1")
                      Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                        // padding: EdgeInsets.symmetric(horizontal: 5),
                        child: TextFormField(
                          style: t1small,
                          decoration: InputDecoration(
                            hintText: "Custom Chances",
                            hintStyle: TextStyle(color: Colors.white),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Colors.white30),
                            ),
                          ),
                          keyboardType: TextInputType.number,
                          onChanged: viewModel.setCustomChances,
                        ),
                      ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: viewModel.buyChances,
                          child: Text("Buy"),
                        )
                      ],
                    )
                  ],
                ),
              )
          ],
        );
      },
      viewModelBuilder: () => PrizeDetailsViewModel(context),
    );
  }
}
