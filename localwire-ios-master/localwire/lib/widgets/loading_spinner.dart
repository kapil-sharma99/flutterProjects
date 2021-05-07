import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingSpinner extends StatelessWidget {
  final loadingText;
  const LoadingSpinner(
    this.loadingText, {
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double deviceHeight = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.all(50.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SpinKitRing(
            color: Colors.blue,
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            loadingText,
            style: TextStyle(
                color: Colors.blue,
                fontSize: deviceHeight * 0.034,
                fontFamily: 'Ubuntu'),
          )
        ],
      ),
    );
  }
}
