import 'dart:async';
import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:flutter/material.dart';
import '../models/post.dart';
import '../pages/detailsPage.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:share/share.dart';
import 'package:http/http.dart' as http;
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as p;

class NewsCard extends StatefulWidget {
  final List<Post> posts;
  final int index;
  final String language;

  NewsCard(
      {Key key,
      @required this.posts,
      @required this.index,
      @required this.language})
      : super(key: key);

  @override
  _NewsCardState createState() => _NewsCardState();
}

class _NewsCardState extends State<NewsCard> {
  bool isViewSuccessfullyPosted,
      isShareSuccessfullyPosted,
      isLikeSuccessfullyPosted;
  bool isLiked = false;

  @override
  void initState() {
    super.initState();
  }

  _increaseViews(int index) async {
    try {
      final response = await http.post(
          'https://localwire.me/wp-json/base/views/increaseviews/${widget.posts[index].id}');
      if (response.statusCode == 200) {
        setState(() {
          isViewSuccessfullyPosted = true;
        });
        print(isViewSuccessfullyPosted);
      }
    } catch (e) {
      if (e is TimeoutException) {}
    }
  }

  _increaseShares(int index) async {
    try {
      final response = await http.post(
          'https://localwire.me/wp-json/base/shares/increaseshares/${widget.posts[index].id}');
      if (response.statusCode == 200) {
        setState(() {
          isShareSuccessfullyPosted = true;
        });
        print(isShareSuccessfullyPosted);
      }
    } catch (e) {
      if (e is TimeoutException) {}
    }
  }

  _increaseLike(int index) async {
    try {
      final response = await http.post(
          'https://localwire.me/wp-json/base/likes/increaselike/${widget.posts[index].id}');
      if (response.statusCode == 200) {
        setState(() {
          isLikeSuccessfullyPosted = true;
        });
        print(isLikeSuccessfullyPosted);
      }
    } catch (e) {
      if (e is TimeoutException) {}
    }
  }

  _postPostLikes() async {
    var databasesPath = await getDatabasesPath();
    String path = p.join(databasesPath, 'localwire.db');
    Database database =
        await openDatabase(path, onCreate: (Database db, int version) async {
      await db.execute('CREATE TABLE PostLikes (id INTEGER PRIMARY KEY, )');
    });
  }

  _getPostLikes() async {}

