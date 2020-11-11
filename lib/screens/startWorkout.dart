import 'package:flutter/material.dart';
import 'package:fitness_solution/screens/navigate.dart';

class StartWorkout extends StatefulWidget {
  final String name;
  final String time;
  StartWorkout(this.name, this.time);
  @override
  _StartWorkoutState createState() => _StartWorkoutState();
}

class _StartWorkoutState extends State<StartWorkout> {
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
          Text(widget.time + ' minutes workout', style: TextStyle(
              fontSize: 30.0,
            ),),
            Container(),
          RaisedButton(
              onPressed: (){
                Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => BotNavigate(widget.name)));
              },
              child: Text(
              'End Workout',
              style: TextStyle(
                fontSize: 30.0,
                //color: Colors.black,
              ),
            ),
            //padding: EdgeInsets.fromLTRB(50.0, 15.0, 50.0, 15.0),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            //color: Color.fromRGBO(	11, 51, 116, 0.1),
              ),
          ]
    )
    )
    );
  }
}