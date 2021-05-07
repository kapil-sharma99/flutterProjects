import 'package:flutter/material.dart';
import 'package:quizzer/splash.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Quizzer",
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: SplashScreen(),
    );
  }
}
