
import 'package:appone/screens/logo.dart'; 
import 'package:appone/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:appone/model/todo.dart';
import 'package:appone/widgets/todo_item.dart';
import 'package:appone/constants/color.dart';
import 'package:table_calendar/table_calendar.dart';

// Import LoginScreen from the login_screen.dart file

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '2Do',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color.fromARGB(255, 151, 123, 104),
      ),
      home: StartupAnimationScreen(), // Set LoginScreen as the first screen
    );
  }
}



