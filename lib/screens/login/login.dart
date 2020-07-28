import 'package:chat_real_time/screens/login/widgets/google_bottom.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/background.png"),
          ),
        ),
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 60.0, bottom: 200.0),
              child: Image.asset(
                "images/icon.png",
                width: 137.0,
                fit: BoxFit.cover,
              ),
            ),
            GoogleBottom(),
          ],
        ),
      ),
    );
  }
}