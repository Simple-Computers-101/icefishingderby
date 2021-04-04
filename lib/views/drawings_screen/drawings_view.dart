import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icefishingderby/constants/colors.dart';
import 'package:icefishingderby/views/drawings_screen/drawings_model.dart';
import 'package:stacked/stacked.dart';

class DrawingsView extends StatefulWidget {
  @override
  _DrawingsViewState createState() => _DrawingsViewState();
}

class _DrawingsViewState extends State<DrawingsView> {
  var _currentIndex = 0;
  var pageController = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<DrawingsModel>.reactive(
      builder: (context, vm, _) {
        return Scaffold(
          appBar: AppBar(
            title: Text(_currentIndex == 0 ? "My Drawings" : "My Winnings"),
            actions: [
              Transform.rotate(
                angle: _currentIndex == 0 ? pi : 0,
                child: IconButton(
                  icon: Icon(Icons.arrow_back_rounded),
                  onPressed: () {
                    setState(() {
                      _currentIndex = _currentIndex == 0 ? 1 : 0;
                      pageController.animateToPage(_currentIndex,
                          curve: Curves.easeInOut,
                          duration: Duration(
                            seconds: 1,
                          ));
                    });
                  },
                ),
              )
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: PageView(
              children: [
                _buildDrawingsPage(),
                Container(),
              ],
              controller: pageController,
              onPageChanged: (val) {
                setState(() {
                  _currentIndex = val;
                });
              },
            ),
          ),
        );
      },
      viewModelBuilder: () => DrawingsModel(),
    );
  }

  Column _buildDrawingsPage() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          margin: EdgeInsets.all(20),
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  'assets/icons/banners.png',
                ),
                colorFilter:
                    ColorFilter.mode(backgroundcolor, BlendMode.overlay)),
          ),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('5\n',
                    style: GoogleFonts.montserrat(
                      color: Colors.white,
                      fontSize: 100,
                    )),
                Text('My Chances',
                    style: GoogleFonts.montserrat(
                      color: Colors.white,
                      fontSize: 20,
                    )),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
                color: widgetcolor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50),
                  topRight: Radius.circular(50),
                )),
            child: DataTable(
              headingTextStyle: GoogleFonts.montserrat(
                color: Colors.white,
              ),
              dataTextStyle: GoogleFonts.montserrat(
                color: Colors.white,
              ),
              columns: [
                DataColumn(
                  label: Text(''),
                ),
                DataColumn(
                  label: Text('Category'),
                ),
                DataColumn(
                  label: Text(
                    'Total Chances',
                    softWrap: true,
                  ),
                ),
              ],
              rows: [
                for (int i = 0; i < 2; i++)
                  DataRow(cells: [
                    DataCell(
                      Image.asset(
                        'assets/icons/plane-ticket.png',
                        width: 35,
                      ),
                    ),
                    DataCell(
                      Text("${i % 2 == 0 ? 'Category A' : 'Category B'}"),
                    ),
                    DataCell(
                      Text("${i % 2 == 0 ? 4 : 1}"),
                    ),
                  ])
              ],
            ),
          ),
        )
      ],
    );
  }
}
