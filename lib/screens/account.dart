import 'package:flutter/material.dart';
class Account extends StatefulWidget {
  final String name;
  Account(this.name);
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
          SizedBox(height: 30.0,),
          Text('My Account', style: TextStyle(
              fontSize: 30.0,
            ),),
            Container(),
            SizedBox(height: 30.0,),
            Container(
            child: CircleAvatar(
                    backgroundImage: AssetImage('assets/icon.jpg'),
                    radius: 45.0,
                  ),
          ),
          SizedBox(height: 20.0,),
          Text('Username: ' +widget.name, style: TextStyle(
              fontSize: 20.0,
            ),),
          SizedBox(height: 20.0,),
            RaisedButton(
              onPressed: (){},
              child: Text(
                'Sync Calendar'
              ),
              )
          ]
    )
    )
    );
  }
}