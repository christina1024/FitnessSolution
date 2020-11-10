import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  final String name;
  HomePage(this.name);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Welcome, ' + widget.name + '!', textAlign: TextAlign.center)
          ],
        ),
      ),
    );
  }
}
