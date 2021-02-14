import 'package:flutter/material.dart';
import 'package:medico/screens/welcome_screen.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.deepPurpleAccent,
      ),
      debugShowCheckedModeBanner: false,
      home: WelcomeScreen(),
    ),
  );
}
