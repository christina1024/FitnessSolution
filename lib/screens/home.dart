import 'dart:ui';
import 'package:fitness_solution/screens/login.dart';
import 'package:fitness_solution/screens/timeSelection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fitness_solution/models/progress.dart';
import 'package:fitness_solution/screens/navigate.dart';

class Home extends StatefulWidget {
  final String name;
  Home(this.name);
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //int _currentIndex=1;
  @override
  List<Progress> progress = [
    Progress(type: 'Push Ups', count: '200'),
    Progress(type: 'Sit Ups', count: '305'),
    Progress(type: 'Squat', count: '100'),
    Progress(type: 'Push Ups', count: '200'),
    Progress(type: 'Sit Ups', count: '305'),
    Progress(type: 'Squat', count: '100'),
  ];

  Widget progressTemplete(progress) {
    return Card(
      color: Color.fromRGBO(245, 245, 245, 0.7),
      margin: EdgeInsets.fromLTRB(15.0, 5.0, 15.0, 5.0),
      child: Row(
        children: <Widget>[
          SizedBox(width: 40.0),
          Expanded(
            flex: 2,
            child: Text(
              progress.type,
              style: TextStyle(
                fontSize: 15.0,
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(
              progress.count,
              //textAlign:TextAlign.right,
              style: TextStyle(
                fontSize: 15.0,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget build(BuildContext context) {
    
    return Scaffold(      
      /*appBar: AppBar(
        backgroundColor: Color.fromRGBO(12, 112, 125, 0.5),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Fitness Solutions',
              style: TextStyle(),
            ),
          ],
        ),
      ),*/
     
      body: Container(     
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/image2.jpg'),
          fit: BoxFit.cover,
          ),      
        ),
        child: Column(
        children: <Widget>[
          SizedBox(height: 50.0,),
          Container(
            child: CircleAvatar(
                    backgroundImage: AssetImage('assets/icon.jpg'),
                    radius: 45.0,
                  ),
          ),
          SizedBox(height: 10.0,),
          Text('Welcome, ' + widget.name, textAlign: TextAlign.center, style: TextStyle(
            fontSize: 30.0,
          ),),
          SizedBox(height: 20.0,),
          Text(
            'Progress',
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: 20.0,
            ),
          ),
          Container(
              margin: EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 10.0),
              //color: Color.fromRGBO(245, 245, 245,0.7),
              //padding: EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 220.0),
              child: Column(
                children: progress
                    .map((progress) => progressTemplete(progress))
                    .toList(),
              )),
          RaisedButton(
            onPressed: (){
                Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => TimeSelection(widget.name)));
              },
            child: Text(
              'START WORKOUT',
              style: TextStyle(
                fontSize: 20.0,
                color: Color.fromRGBO(245, 245, 245, 1),
              ),
            ),
            color: Color.fromRGBO(40, 38, 44, 1),
          ),
        ],
      ),
    )
    
    );
  }
}
