import 'package:flutter/material.dart';
import 'package:fitness_solution/models/workload.dart';

class WorkoutPlan extends StatefulWidget {
  @override
  _WorkoutPlanState createState() => _WorkoutPlanState();
}

class _WorkoutPlanState extends State<WorkoutPlan> {
  List<Workload> workload=[
    Workload(image:'assets/PushUp.jpg', workname:'Push Ups', workcount:5),
    Workload(image:'assets/squatfeat.jpg', workname:'Squats', workcount:15),
  ];
  Widget workoutPlanTemplete(workload){
    return Card(
      margin: EdgeInsets.fromLTRB(15.0, 5.0, 15.0, 5.0),
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
          Text('My Workout', style: TextStyle(
              fontSize: 30.0,
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