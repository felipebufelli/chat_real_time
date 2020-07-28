import 'package:flutter/material.dart';
import 'package:chat_real_time/colors.dart';

class GoogleBottom extends StatefulWidget {
  @override
  _GoogleBottomState createState() => _GoogleBottomState();
}

class _GoogleBottomState extends State<GoogleBottom> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){},
      child: Container(
        decoration: BoxDecoration(
          color: redDark,
          borderRadius: BorderRadius.circular(30),
        ),
        width: 300.0,
        height: 50,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 30.0),
              child: Image.asset("images/google.png", fit: BoxFit.cover),
            ),
            SizedBox(width: 30.0,),
            Text(
              "Continue com Google",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w700,
                color: white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
