import 'package:fitness_solution/screens/home.dart';
import 'package:fitness_solution/screens/navigate.dart';
import 'package:flutter/material.dart';

class TimeSelection extends StatefulWidget {
  final String name;
  TimeSelection(this.name);
  @override
  _TimeSelectionState createState() => _TimeSelectionState();
}

class _TimeSelectionState extends State<TimeSelection> {
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
          children:<Widget> [
            SizedBox(height: 50.0,),
            Text('Choose Workout Time', style: TextStyle(
              fontSize: 30.0,
            ),),
            Container(),
            SizedBox(height: 30.0,),
            RaisedButton(
              onPressed: (){},
              child: Text(
              '2 minutes section',
              style: TextStyle(
                fontSize: 20.0,
                color: Color.fromRGBO(245, 245, 245, 1),
              ),
            ),
            padding: EdgeInsets.fromLTRB(65.0, 15.0, 65.0, 15.0),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            color: Color.fromRGBO(	11, 51, 116, 0.9),
              ),
              SizedBox(height: 30.0,),
            RaisedButton(
              onPressed: (){},
              child: Text(
              '5 minutes section',
              style: TextStyle(
                fontSize: 20.0,
                color: Color.fromRGBO(245, 245, 245, 1),
              ),
            ),
            padding: EdgeInsets.fromLTRB(65.0, 15.0, 65.0, 15.0),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            color: Color.fromRGBO(	11, 51, 116, 0.9),
              ),
              SizedBox(height: 30.0,),
            RaisedButton(
              onPressed: (){},
              child: Text(
              '10 minutes section',
              style: TextStyle(
                fontSize: 20.0,
                color: Color.fromRGBO(245, 245, 245, 1),
              ),
            ),
            padding: EdgeInsets.fromLTRB(60.0, 15.0, 60.0, 15.0),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            color: Color.fromRGBO(	11, 51, 116, 0.9),
              ),
              SizedBox(height: 30.0,),
            RaisedButton(
              onPressed: (){},
              child: Text(
              '20 minutes section',
              style: TextStyle(
                fontSize: 20.0,
                color: Color.fromRGBO(245, 245, 245, 1),
              ),
            ),
            padding: EdgeInsets.fromLTRB(60.0, 15.0, 60.0, 15.0),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            color: Color.fromRGBO(	11, 51, 116, 0.9),
              ),
              SizedBox(height: 30.0,),
            RaisedButton(
              onPressed: (){},
              child: Text(
              '40 minutes full section',
              style: TextStyle(
                fontSize: 20.0,
                color: Color.fromRGBO(245, 245, 245, 1),
              ),
            ),
            padding: EdgeInsets.fromLTRB(45.0, 15.0, 45.0, 15.0),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            color: Color.fromRGBO(	11, 51, 116, 0.9),
              ),
              SizedBox(height: 30.0,),
            RaisedButton(
              onPressed: (){
                Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => BotNavigate(widget.name)));
              },
              child: Text(
              'Not a Good Time',
              style: TextStyle(
                fontSize: 20.0,
                color: Color.fromRGBO(245, 245, 245, 1),
              ),
            ),
            padding: EdgeInsets.fromLTRB(70.0, 15.0, 70.0, 15.0),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            color: Color.fromRGBO(	11, 51, 116, 0.9),
              ),
          ],
        ),
        ),
      
    );
  }
}
