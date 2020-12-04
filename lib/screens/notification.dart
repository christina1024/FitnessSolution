import 'package:meta/meta.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:fitness_solution/screens/navigate.dart';
import 'package:fitness_solution/screens/timeSelection.dart';

NotificationDetails get _ongoing{
  final androidChannelSpecifics =AndroidNotificationDetails(
    'your channel id',
    'your channel name',
    'your channel description',
    importance: Importance.max,
    priority: Priority.high,
    ongoing: true,
    autoCancel: true,
  );
  final ioschannelSpeicifics = IOSNotificationDetails();
  return NotificationDetails(android: androidChannelSpecifics, iOS: ioschannelSpeicifics);
}

Future showOngoingNotification(
  FlutterLocalNotificationsPlugin notifications,{
    @required String title,
    @required String body,
    int id=0,
  }) => _showNotification(notifications,
    title: title, body: body, id: id, type: _ongoing);

  Future _showNotification(
    FlutterLocalNotificationsPlugin notifications, {
      @required String title,
      @required String body,
      @required NotificationDetails type,
      int id=0,
    }) => notifications.show(id, title, body, type);


class LNotification extends StatefulWidget {
  final String name;
  LNotification(this.name);
  @override
  _NotificationState createState() => _NotificationState();
}

class _NotificationState extends State<LNotification> {
  final notifications = FlutterLocalNotificationsPlugin();
  @override
  void initState() {
    super.initState();

    final AndroidInitializationSettings settingsAndroid =AndroidInitializationSettings ('icon');
    final IOSInitializationSettings settingsIOS = IOSInitializationSettings(
      onDidReceiveLocalNotification: (id, title, body, payload) => onSelectNotification(payload)
    );

    notifications.initialize(
      InitializationSettings(android: settingsAndroid, iOS: settingsIOS),
      onSelectNotification: onSelectNotification
    );
    
  }

  Future onSelectNotification(String payload) async => await Navigator.push(
      context, 
      MaterialPageRoute(builder: (context) =>TimeSelection(widget.name)));

  @override
  Widget build(BuildContext context) {
    return Container(     
      child: BotNavigate(widget.name),
    );
  }
}