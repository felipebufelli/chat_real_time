import 'package:flutter/material.dart';

class ChatMessage extends StatelessWidget {

  ChatMessage({this.data});

  final Map<String, dynamic> data;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
      child: Row(
        children: <Widget>[
          CircleAvatar(
            backgroundImage: NetworkImage(data['senderPhotoUrl']),
            
          )
        ],
      ),
    );
  }
}