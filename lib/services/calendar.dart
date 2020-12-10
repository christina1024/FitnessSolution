import 'package:fitness_solution/models/event.dart';
import 'package:fitness_solution/models/time.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:fitness_solution/screens/notification.dart';
import 'package:path_provider/path_provider.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'dart:async';
import 'dart:io';


Future<String> _read() async {
  String text;
  try {
    final Directory directory = await getApplicationDocumentsDirectory();
    final File file = File('${directory.path}/email.txt');
    text = await file.readAsString();
  } catch (e) {
    print("Couldn't read file");
  }
  return text;
}

Future sleep(var sec) {
  final notifications = FlutterLocalNotificationsPlugin();
  return new Future.delayed(Duration(seconds: sec), () => {
    showOngoingNotification(notifications, title: 'Time Fix', body: 'It is time for workout')
  });
}

class HttpService  {

  void getData() async {
    String email = await _read();  
    final String eventsUrl = "https://www.googleapis.com/calendar/v3/calendars/"+email+"/events?key=AIzaSyDeAyDNi2Cj-c1Xph2DSf3kM-MiGJjhb2c";

    Response res = await get(eventsUrl);
    List<dynamic> body = jsonDecode(res.body)['items'];
    List<Event> events = body.map((dynamic item) => Event.fromJson(item)).toList();

    // Only get the events that are today
    String dateToday = DateTime.now().toUtc().toString().substring(0,10);
    List<Event> eventsToday;
    eventsToday = events.where((e) => e.startDate.startsWith(dateToday)).toList();

    // Get available times that are today
    List<Timed> availableTimesToday = [];

    var now = new DateTime.now().toUtc();
    var formatter = new DateFormat('yyyy-MM-dd');
    String formattedDate = formatter.format(now);
    
    if(eventsToday.length == 0) {
      DateTime sd = new DateTime.now().toUtc();
      DateTime ed = DateTime.parse(formattedDate + "T23:59:59-07:00");

      Timed t = Timed();
      t.startTime = sd;
      t.endTime = ed;
      availableTimesToday.add(t);
    } else {
      String start = formattedDate + "T23:59:00-07:00";
      String end = formattedDate + "T23:59:59-07:00";
      Event e = Event(id:'e1',name:'e1',startDate:start,endDate:end);
      eventsToday.add(e);
      for(var i = 0; i < eventsToday.length; i++) {
        if(i == eventsToday.length-1) {
          break;
        }
        var sd = DateTime.parse(eventsToday[i].endDate);
        var ed = DateTime.parse(eventsToday[i+1].startDate);   
        var diff = ed.difference(sd);
        // If there is a gap of at least 2 minutes 
        if(sd.isBefore(ed) && diff.inMinutes >= 2) { 
          Timed t = Timed();
          t.startTime = sd;
          t.endTime = ed;
          availableTimesToday.add(t);
        }
      }
    }

    var sec = 15; // Currently hard-coded to 15 seconds in advance of a free time

    if(availableTimesToday.length == 0) {
      print('No available times today!');
    } else {
      if(DateTime.now().toUtc().isBefore(availableTimesToday[0].startTime)) {
        var now = new DateTime.now().toUtc();
        var newTime = now.add(new Duration(seconds: sec));
        availableTimesToday[0].startTime = newTime;
      } else {
        var newTime = availableTimesToday[0].startTime.add(new Duration(seconds: sec));
        availableTimesToday[0].startTime = newTime;
      }
      // Duration difference = availableTimesToday[0].startTime.difference(DateTime.now().toUtc());
      Duration difference = DateTime.now().toUtc().difference(availableTimesToday[0].startTime);
      // print(availableTimesToday[0].startTime.isAfter(DateTime.now().toUtc()));
      
      String dif;
      String m;
      if(difference.inSeconds >= 60) {
        dif = difference.inMinutes.toString();
        
        m = ' minute(s)';
      } else {
        if(difference.inSeconds < 0) {
          dif = sec.toString();
        } else {
          dif = difference.inSeconds.toString();
        }
        
        m = ' seconds';
      }
      sec = difference.inSeconds;
      
      print('Notification will be sent in ~' + dif + m + " at date/time of " + availableTimesToday[0].startTime.toLocal().toString());
      sleep(sec);
    }
    
  }

}