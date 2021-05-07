import 'package:LocalWire/pages/specificCategoryPage.dart';
import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:io';
import 'category_page.dart';

class HomePage extends StatefulWidget {
  String url;
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  List<String> languages = ['English', 'ଓଡ଼ିଆ'];
  Map loadingText = {
    'English': 'Fetching fresh news',
    'ଓଡ଼ିଆ': 'ତାଜା ଖବର',
  };

  HomePageState();

  String language;
  String urlEnglish;
  String urlOdia;
  bool isConnected = true;
  bool isLoadingNext = false;
  bool isLoading = false, isLoadingSuccessful = false;
  List list = List();
  ScrollController listScrollController;
  bool isChanged = false;

  @override
  void initState() {
    getDefaults();
    urlEnglish =
        "http://localwire.me/wp-json/wl/v1/posts/?per_page=20&categories=5";
    urlOdia =
        'http://localwire.me/wp-json/wl/v1/posts/?per_page=20&categories=4';

    super.initState();
  }

  void getDefaults() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      language = sharedPreferences.getString('language') ?? 'ଓଡ଼ିଆ';
    });
    isInternetConnected();
  }

  // Future<void> _fetchPage(int pageno) async {
  //   setState(() {
  //     isLoadingNext = true;
  //   });
  //   isInternetConnected();
  //   final response = await http.get(url + "&page=" + pageno.toString());
  //   if (response.statusCode == 200) {
  //     setState(() {
  //       isLoadingNext = false;
  //       list += (json.decode(response.body) as List).map((data) {
  //         return Post.fromJSON(data);
  //       }).toList();
  //     });
  //   }
  // }

  void isInternetConnected() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        setState(() {
          isConnected = true;
        });
      }
    } on SocketException catch (_) {
      setState(() {
        isConnected = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        backgroundColor: DynamicTheme.of(context).data.backgroundColor,
        appBar: AppBar(
//              backgroundColor: DynamicTheme.of(context).data.backgroundColor,
          backgroundColor: Colors.white,
          elevation: 1,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Image.asset(
                'assets/localwire-logo-1.jpg',
                height: 50.0,
                fit: BoxFit.cover,
              ),
              Image.asset(
                'assets/logo-extended.png',
                height: 100.0,
                width: 100.0,
              ),
            ],
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.dashboard,
                color: Colors.grey,
              ),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return CategoryPage();
                }));
              },
            ),
            IconButton(
              icon: Icon(Icons.search),
            ),
            IconButton(
              icon: Icon(Icons.brightness_4),
            ),
            IconButton(icon: Icon(Icons.notifications)),
          ],
        ),
        body: SpecificCategoryPage(
          true,
          this,
          language,
          name: 'home',
        ),
      ),
    );
  }
}
