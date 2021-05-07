import 'package:flutter/material.dart';
import 'package:dynamic_theme/dynamic_theme.dart';

class Explore extends StatefulWidget {
  @override
  _ExploreState createState() => _ExploreState();
}

class _ExploreState extends State<Explore> {
  var list = [
    {
      "name": "Calendar",
      "image": "assets/cal.png",
    },
    {
      "name": "Horoscope",
      "image": "assets/horo.png",
    },
    {
      "name": "Tithi Panji",
      "image": "assets/kalash.png",
    },
    {
      "name": "Classified",
      "image": "assets/cal.png",
    },
    {
      "name": "Job",
      "image": "assets/job.png",
    },
    {
      "name": "Event",
      "image": "assets/event.png",
    },
    {
      "name": "Ask a question",
      "image": "assets/ask.png",
    },
    {
      "name": "Quiz",
      "image": "assets/quiz.png",
    },
    {
      "name": "Trending tweets",
      "image": "assets/tweet.png",
    },
  ];
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: list.length,
      gridDelegate:
          new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
      itemBuilder: (BuildContext context, int index) {
        return SingleTile(
          name: list[index]['name'],
          image: list[index]['image'],
        );
      },
    );
  }
}

class SingleTile extends StatelessWidget {
  final name;
  final image;
  SingleTile({this.name, this.image});
  @override
  Widget build(BuildContext context) {
    return Card(
      child: GridTile(
        footer: Container(
          decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.zero,
                  topRight: Radius.zero,
                  bottomLeft: Radius.circular(10.0),
                  bottomRight: Radius.circular(10.0))),
          height: 30.0,
          child: Center(child: Text(name)),
        ),
        child: Padding(
          padding: const EdgeInsets.only(bottom: 20.0),
          child: Image.asset(
            image,
          ),
        ),
      ),
    );
  }
}
