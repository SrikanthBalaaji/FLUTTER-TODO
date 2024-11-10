

import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Event Calendar',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: CalendarPage(),  // Set CalendarPage as the home widget
    );
  }
}

class CalendarPage extends StatefulWidget {
  @override
  _CalendarPageState createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  DateTime focusedDay = DateTime.now();
  DateTime selectedDay = DateTime.now();
  Map<DateTime, List<String>> events = {};

  @override
  Widget build(BuildContext context) {
    DateTime firstDay = DateTime(2000, 1, 1);
    DateTime lastDay = DateTime(2100, 12, 31);

    return Scaffold(
      appBar: AppBar(
        title: Text('Event Calendar'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              String eventName = '';
              return AlertDialog(
                title: Text('Add Event'),
                content: TextField(
                  onChanged: (value) {
                    eventName = value;
                  },
                  decoration: InputDecoration(
                    hintText: 'Enter event name',
                  ),
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('Cancel'),
                  ),
                  TextButton(
                    onPressed: () {
                      if (eventName.isNotEmpty) {
                        setState(() {
                          if (events[selectedDay] == null) {
                            events[selectedDay] = [];
                          }
                          events[selectedDay]!.add(eventName);
                        });
                      }
                      Navigator.pop(context);
                    },
                    child: Text('Add'),
                  ),
                ],
              );
            },
          );
        },
        child: Icon(Icons.add),
      ),
      body: Column(
        children: [
          TableCalendar(
            focusedDay: focusedDay,
            firstDay: firstDay,
            lastDay: lastDay,
            selectedDayPredicate: (day) => isSameDay(selectedDay, day),
            onDaySelected: (selected, focused) {
              setState(() {
                selectedDay = selected;
                focusedDay = focused;
              });
            },
            eventLoader: (day) {
              return events[day] ?? [];
            },
          ),
          ..._getEventsForDay(selectedDay).map(
            (event) => ListTile(
              title: Text(event),
            ),
          ),
        ],
      ),
    );
  }

  List<String> _getEventsForDay(DateTime day) {
    return events[day] ?? [];
  }
}
