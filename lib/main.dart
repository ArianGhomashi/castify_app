import 'package:castify_app/ui/screens/home_screen.dart';
import 'package:castify_app/ui/screens/live_screen.dart';
import 'package:castify_app/ui/screens/podcast_screen.dart';
import 'package:castify_app/ui/screens/welcome_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WelcomeScreen(),
    );
  }
}
