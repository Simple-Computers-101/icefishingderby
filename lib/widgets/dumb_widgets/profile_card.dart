import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icefishingderby/constants/colors.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({
    Key key,
    this.icon,
    this.title,
    this.subtitle,
    this.onpressed,
  }) : super(key: key);
  final icon;
  final title;
  final subtitle;
  final onpressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            color: Color(0xFF35415C), borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            leading: Icon(
              icon,
              color: Color(0xFF83A1E1),
            ),
            title: Text(
              title,
              style: GoogleFonts.abel(color: Colors.white),
            ),
            subtitle: Text(
              subtitle,
              style: GoogleFonts.abel(color: Colors.white, fontSize: 11),
            ),
            onTap: onpressed,
          ),
        ),
      ),
    );
  }
}