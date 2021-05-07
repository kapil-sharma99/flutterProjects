import 'package:flutter/material.dart';
import './landingPage.dart';

class NotConnectedPage extends StatelessWidget {
  final String url;
  NotConnectedPage(this.url);

  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;
    return Center(
      child: Column(children: <Widget>[
        SizedBox(
          height: deviceHeight * 0.15,
        ),
        Image.asset(
          'assets/not-connected.png',
          height: deviceHeight * 0.4,
          width: deviceWidth * 0.5,
        ),
        Text(
          'You are not connected to internet!!!',
          style: TextStyle(
              color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 20),
        ),
        SizedBox(
          height: deviceHeight * 0.05,
        ),
        RaisedButton(
          child: Text('Refresh'),
          onPressed: () => Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => LandingPage())),
        )
      ]),
    );
  }
}
