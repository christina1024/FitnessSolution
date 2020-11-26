import 'package:flutter/material.dart';
import 'package:fitness_solution/models/workload.dart';

class WorkoutPlan extends StatefulWidget {
  @override
  _WorkoutPlanState createState() => _WorkoutPlanState();
}

class _WorkoutPlanState extends State<WorkoutPlan> {
  Color _myColor=Colors.blueGrey[100];
  Color _myColor2=Colors.blueGrey[100];
  Color _myColor3=Colors.blueGrey[100];
  Color _myColor4=Colors.blueGrey[100];
  Color _myColor5=Colors.blueGrey[100];
  List<Workload> workload=[
    Workload(image:'assets/PushUp.jpg', workname:'Push Ups', workcount:5),
    Workload(image:'assets/squatfeat.jpg', workname:'Squats', workcount:15),
    Workload(image:'assets/sitUp.jpg', workname:'Sit Ups', workcount:10),
    Workload(image:'assets/plank.jpg', workname:'Plank', workcount:30),
  ];
  Widget workoutPlanTemplete(workload){
    return Card(
      margin: EdgeInsets.fromLTRB(15.0, 5.0, 15.0, 5.0),
      color: Color.fromRGBO(	255, 255, 255, 0.9),
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 2,
            child: Image.asset(workload.image, height: 50.0, width: 80.0,),),
          Expanded(
            flex: 3,
            child: Text(workload.workname, style: TextStyle(
              fontSize: 20.0,
            ),)),
            Expanded(
            flex: 1,
            child: Text(workload.workcount.toString(), style: TextStyle(
              fontSize: 20.0,
            ),))
        ],
      ),
    );
  }
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
          Text('Notification Preference', style: TextStyle(
              fontSize: 25.0,
            ),),
            SizedBox(height: 20.0,),
            Container(
              child: Row(
                children: <Widget>[
                  SizedBox(width: 35.0,),
                  RaisedButton(
                    child: Text("6:00-9:00"),
                    color: _myColor,
                    onPressed: (){
                      setState(() {
                        if(_myColor==Colors.blueGrey[100]){
                          _myColor=Colors.cyan[600];
                        }
                        else{
                         _myColor=Colors.blueGrey[100];
                        }
                      });
                    }),
                    SizedBox(width: 20.0,),
                  RaisedButton(
                    child: Text("9:00-12:00"),
                    color: _myColor2,
                    onPressed: (){
                      setState(() {
                        if(_myColor2==Colors.blueGrey[100]){
                          _myColor2=Colors.cyan[600];
                        }
                        else{
                         _myColor2=Colors.blueGrey[100];
                        }
                      });
                    }),
                    SizedBox(width: 20.0,),
                  RaisedButton(
                    child: Text("12:00-15:00"),
                    color: _myColor3,
                    onPressed: (){
                      setState(() {
                        if(_myColor3==Colors.blueGrey[100]){
                          _myColor3=Colors.cyan[600];
                        }
                        else{
                         _myColor3=Colors.blueGrey[100];
                        }
                      });
                    }),
                ]
              ),
            ),
            Container(
              child: Row(
                children: <Widget>[
                  SizedBox(width: 35.0,),
                  RaisedButton(
                    child: Text("15:00-18:00"),
                    color: _myColor4,
                    onPressed: (){
                      setState(() {
                        if(_myColor4==Colors.blueGrey[100]){
                          _myColor4=Colors.cyan[600];
                        }
                        else{
                         _myColor4=Colors.blueGrey[100];
                        }
                      });
                    }),
                    SizedBox(width: 20.0,),
                  RaisedButton(
                    child: Text("18:00-21:00"),
                    color: _myColor5,
                    onPressed: (){
                      setState(() {
                        if(_myColor5==Colors.blueGrey[100]){
                          _myColor5=Colors.cyan[600];
                        }
                        else{
                         _myColor5=Colors.blueGrey[100];
                        }
                      });
                    }),
          
                ]
              ),
            ),
            SizedBox(height: 30.0,),
          Text('Workout Preference', style: TextStyle(
              fontSize: 25.0,
            ),),
            SizedBox(height: 20.0,),
           // Container(
              //ListView(children: [
              Column(children: workload
              .map((workload) => workoutPlanTemplete(workload))
              .toList(),
             // ],
              )
           // ),
            
          ]
    )
    )
    );
  }
}