import 'package:flutter/material.dart';
import 'dart:async';
import './landingPage.dart';
import 'package:shimmer/shimmer.dart';

class SplashPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  void navigationToNextPage() {
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => LandingPage(
                url:
                    'https://localwire.me/wp-json/wp/v2/posts/?per_page=100')));
  }

  startSplashScreenTimer() async {
    var _duration = new Duration(seconds: 2);
    return new Timer(_duration, navigationToNextPage);
  }

  @override
  void initState() {
    startSplashScreenTimer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 50,
        color: Colors.white,
        child: Column(
          children: <Widget>[
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.04,
            ),
            Image.asset(
              'assets/localwire-logo-1.jpg',
              height: MediaQuery.of(context).size.height * 0.75,
            ),
            Shimmer.fromColors(
              baseColor: Colors.blue,
              highlightColor: Colors.white,
              child: Image.asset(
                'assets/logo-extended.png',
                width: MediaQuery.of(context).size.width * 0.90,
              ),
            )
          ],
        ));
  }
}
