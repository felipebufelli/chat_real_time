import 'package:chat_real_time/colors.dart';
import 'package:chat_real_time/screens/splash.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chat Real Time',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: pinkDark,
        iconTheme: IconThemeData(
          color: pinkDark,
        )
      ),
      home: SplashScreen()
    );
  }
}
