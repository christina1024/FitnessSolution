import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fitness_solution/screens/login.dart';
import 'package:fitness_solution/screens/home.dart';
import 'package:fitness_solution/screens/timeSelection.dart';
import 'package:fitness_solution/screens/navigate.dart';

void main() => runApp(MaterialApp(
  //home: NaveBar(),
  initialRoute: '/login',
  routes: {
    '/login':(context) => LoginPage(),
  },
));

