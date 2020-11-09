import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: MyApp(),));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext){
    return Scaffold(
      backgroundColor: Color.fromRGBO(	12, 112, 125,1),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(	12, 112, 125,0.5),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children:[
            FlatButton(
              onPressed:(){},
              child: Container(
                  padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 10.0),
                  child: Image.asset('assets/icon.jpg', height: 45,)
              ),
            ),
            Text('Fitness Solution', style: TextStyle(

            ),),
          ],
        ),
      ),
       body: Column(

        children: <Widget>[
          Container(
            margin: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
            color: Color.fromRGBO(245, 245, 245,0.7),
            //padding: EdgeInsets.fromLTRB(50.0, 50.0, 50.0, 50.0),
            child:Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
               Container(
                  padding: EdgeInsets.fromLTRB(50.0, 10.0, 0.0, 10.0),
                   child: Image.asset('assets/profile.png', height: 80),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(20.0, 10.0, 10.0, 10.0),
                  child: Text('Lisa John', style: TextStyle(
                  fontSize: 20.0,
                  ),),
                ),
             ],
            ),
          ),

          Container(
              margin: EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 10.0),
              color: Color.fromRGBO(245, 245, 245,0.7),
              //padding: EdgeInsets.fromLTRB(0.0, 10.0, 300.0, 120.0),
            child: Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.fromLTRB(0.0, 10.0, 270.0, 20.0),
                  child: Text('Progress',
                  style: TextStyle(
                    fontSize: 20.0,
                  ),),
                ),
                Container(
                  child:Text('Push ups                          200 done', style: TextStyle(fontSize: 15.0,),),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(0.0, 100.0, 350.0, 90.0),
                ),

              ],
            )
          ),
          RaisedButton(
            onPressed:(){},
            child:Text('START WORKOUT', style: TextStyle(
              fontSize: 20.0,
              color: Color.fromRGBO(245, 245, 245,1),
            ),),
            color: Color.fromRGBO(40, 38, 44,1),

          ),


        ],
      ),


    );

  }
}

