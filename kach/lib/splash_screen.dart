import 'package:flutter/material.dart';
import 'dart:async';
import 'package:google_fonts/google_fonts.dart';

import 'package:shimmer/shimmer.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF2D94F),
      body: Container(
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Center(
              child: Shimmer.fromColors(
                baseColor: Colors.black, 
                highlightColor: Colors.white,
                child: Container(
                  child: Text(
                    "KACH",
                    style: GoogleFonts.fredokaOne(
                      fontSize: 90.0,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                    ),
                  ),
                ),
            )
          ],
        ),
      ),
    );
  }
}