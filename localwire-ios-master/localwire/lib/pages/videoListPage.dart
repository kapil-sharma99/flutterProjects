import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class VideoListPage extends StatefulWidget {
  final String onAirUrl, specialUrl;
  VideoListPage({this.onAirUrl, this.specialUrl});

  @override
  _VideoListPageState createState() => _VideoListPageState();
}

class _VideoListPageState extends State<VideoListPage> {
  Future<List> getData(url) async {
    final response = await http.get(url);
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: SafeArea(
        top: false,
        child: Scaffold(
            appBar: AppBar(
              title: TabBar(
                isScrollable: true,
                labelColor: Colors.white,
                unselectedLabelColor: Colors.black26,
                tabs: <Widget>[
                  Tab(
                    child: Text('NEWS IN 30 SECONDS'),
                  ),
                  Tab(
                    child: Text('SPECIAL'),
                  ),
                ],
              ),
            ),
            body: TabBarView(
              children: <Widget>[
                FutureBuilder<List>(
                  future: getData(widget.onAirUrl),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) print(snapshot.error);
                    return snapshot.hasData
                        ? new ListVideos(
                            list: snapshot.data,
                          )
                        : new Center(
                            child: new CircularProgressIndicator(),
                          );
                  },
                ),
                FutureBuilder<List>(
                  future: getData(widget.specialUrl),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) print(snapshot.error);
                    return snapshot.hasData
                        ? new ListVideos(
                            list: snapshot.data,
                          )
                        : new Center(
                            child: new CircularProgressIndicator(),
                          );
                  },
                ),
              ],
            )),
      ),
    );
  }
}

class ListVideos extends StatelessWidget {
  final List list;
  ListVideos({this.list});

  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    try {
      return Container(
        color: Colors.white,
        child: ListView.builder(
          itemCount: list == null ? 0 : list.length,
          itemBuilder: (context, i) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 2.5),
              child: Column(
                children: <Widget>[
                  Card(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    elevation: 100,
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).push(new MaterialPageRoute(
                            builder: (BuildContext context) => new VideoPlay(
                                  url:
                                      "https://youtube.com/embed/${list[i]['contentDetails']['videoId']}",
                                  title: list[i]['snippet']['title'],
                                ),
                            fullscreenDialog: true));
                      },
                      child: Row(
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              SizedBox(
                                width: 130.0,
                                child: Image(
                                  image: new NetworkImage(
                                    list[i]['snippet']['thumbnails']['high']
                                        ['url'],
                                  ),
                                  height: deviceHeight * 0.15,
                                  width: deviceHeight * 0.4,
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            width: 7.5,
                          ),
                          Expanded(
                              child: Column(
                            children: <Widget>[
                              Container(
                                child: Text(
                                  list[i]['snippet']['title'],
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    fontSize: deviceHeight * 0.02,
                                    wordSpacing: 3,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ],
                          )),
                        ],
                      ),
                    ),
                  ),
                  Divider(
                    color: Colors.black,
                  )
                ],
              ),
            );
          },
        ),
      );
    } catch (e) {
      return Center(
        child: Text('Something went wrong, Please try again later'),
      );
    }
  }
}

class VideoPlay extends StatelessWidget {
  final String url, title;

  VideoPlay({this.url, this.title});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: new WebviewScaffold(
      url: url,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          this.title,
          style: TextStyle(color: Colors.blue[700]),
        ),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.blue),
      ),
    ));
  }
}
