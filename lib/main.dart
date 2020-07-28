import 'package:chat_real_time/screens/splash.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());

  Firestore.instance.collection("col").document("doc").setData({"texto": "Daniel"});
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Splash()
    );
  }
}