  Future _savePost(Post post) async {
    final Future<Database> database =
        openDatabase(p.join(await getDatabasesPath(), 'localwire.db'),
            onCreate: (db, version) {
      return db.execute(
        "CREATE TABLE posts(id INTEGER PRIMARY KEY, title TEXT, excerpt TEXT, content TEXT, date TEXT, author TEXT, views TEXT, shares TEXT, likes TEXT, image TEXT)",
      );
    }, version: 1);

    final Database db = await database;
    return db.insert('posts', Post.toMap(post),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  @override
  Widget build(BuildContext context) {
    final double deviceHeight = MediaQuery.of(context).size.height;
    return Card(
        elevation: 100,
        child: InkWell(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(
              builder: (BuildContext context) {
                _increaseViews(widget.index);
                return DetailsPage(widget.posts, widget.index, widget.language);
              },
            ));
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              widget.posts[widget.index].image != null
                  ? Stack(
                      children: <Widget>[
                        Container(
                          height: deviceHeight * 0.3,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: Colors.transparent,
                              image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: NetworkImage(
                                    widget.posts[widget.index].image,
                                  ))),
                        ),
                        Container(
                          height: deviceHeight * 0.3,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              gradient: LinearGradient(
                                begin: FractionalOffset.bottomCenter,
                                end: FractionalOffset.center,
                                colors: [
                                  Colors.black.withOpacity(0.55),
                                  Colors.black.withOpacity(0.15),
                                ],
                                stops: [0.5, 3.8],
                              )),
                          alignment: Alignment.bottomCenter,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.only(
                                    top: deviceHeight * 0.125,
                                    left: 8.0,
                                    right: 8.0,
                                    bottom: widget.language == 'English'
                                        ? 7.5
                                        : 0.0),
                                child: Html(
                                  data: widget.posts[widget.index].title,
                                  useRichText: true,
                                  defaultTextStyle: TextStyle(
                                      fontSize: deviceHeight * 0.03,
                                      wordSpacing: 3,
                                      height: widget.language == 'English'
                                          ? 1.0
                                          : 0.80,
                                      fontWeight: FontWeight.bold,
                                      color: // DynamicTheme.of(context).data.textTheme.title.color
                                          Colors.white,
                                      fontFamily: widget.language == 'English'
                                          ? 'proxima-nova-bold'
                                          : 'Lohit'),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                  : Padding(
                      padding: const EdgeInsets.only(
                          left: 8.0, right: 8.0, top: 15.0),
                      child: Html(
                        data: widget.posts[widget.index].title,
                        defaultTextStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            wordSpacing: 3,
                            height: widget.language == 'English' ? 1.0 : 0.8,
                            fontSize: deviceHeight * 0.023,
                            fontFamily: widget.language == 'English'
                                ? 'proxima-nova-bold'
                                : 'Lohit',
                            color: Colors.black),
                      ),
                    ),
              SizedBox(
                height: 2.0,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      widget.posts[widget.index].date,
                      style: TextStyle(
                          fontSize: deviceHeight * 0.017,
                          color: DynamicTheme.of(context)
                              .data
                              .textTheme
                              .subtitle
                              .color,
                          fontFamily: widget.language == 'English'
                              ? 'proxima-nova-reg'
                              : 'Lohit'),
                    ),
                    Text(
                      '${widget.posts[widget.index].views != null ? widget.posts[widget.index].views : 0} views',
                      style: TextStyle(
                          fontSize: deviceHeight * 0.017,
                          color: DynamicTheme.of(context)
                              .data
                              .textTheme
                              .subtitle
                              .color,
                          fontFamily: widget.language == 'English'
                              ? 'proxima-nova-reg'
                              : 'Lohit'),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 5.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Html(
                  blockSpacing: 8.0,
                  data: widget.posts[widget.index].excerpt,
                  defaultTextStyle: TextStyle(
                      wordSpacing: 3,
                      color: DynamicTheme.of(context)
                          .data
                          .textTheme
                          .subtitle
                          .color,
                      height: widget.language == 'English' ? 1.0 : 0.80,
                      fontSize: deviceHeight * 0.0215,
                      fontFamily: widget.language == 'English'
                          ? 'proxima-nova-reg'
                          : 'Lohit'),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Row(children: <Widget>[
                    IconButton(
                      icon: isLiked
                          ? Icon(
                              Icons.thumb_up,
                              color: Colors.blue,
                            )
                          : Icon(
                              Icons.thumb_up,
                              color: Colors.grey,
                            ),
                      onPressed: () {
                        _increaseLike(widget.index);
                        setState(() {
                          isLiked = !isLiked;
                        });
                      },
                    ),
                    Text(
                      '${widget.posts[widget.index].likes != null ? widget.posts[widget.index].likes : 0}',
                    ),
                    IconButton(
                      icon: Image.asset('assets/share.png',
                          height: deviceHeight * 0.0295,
                          width: deviceHeight * 0.0295),
                      onPressed: () {
                        _increaseShares(widget.index);
                        Share.share(
                            "${widget.posts[widget.index].title.trim()}... \n\n Read more at http://localwire.me/?p=${widget.posts[widget.index].id}");
                      },
                    ),
                    Text(
                      '${widget.posts[widget.index].shares != null ? widget.posts[widget.index].shares : 0} Shares',
                      style: TextStyle(
                          fontSize: deviceHeight * 0.017,
                          color: DynamicTheme.of(context)
                              .data
                              .textTheme
                              .subtitle
                              .color,
                          fontFamily: widget.language == 'English'
                              ? 'proxima-nova-reg'
                              : 'Lohit'),
                    ),
                  ]),
                  Row(
                    children: <Widget>[
                      IconButton(
                        icon: Image.asset(
                          'assets/bm.png',
                          height: deviceHeight * 0.0295,
                          width: deviceHeight * 0.0295,
                        ),
                        onPressed: () {
                          _savePost(widget.posts[widget.index]).then((value) {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return SimpleDialog(
                                  elevation: 10,
                                  children: <Widget>[
                                    Center(
                                      child: Column(
                                        children: <Widget>[
                                          Text('Post Saved Successfully'),
                                          RaisedButton(
                                            elevation: 0,
                                            child: Text(
                                              'OK',
                                              style:
                                                  TextStyle(color: Colors.blue),
                                            ),
                                            color: DynamicTheme.of(context)
                                                .data
                                                .backgroundColor,
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                  backgroundColor: DynamicTheme.of(context)
                                      .data
                                      .backgroundColor,
                                  title: Center(
                                    child: Text(
                                      'Post Saved',
                                      style: TextStyle(
                                          color: DynamicTheme.of(context)
                                              .data
                                              .textTheme
                                              .subtitle
                                              .color),
                                    ),
                                  ),
                                );
                              },
                            );
                          });
                        },
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 10,
              )
            ],
          ),
        ));
  }
}
