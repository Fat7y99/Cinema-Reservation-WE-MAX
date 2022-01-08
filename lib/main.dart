// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:movie_ticket_app/const.dart';
import 'package:movie_ticket_app/screens/LoginScreen.dart';
// import 'package:movie_ticket_app/screens/SignupScreen.dart';
// import 'package:movie_ticket_app/screens/home_screen.dart';
// import 'package:movie_ticket_app/screens/movie_details.dart';
// import 'package:movie_ticket_app/screens/buy_ticket.dart';
// import 'package:movie_ticket_app/screens/LoginScreen.dart';
// import 'package:movie_ticket_app/screens/movie_edit.dart';
// import 'package:movie_ticket_app/screens/reservation_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movie Ticket app ',
      debugShowCheckedModeBanner: false,
      theme: theme,
      home: LoginPage(),
    );
  }
}
