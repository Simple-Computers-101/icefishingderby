import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icefishingderby/constants/colors.dart';

class LeaderboardCard extends StatelessWidget {
  final String rank;
  final String image;
  final String username;
  final double weight;
  final double length;

  const LeaderboardCard(
      {Key key, this.rank, this.username, this.image, this.weight, this.length})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            Text(
              rank,
              style: GoogleFonts.montserrat(
                  color: Colors.white,
                  fontSize: ScreenUtil().setSp(16),
                  fontWeight: FontWeight.w600),
            ),
            SizedBox(
              width: ScreenUtil().setWidth(20),
            ),
            Container(
              width: ScreenUtil().setWidth(320),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20), color: widgetcolor),
              child: Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: Row(
                  children: [
                    Container(
                      height: ScreenUtil().setHeight(60),
                      width: ScreenUtil().setWidth(80),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage('assets/' + image))),
                    ),
                    SizedBox(
                      width: ScreenUtil().setWidth(20),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          username,
                          style: GoogleFonts.montserrat(
                              color: Colors.white,
                              fontSize: ScreenUtil().setSp(14)),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Padding(
                                 padding: const EdgeInsets.only(right:8.0),
                                child: Icon(
                                  FlutterIcons.weight_faw5s,
                                  size: 15,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                '${weight} g',
                                style: GoogleFonts.montserrat(
                                    color: Colors.green,
                                    fontSize: ScreenUtil().setSp(14)),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right:8.0),
                                child: Icon(
                                  FlutterIcons.ruler_ent,
                                  size: 15,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                '${length} cm',
                                style: GoogleFonts.montserrat(
                                    color: Colors.red,
                                    fontSize: ScreenUtil().setSp(14)),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
