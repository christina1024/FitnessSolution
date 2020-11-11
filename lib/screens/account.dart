import 'package:flutter/material.dart';
class Account extends StatefulWidget {
  @override
  _AccountState createState() => _AccountState();
}

class _AccountState extends State<Account> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(     
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/image2.jpg'),
          fit: BoxFit.cover,
          ),      
        ),
        child: Column(
        children: <Widget>[
          SizedBox(height: 50.0,),
          Text('My Account', style: TextStyle(
              fontSize: 30.0,
            ),),
            Container(),
          ]
    )
    )
    );
  }
}