import 'package:flutter/material.dart';
import 'package:kach/splash_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kach',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
      debugShowCheckedModeBanner: false,
      home: SplashScreen (),
    );
  }
}