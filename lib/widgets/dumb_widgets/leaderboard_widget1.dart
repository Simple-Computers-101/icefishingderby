import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icefishingderby/constants/colors.dart';

class Leaderboard1 extends StatelessWidget {
  final String ranking;
  final String username;
  final String image;
  final double weight;
  final double length;
  final Color crownColor;

  const Leaderboard1(
      {Key key,
      this.ranking,
      this.image,
      this.username,
      this.weight,
      this.length,
      this.crownColor})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().setWidth(110),
      decoration: BoxDecoration(
         color: widgetcolor,
         borderRadius: BorderRadius.circular(20)
      ),
     
      child: Padding(
        padding: const EdgeInsets.only(left:5.0,right: 5,bottom:10),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Text(
                ranking,
                style: GoogleFonts.montserrat(
                    color: Colors.white, fontSize: ScreenUtil().setSp(20)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(6.0),
              child: Icon(
                FlutterIcons.crown_faw5s,
                color: crownColor,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(6.0),
              child: CircleAvatar(
                radius: ScreenUtil().setHeight(30),
                backgroundImage: AssetImage('assets/' + image),
                backgroundColor: Colors.black,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Text(
                username,
                style: GoogleFonts.montserrat(
                    color: Colors.white, fontSize: ScreenUtil().setSp(14)),
              ),
            ),
            Padding(
               padding: const EdgeInsets.only(top:8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Icon(FlutterIcons.weight_faw5s,size: 15,color: Colors.white,),
                  Text(
                    '${weight} g',
                    style: GoogleFonts.montserrat(
                        color: Colors.green, fontSize: ScreenUtil().setSp(14)),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top:8.0),
              child: Row(
               mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Icon(FlutterIcons.ruler_ent,size: 15,color: Colors.white,),
                  Text(
                    '${length} cm',
                    style: GoogleFonts.montserrat(
                        color: Colors.red, fontSize: ScreenUtil().setSp(14)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
