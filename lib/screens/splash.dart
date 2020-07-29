import 'package:chat_real_time/screens/login/login.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3)).then((_) {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) => LoginScreen()));
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/background.png"),
          )
        ),
        child: Center(
          child: Image.asset(
            "images/icon.png",
            width: 137.0,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}