import 'package:flutter/material.dart';

class CategoryPage extends StatefulWidget {
  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  var list = [
    {
      "title": "Home",
      "followers": "11623",
    },
    {
      "title": "Bhubaneswar",
      "followers": "6973",
    },
    {
      "title": "Special",
      "followers": "3994",
    },
    {
      "title": "Calendar",
      "followers": "3538",
    },
    {
      "title": "Business",
      "followers": "3817",
    },
    {
      "title": "Sports",
      "followers": "3907",
    },
    {
      "title": "Entertainment",
      "followers": "3909",
    },
    {
      "title": "Politics",
      "followers": "3843",
    },
    {
      "title": "Health",
      "followers": "3785",
    },
    {
      "title": "Technology",
      "followers": "3534",
    },
    {
      "title": "Agriculture",
      "followers": "3650",
    },
    {
      "title": "Awards",
      "followers": "3655",
    },
    {
      "title": "Culture",
      "followers": "3848",
    },
    {
      "title": "Education",
      "followers": "3853",
    },
    {
      "title": "Environment",
      "followers": "3719",
    },
    {
      "title": "Events",
      "followers": "3719",
    },
    {
      "title": "Chaisma 4.0",
      "followers": "3918",
    },
    {
      "title": "Engineer's Cup",
      "followers": "69",
    },
    {
      "title": "Interviews",
      "followers": "70",
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.arrow_back,
                  color: Colors.blue,
                ),
              ),
              Text(
                'Reset',
                style: TextStyle(color: Colors.blue),
              )
            ],
          ),
        ),
        body: GridView.builder(
            itemCount: list.length,
            gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3),
            itemBuilder: (BuildContext context, int index) {
              return Container(
                height: 30.0,
                width: 40.0,
                child: SingleTile(
                  title: list[index]['title'],
                  followers: list[index]['followers'],
                ),
              );
            }));
  }
}

class SingleTile extends StatelessWidget {
  final title;
  final followers;
  SingleTile({this.title, this.followers});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: Colors.blue,
        ),
        height: 20.0,
        width: 40.0,
        child: GridTile(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Center(
                child: Text(
                  title,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Center(
                child: Text(
                  followers + ' Followers',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
