import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    Key key,
    this.text,
    this.onpressed,
  }) : super(key: key);
  final text;
  final onpressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        height: ScreenUtil().setHeight(40),
        width: ScreenUtil().setWidth(250),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.horizontal(
                left: Radius.circular(20.0), right: Radius.circular(20.0))),
        child: Padding(
          padding: const EdgeInsets.only(left: 15.0, right: 15),
          child: Center(
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: GoogleFonts.ptSans(fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
      onTap: onpressed,
    );
  }
}