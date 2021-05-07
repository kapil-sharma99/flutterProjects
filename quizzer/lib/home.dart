import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quizzer/quizpage.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> images = [
    "images/java.png",
    "images/js.png",
    "images/py.png",
    "images/cpp.png",
    "images/linux.png",
  ];
  Widget customcard(String langName, String image) {
    return Padding(
      padding: EdgeInsets.all(20.0),
      child: InkWell(
        onTap: () {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => getjson(),
            ),
          );
        },
        child: Material(
          color: Colors.indigoAccent,
          elevation: 20.0,
          borderRadius: BorderRadius.circular(20.0),
          child: Container(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.0),
                  child: Material(
                    elevation: 5.0,
                    borderRadius: BorderRadius.circular(100.0),
                    child: Container(
                      height: 200.0,
                      width: 200.0,
                      child: ClipOval(
                        child: Image(
                          fit: BoxFit.contain,
                          image: AssetImage(
                            image,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    langName,
                    style: GoogleFonts.alike(
                      fontSize: 24.0,
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(20.0),
                  child: Text(
                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.",
                    style: GoogleFonts.alike(
                      fontSize: 18.0,
                      color: Colors.white,
                    ),
                    maxLines: 5,
                    textAlign: TextAlign.justify,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Quizzer',
            style: GoogleFonts.raleway(fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: ListView(
        children: <Widget>[
          customcard('Java', images[0]),
          customcard('Javascript', images[1]),
          customcard('Python', images[2]),
          customcard('C++', images[3]),
          customcard('Linux', images[4]),
        ],
      ),
    );
  }
}
