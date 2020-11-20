import 'package:flutter/material.dart';
import 'package:fitness_solution/models/workload.dart';
import 'package:fitness_solution/screens/navigate.dart';
import 'dart:async';

class StartWorkout extends StatefulWidget {
  final String name;
  final String time;
  StartWorkout(this.name, this.time);
  @override
  _StartWorkoutState createState() => _StartWorkoutState();
}

class _StartWorkoutState extends State<StartWorkout> {

  bool visibilityforward=true;
  bool visibilitybackward=false;
  bool pause=false;
  int count=0;
  int _countTimer=5;
  Timer _timer;

  void _startTimer(){
    if(_timer != null){
      _timer.cancel();
    }
    _timer=Timer.periodic(Duration(seconds: 1), (timer) { 
      setState(() {
        if(_countTimer>0){
          _countTimer--;
        }
        else{
          _timer.cancel();
          changestate('add');
        }
      });
    });
  }

  void pauseTimer(){
    if(pause==true){
      pause=false;
      _startTimer();
    }
    else{
      pause=true;
      _timer.cancel();
    }
  }
  List<Workload> workload =[
    Workload(image:'assets/PushUp.jpg', workname:'5 Push Ups', workcount:5),
    Workload(image:'assets/squatfeat.jpg', workname:'15 Squats', workcount:15),
  ];

  void changestate(String increment){
    setState(() {
      if(increment=='add'){
        if(count<workload.length-1){
          visibilitybackward=true;
          count++;
          _countTimer=workload[count].workcount;
          _startTimer();
        }
        if(count==workload.length-1){
          visibilityforward=false;
        }
        
      }
      else{
        if(count>0){
          visibilityforward=true;
          count--;
          _countTimer=workload[count].workcount;
          _startTimer();
        }
        if(count==0){
          visibilitybackward=false;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    _startTimer();
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
          Text( workload[count].workname, style: TextStyle(
              fontSize: 25.0,
            ),),

            SizedBox(height: 20.0,),
            Image.asset(workload[count].image, height: 200.0,),
          
          SizedBox(height: 40.0,),
          Text('Count down:', style: TextStyle(fontSize: 20.0),),
          SizedBox(height: 20.0,),
          Text('$_countTimer' ,style: TextStyle(
            //fontWeight: FontWeight.bold,
            fontSize: 40.0,
          ),),
          SizedBox(height: 40.0,),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                visibilitybackward ? IconButton(
                   icon: Icon(Icons.arrow_left_rounded),
                   color: Colors.blueGrey,
                  iconSize: 80.0,
                  tooltip: 'Go back to the previous exercises ', 
                  onPressed: (){changestate('sub');}):  Container(
                    padding: EdgeInsets.all(40.0)),
                  IconButton(
                  icon: Icon(Icons.pause_outlined),
                  color: Colors.blueGrey,
                  iconSize: 60.0,
                  tooltip: 'pause the current exercises ', 
                  onPressed: (){
                    pauseTimer();
                  }),
                 visibilityforward ?  IconButton(
                  icon: Icon(Icons.arrow_right_rounded),
                  color: Colors.blueGrey,
                  iconSize: 80.0,
                  tooltip: 'fast forward to the next exercises ', 
                  onPressed: (){changestate('add');}): new Container(
                    padding: EdgeInsets.all(40.0),
                  ),
              ],
            ),
          ),
          SizedBox(height: 20.0,),
          RaisedButton(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            color: Colors.transparent,
              onPressed: (){
                Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => BotNavigate(widget.name)));
              },
              child: Text(
              'End Workout',
              style: TextStyle(
                fontSize: 20.0,
                //color: Colors.black,
              ),
            ),
            //padding: EdgeInsets.fromLTRB(50.0, 15.0, 50.0, 15.0),
            
              ),
          ]
    )
    )
    );
  }
}