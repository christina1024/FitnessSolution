import 'package:flutter/foundation.dart';

class Event {
  final String id;
  final String name;
  final String startDate;
  final String endDate;

  Event({
    @required this.id, 
    @required this.name, 
    @required this.startDate, 
    @required this.endDate
  });

  factory Event.fromJson(Map<String, dynamic> json) {
    return Event(
      id: json['id'] as String,
      name: json['summary'] as String,
      startDate: json['start']['dateTime'] as String,
      endDate: json['end']['dateTime'] as String,
    );
  }
}
