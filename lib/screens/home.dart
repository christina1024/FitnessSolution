import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fitness_solution/models/progress.dart';
import 'package:fitness_solution/screens/timeSelection.dart';

class Home extends StatelessWidget {
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
      margin: EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
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
      backgroundColor: Color.fromRGBO(12, 112, 125, 1),
      appBar: AppBar(
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
      ),
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 20.0,
          ),
          Container(
            margin: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
            //color: Color.fromRGBO(245, 245, 245,0.7),
            //padding: EdgeInsets.fromLTRB(50.0, 50.0, 50.0, 50.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  width: 80.0,
                ),
                Center(
                  child: CircleAvatar(
                    backgroundImage: AssetImage('assets/icon.jpg'),
                    radius: 45.0,
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(20.0, 10.0, 10.0, 10.0),
                  child: Text(
                    'Lisa John',
                    style: TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                ),
              ],
            ),
          ),
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
            onPressed: () {
              Navigator.pushNamed(context, '/timeSelection');
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
    );
  }
}
