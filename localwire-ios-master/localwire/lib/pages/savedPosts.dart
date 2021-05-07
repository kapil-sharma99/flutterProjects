import 'package:LocalWire/models/post.dart';
import 'package:LocalWire/widgets/saved_news_card.dart';
import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as p;

class SavedPosts extends StatefulWidget {
  @override
  _SavedPostsState createState() => _SavedPostsState();
}

class _SavedPostsState extends State<SavedPosts> {

  List<Post> savedPosts;
  bool isLoaded = false;

  Future<List<Post>> posts() async {

    final Future<Database> database = openDatabase(
      p.join(await getDatabasesPath(), 'localwire.db'),
      onCreate: (db, version) {
        return db.execute(
          "CREATE TABLE posts(id INTEGER PRIMARY KEY, title TEXT, excerpt TEXT, content TEXT, date TEXT, author TEXT, views TEXT, shares TEXT, likes TEXT, image TEXT)",
        );
      },
      version: 1
    );

    final Database db = await database;
    final List<Map<String, dynamic>> maps = await db.query('posts');

    return List.generate(maps.length, (i) {
      return Post(
        id: maps[i]['id'],
        title: maps[i]['title'],
        excerpt: maps[i]['excerpt'],
        image: maps[i]['image'],
        date: maps[i]['date'],
        author: maps[i]['author']
      );
    });
  }

  setSavedPosts() async {
    savedPosts = await posts();
    setState(() {
      isLoaded = true;
    });
  }

  @override
  void initState() {
    savedPosts = List();
    setSavedPosts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DynamicTheme.of(context).data.backgroundColor,
      appBar: AppBar(
        backgroundColor: DynamicTheme.of(context).data.backgroundColor,
        centerTitle: true,
        iconTheme: IconThemeData(
          color: DynamicTheme.of(context).data.textTheme.subtitle.color
        ),
        title: Text(
          'Saved Stories',
          style: TextStyle(
            color: DynamicTheme.of(context).data.textTheme.subtitle.color
          ),
        ),
      ),
      body: isLoaded
        ? ListView.builder(
        itemCount: savedPosts.length,
        itemBuilder: (BuildContext context, int index) {
          return SavedNewsCard(
            posts: savedPosts,
            index: index,
            language: 'English',
          );
        },
      ) : Center(
        child: CircularProgressIndicator(),
      )
    );
  }
}