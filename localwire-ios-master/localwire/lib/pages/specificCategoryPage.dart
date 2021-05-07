import 'package:LocalWire/pages/homePage.dart';
import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../models/post.dart';
import 'dart:async';
import 'dart:convert';
import '../widgets/loading_spinner.dart';
import '../widgets/news_card.dart';
import 'package:http_middleware/http_middleware.dart';

class SpecificCategoryPage extends StatefulWidget {
  String name = '', language;
  bool isHome;
  HomePageState parent;

  SpecificCategoryPage(this.isHome, this.parent, this.language,
      {Key key, @required this.name})
      : super(key: key);
  _SpecificCategoryPageState createState() => _SpecificCategoryPageState();
}

class _SpecificCategoryPageState extends State<SpecificCategoryPage>
    with AutomaticKeepAliveClientMixin<SpecificCategoryPage> {
  bool isLoading = false, isLoadingNext = false;
  bool isEnded = false;

  @override
  bool get wantKeepAlive => false;

  List<Post> list = List();
  ScrollController listScrollController;

  int lastPage;

  @override
  void dispose() {
    listScrollController.dispose();
    super.dispose();
  }

  List<String> languages = ['English', 'ଓଡ଼ିଆ'];
  Map<String, String> loadingText = {
    'English': 'Fetching Fresh News',
    'ଓଡ଼ିଆ': 'ତାଜା ଖବର'
  };

  String engUrl, odiaUrl, url, language;

  var allTagsUrl = {
    'home': {
      'english':
          'http://localwire.me/wp-json/wl/v1/posts/?per_page=20&categories=5',
      'odia':
          'http://localwire.me/wp-json/wl/v1/posts/?per_page=20&categories=4'
    },
    'bhubaneswar': {
      'english':
          'http://localwire.me/wp-json/wl/v1/posts/?per_page=20&categories=5&tags=58',
      'odia':
          'http://localwire.me/wp-json/wl/v1/posts/?per_page=20&categories=4&tags=58'
    },
    'special': {
      'english':
          'http://localwire.me/wp-json/wl/v1/posts/?per_page=20&categories=5&tags=17950',
      'odia':
          'http://localwire.me/wp-json/wl/v1/posts/?per_page=20&categories=4&tags=17950'
    },
    'entertainment': {
      'english':
          'http://localwire.me/wp-json/wl/v1/posts/?per_page=20&categories=5&tags=32017',
      'odia':
          'http://localwire.me/wp-json/wl/v1/posts/?per_page=20&categories=4&tags=32017'
    },
    'business': {
      'english':
          'http://localwire.me/wp-json/wl/v1/posts/?per_page=20&categories=5&tags=4254',
      'odia':
          'http://localwire.me/wp-json/wl/v1/posts/?per_page=20&categories=4&tags=4254'
    },
    'politics': {
      'english':
          'http://localwire.me/wp-json/wl/v1/posts/?per_page=20&categories=5&tags=16',
      'odia':
          'http://localwire.me/wp-json/wl/v1/posts/?per_page=20&categories=4&tags=16'
    },
    'sports': {
      'english':
          'http://localwire.me/wp-json/wl/v1/posts/?per_page=20&categories=5&tags=14285',
      'odia':
          'http://localwire.me/wp-json/wl/v1/posts/?per_page=20&categories=4&tags=14285'
    },
    'health': {
      'english':
          'http://localwire.me/wp-json/wl/v1/posts/?per_page=20&categories=5&tags=15331',
      'odia':
          'http://localwire.me/wp-json/wl/v1/posts/?per_page=20&categories=4&tags=15331'
    },
    'education': {
      'english':
          'http://localwire.me/wp-json/wl/v1/posts/?per_page=20&categories=5&tags=63',
      'odia':
          'http://localwire.me/wp-json/wl/v1/posts/?per_page=20&categories=4&tags=63'
    }
  };

  @override
  void initState() {
    engUrl = this.allTagsUrl[widget.name]['english'];
    odiaUrl = this.allTagsUrl[widget.name]['odia'];
    _getDefaults();
    lastPage = 1;
    listScrollController = ScrollController();
    listScrollController.addListener(listScrollListener);

    super.initState();
  }

  void _getDefaults() async {
    if (widget.language == 'English') {
      this.url = engUrl;
    } else {
      this.url = odiaUrl;
    }
    _fetchInitialData();
  }

  Future<void> _fetchInitialData() async {
    HttpWithMiddleware httpMiddleware =
        HttpWithMiddleware.build(requestTimeout: Duration(seconds: 100));
    setState(() {
      isLoading = true;
    });

    try {
      final response = await http.get(this.url);
      if (response.statusCode == 200) {
        list = (json.decode(response.body) as List).map((data) {
          return Post.fromJSON(data);
        }).toList();
        setState(() {
          isLoading = false;
        });
      }
    } catch (e) {
      if (e is NoSuchMethodError) {
        setState(() {
          isEnded = true;
        });
      }
    }
  }

  Future<void> _fetchData() async {
    HttpWithMiddleware httpMiddleware =
        HttpWithMiddleware.build(requestTimeout: Duration(seconds: 100));
    setState(() {
      isLoading = true;
    });

    if (widget.parent.language == 'English') {
      url = engUrl;
    } else {
      url = odiaUrl;
    }
    try {
      final response = await http.get(this.url);
      if (response.statusCode == 200) {
        list = (json.decode(response.body) as List).map((data) {
          return Post.fromJSON(data);
        }).toList();
        setState(() {
          isLoading = false;
        });
      }
    } catch (e) {
      if (e is NoSuchMethodError) {
        setState(() {
          isEnded = true;
        });
      }
    }
  }

  Future<void> _refreshData() async {
    final response = await http.get(url);
    if (response.statusCode == 400) {
      setState(() {
        isLoadingNext = false;
      });
    }
    if (response.statusCode == 200) {
      setState(() {
        list = (json.decode(response.body) as List).map((data) {
          return Post.fromJSON(data);
        }).toList();
      });
    }
  }

  listScrollListener() {
    if (listScrollController.offset >=
            listScrollController.position.maxScrollExtent &&
        !listScrollController.position.outOfRange) {
      setState(() {
        lastPage += 1;
      });
      _fetchPage(lastPage);
    }
  }

  Future<void> _fetchPage(int pageno) async {
    setState(() {
      isLoadingNext = true;
    });

    try {
      final response = await http.get(url + "&page=" + pageno.toString());
      if (response.statusCode == 200) {
        setState(() {
          isLoadingNext = false;
          list += (json.decode(response.body) as List).map((data) {
            return Post.fromJSON(data);
          }).toList();
        });
      }
    } catch (e) {
      if (e is NoSuchMethodError) {
        setState(() {
          isLoading = false;
          isLoadingNext = false;
          this.isEnded = true;
        });
      }
    }
  }

  Widget _buildRefreshIndicator() {
    return RefreshIndicator(
      child: isLoading
          ? LoadingSpinner(widget.parent.language == 'English'
              ? loadingText['English']
              : loadingText['ଓଡ଼ିଆ'])
          : ListView(
              children: <Widget>[
                Container(
                  height: 20.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 2.0),
                        child: Row(
                          children: <Widget>[
                            Text(
                              'Fri 12 June 2020  |  Namaskar Cuttack!',
                              style: TextStyle(fontSize: 11.0),
                            )
                          ],
                        ),
                      ),
                      Row(
                        children: <Widget>[
                          Text('31^C'),
                          Image.asset(
                            'assets/weather.jpg',
                            height: 18.0,
                            width: 18.0,
                          ),
                          Image.asset(
                            'assets/arrow.png',
                            height: 18.0,
                            width: 18.0,
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                ListView.builder(
                  controller: listScrollController,
                  itemCount: list.length + 1,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    return (index == list.length)
                        ? isEnded
                            ? SizedBox(
                                height: 0,
                              )
                            : CircularProgressIndicator()
                        : NewsCard(
                            posts: list,
                            index: index,
                            language: widget.parent.language,
                          );
                  },
                ),
              ],
            ),
      onRefresh: _refreshData,
    );
  }

  Widget _buildFloatingButton() {
    final double deviceHeight = MediaQuery.of(context).size.height;
    return FloatingActionButton(
      elevation: 200,
      backgroundColor: Color(0xffb4e3ea),
      child: Container(
        child: widget.parent.language == 'English'
            ? Text(
                'ଓଡ଼ିଆ',
                style: TextStyle(
                    fontSize: deviceHeight * 0.015, color: Color(0xff0033ff)),
              )
            : Text('English',
                style: TextStyle(
                    fontSize: deviceHeight * 0.015,
                    fontFamily: 'Ubuntu',
                    color: Color(0xff0033ff))),
      ),
      onPressed: () {
        setState(() {
          isLoading = false;
          if (widget.parent.language == 'English') {
            widget.parent.setState(() {
              widget.parent.language = 'Odia';
            });
          } else {
            widget.parent.setState(() {
              widget.parent.language = 'English';
            });
          }
          _fetchData();
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton:
            widget.isHome ? _buildFloatingButton() : SizedBox(),
        body: _buildRefreshIndicator());
  }
}
