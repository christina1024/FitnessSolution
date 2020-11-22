import 'package:fitness_solution/models/event.dart';
import 'package:fitness_solution/models/time.dart';
import 'package:http/http.dart';
import 'dart:convert';

// class Loading extends StatefulWidget {
//   @override
//   HttpService createState() => HttpService();
// }

class HttpService  {
  final String eventsUrl = "API_KEY_GOES_HERE";

  void getData() async {
    Response res = await get(eventsUrl);
    List<dynamic> body = jsonDecode(res.body)['items'];
    List<Event> events = body.map((dynamic item) => Event.fromJson(item)).toList();

    // Only get the events that are today
    String dateToday = DateTime.now().toString().substring(0,10);
    List<Event> eventsToday;
    eventsToday = events.where((e) => e.startDate.startsWith(dateToday)).toList();

    // Get available times that are today
    List<Time> availableTimesToday = [];
  
    for(var i = 0; i < eventsToday.length; i++) {
      if(i == eventsToday.length-1) {
        break;
      }
      
      var sd = DateTime.parse(eventsToday[i].endDate);
      var ed = DateTime.parse(eventsToday[i+1].startDate);   
      var diff = ed.difference(sd);
      
      // If there is a gap of at least 2 minutes 
      if(sd.isBefore(ed) && diff.inMinutes >= 2) { 
        Time t = Time();
        t.startTime = sd;
        t.endTime = ed;
        availableTimesToday.add(t);
      }
    }
    
  }

  // Future<List<Event>> getEvents() async {
  //   Response res = await get(eventsUrl);
  //   if(res.statusCode == 200) {
  //     List<dynamic> body = jsonDecode(res.body);
  //     List<Event> events = body.map((dynamic item) => Event.fromJson(item)).toList();
  //     print(events);
  //     return events;
  //   } else {
  //     throw "Can't get events.";
  //   }
  // }
}