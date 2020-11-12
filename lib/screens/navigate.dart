import 'package:fitness_solution/screens/home.dart';
import 'package:fitness_solution/screens/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fitness_solution/screens/account.dart';
import 'package:fitness_solution/screens/workoutPlan.dart';

class BotNavigate extends StatefulWidget {
  final String name1;
  BotNavigate(this.name1);
  @override
  _BotNavigate createState() => _BotNavigate();
}

class _BotNavigate extends State<BotNavigate> {
  int _currentIndex=0;
  void onTappedBar(int index){
  setState(() {
    _currentIndex=index;
  });
}
  
   List<Widget> _children()=>[
    Home(widget.name1),
    WorkoutPlan(),
    Account(widget.name1),
    LoginPage(),
  ];
  

  @override
  Widget build(BuildContext context) {
    final List<Widget> children=_children();
    return Scaffold(
      
      body: children[_currentIndex], 
      
      bottomNavigationBar: BottomNavigationBar
      (
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        onTap: onTappedBar,
        items: [
        BottomNavigationBarItem(
            icon:   Icon(Icons.home),
            title:  Text('Home'),
            backgroundColor: Colors.blue,
    
          ),

          BottomNavigationBarItem(
            icon:   Icon(Icons.work),
            title:  Text('Workout'),
            backgroundColor: Colors.blue,
    
          ),
          

          BottomNavigationBarItem(
            icon:   Icon(Icons.person),
            title:  Text("Account"),
            backgroundColor: Colors.blue,
    
          ),
        
          BottomNavigationBarItem(
            icon: Icon(Icons.logout),
            title: Text('Logout'),
            backgroundColor: Colors.blue,
    
          ),
          
        ],),
    );
  }
  //}
}
