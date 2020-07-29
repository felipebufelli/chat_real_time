import 'dart:io';

import 'package:chat_real_time/colors.dart';
import 'package:chat_real_time/screens/home/widgets/chat_message.dart';
import 'package:chat_real_time/screens/home/widgets/text_composer.dart';
import 'package:chat_real_time/screens/login/login.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class HomeScreen extends StatefulWidget {

  HomeScreen({this.user});

  final FirebaseUser user;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  bool _isLoading = false;


  void _sendMessage({String text, File imgFile}) async {

    Map<String, dynamic> data = {
      'uid': widget.user.uid,
      'senderName': widget.user.displayName,
      'senderPhotoUrl': widget.user.photoUrl,
      'time': Timestamp.now(),
    };

    if(imgFile != null) {
      StorageUploadTask task = FirebaseStorage.instance.ref().child(
        widget.user.uid + DateTime.now().millisecondsSinceEpoch.toString()
      ).putFile(imgFile);

      setState(() {
        _isLoading = true;
      });

      StorageTaskSnapshot taskSnapshot = await task.onComplete;
      String url = await taskSnapshot.ref.getDownloadURL();
      data['imgUrl'] = url;

      setState(() {
        _isLoading = false;
      });

    }

    if(text != null) {
      data['text'] = text;
    }

    Firestore.instance.collection('messages').add(data);
  }

  @override
  Widget build(BuildContext context) {

    final GoogleSignIn googleSignIn = GoogleSignIn();
    return Scaffold(
      appBar: AppBar(
        title: Text("Olá, ${widget.user.displayName}"),
        elevation: 0,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.exit_to_app), 
            onPressed: (){
              FirebaseAuth.instance.signOut();
              googleSignIn.signOut();
              Future.delayed(Duration(seconds: 0)).then((_) {
                Navigator.of(context)
                .pushReplacement(MaterialPageRoute(builder: (context) => LoginScreen()));
              });
            }
          ),
        ],
      ),
      body: Container(
        color: white,
        child: Column(
          children: <Widget>[
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream: Firestore.instance.collection('messages').orderBy('time').snapshots(),
                builder: (context, snapshot){
                  switch (snapshot.connectionState) {
                    case ConnectionState.none:
                    case ConnectionState.waiting:
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    default:
                      List<DocumentSnapshot> documents = 
                        snapshot.data.documents.reversed.toList();
                      return ListView.builder(
                        itemCount: documents.length,
                        reverse: true, //mensagens de baixo para cima
                        itemBuilder: (context, index) {
                          return ChatMessage(
                            data: documents[index].data,
                            isMine: documents[index].data['uid'] == widget.user.uid,
                          );
                        }
                      );
                  }
                },
              )
            ),
            _isLoading ? 
              LinearProgressIndicator(
                valueColor: AlwaysStoppedAnimation(pinkDark),
                backgroundColor: grey,
              ) 
            : 
              Container(),
            TextComposer(
              _sendMessage,
            ),
          ],
        ),
      ),
    );
  }
}