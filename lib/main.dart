import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fitness_solution/Home.dart';
import 'package:fitness_solution/Time_Selection.dart';


void main() => runApp(MaterialApp(
  //home: NaveBar(),
  initialRoute: '/home',
  routes: {
    '/home':(context) => Home(),
    '/time_selection':(context)=> Time_Selection(),
  },
));

