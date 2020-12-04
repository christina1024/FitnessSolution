import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../screens/homepage.dart';
import '../screens/notification.dart';
import '../services/auth.dart';
import '../services/calendar.dart';
import '../models/event.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/image1.jpg'),
          fit: BoxFit.cover,
          ),      
        ),
        child: Column(children: <Widget> [
          SizedBox(height: 50.0),
          Image.asset('assets/icon.jpg', height: 60.0,),
          SizedBox(height: 10.0,),
          Text('Fitness Solution', style: TextStyle(
            fontSize: 35.0,
            color: Color.fromRGBO(91, 148, 240, 0.7),)),
            SizedBox(height: 50.0,),
          Body(),
        ],),
        ),
    );
  }
}

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  FirebaseUser user;
  List<Event> events;

  /// Logs the user out on every app restart
  @override
  void initState() {
    super.initState();
    signOutGoogle();
  }

  /// Signs user into Google account and transitions to HomePage
  void click() {
    signInWithGoogle().then((user) => {
          // HttpService().getData(),
          this.user = user,
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => LNotification(user.displayName)))
        });
  }

  Widget googleLoginButton() {
    return OutlineButton(
        onPressed: this.click,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(45)),
        splashColor: Colors.grey,
        borderSide: BorderSide(color: Colors.grey),
        child: Padding(
            padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
            child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image(
                      image: AssetImage('assets/google_logo.png'), height: 35),
                  Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Text('Sign in with Google',
                          style: TextStyle(color: Colors.grey, fontSize: 25)))
                ])));
  }

  @override
  Widget build(BuildContext context) {
    return Align(alignment: Alignment.center, child: googleLoginButton());
  }
}
