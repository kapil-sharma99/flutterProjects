import 'package:LocalWire/pages/homePage.dart';
import 'package:LocalWire/pages/postPage.dart';
import 'package:LocalWire/pages/searchPage.dart';
import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import './menuPage.dart';
import '../pages/videoListPage.dart';

class LandingPage extends StatefulWidget {
  final String url;
  LandingPage({Key key, this.url}) : super(key: key);
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  String language;

  int _selectedIndex = 0;

  onTabTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> children = [
      HomePage(),
      VideoListPage(
          onAirUrl: 'https://localwire-onair.herokuapp.com',
          specialUrl: 'https://localwire-special-videos.herokuapp.com'),
      Explore(),
      MenuPage(language)
    ];

    final double deviceHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          elevation: 250,
          onTap: onTabTapped,
          backgroundColor: DynamicTheme.of(context).data.backgroundColor,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          selectedFontSize: 12,
          unselectedFontSize: 10,
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.grey,
          currentIndex: _selectedIndex,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/home1.png',
                height: 25,
                color: DynamicTheme.of(context).data.iconTheme.color,
              ),
              title: Text('Home'),
            ),
            BottomNavigationBarItem(
                icon: Image.asset('assets/media2.png',
                    height: 25,
                    color: DynamicTheme.of(context).data.iconTheme.color),
                title: Text('Media')),
            BottomNavigationBarItem(
                icon: Image.asset('assets/explore.png',
                    height: 25,
                    color: DynamicTheme.of(context).data.iconTheme.color),
                title: Text('Explore')),
            BottomNavigationBarItem(
                icon: Image.asset('assets/i5.png',
                    height: 25,
                    color: DynamicTheme.of(context).data.iconTheme.color),
                title: Text('Settings'))
          ],
        ),
        body: children[_selectedIndex]);
  }
}
