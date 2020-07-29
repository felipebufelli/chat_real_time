import 'package:chat_real_time/screens/home/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:chat_real_time/colors.dart';


class GoogleBottom extends StatefulWidget {
  @override
  _GoogleBottomState createState() => _GoogleBottomState();
}

class _GoogleBottomState extends State<GoogleBottom> {

 final GoogleSignIn googleSignIn = GoogleSignIn();

  Future<FirebaseUser> _getUser() async {
    try {
      final GoogleSignInAccount googleSignInAccount = 
        await googleSignIn.signIn(); 

      final GoogleSignInAuthentication googleSignInAuthentication = 
        await googleSignInAccount.authentication;

      final AuthCredential credential = GoogleAuthProvider.getCredential(
        idToken: googleSignInAuthentication.idToken, 
        accessToken: googleSignInAuthentication.accessToken,
      );

      final AuthResult authResult = 
        await FirebaseAuth.instance.signInWithCredential(credential);
      
      final FirebaseUser user = authResult.user;
      return user;
    } catch (error) {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        _getUser().then((user){
          Future.delayed(Duration(seconds: 0)).then((_) {
            Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) => HomeScreen(user: user,)));
          });
        });
      },
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
