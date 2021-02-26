import 'package:flutter/material.dart';

class Field extends StatelessWidget {
  const Field({
    Key key,
    this.hinttext,
    this.onchanged,
    this.type,
    this.registerFormKey,
  }) : super(key: key);

  final hinttext;
  final type;
  final onchanged;
  final registerFormKey;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15, left: 15, right: 15, bottom: 10),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(20)),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.black,
              blurRadius: 4,
              offset: Offset(4, 4),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: Container(
            height: 40,
            child: Center(
              child: TextFormField(
                maxLines: 1,
                obscureText: type,
                onChanged: onchanged,
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'WorkSans',
                ),
                cursorColor: Color(0xFF4FBE9F),
                decoration: new InputDecoration(
                  border: InputBorder.none,
                  hintText: hinttext,
                  hintStyle: TextStyle(color: Colors.grey),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
