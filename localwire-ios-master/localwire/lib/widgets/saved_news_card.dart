import 'package:LocalWire/models/post.dart';
import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:share/share.dart';
import '../pages/detailsPage.dart';

class SavedNewsCard extends StatelessWidget {

  final List<Post> posts;
  final int index;
  final String language;

  SavedNewsCard({this.posts, this.index, this.language});

  @override
  Widget build(BuildContext context) {
    final double deviceHeight = MediaQuery.of(context).size.height;
    return Card(
      elevation: 100,
      child: InkWell(
        onTap: () {
          Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) {
                      return DetailsPage(posts, index, language);
                    },
                    fullscreenDialog: true));
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            posts[index].image != null
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
                              posts[index].image,
                            )
                          )
                        ),
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
                            stops: [
                              0.5,
                              3.8
                            ],
                          )
                        ),
                        alignment: Alignment.bottomCenter,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(top: deviceHeight * 0.125, left: 8.0, right: 8.0, bottom: language == 'English' ? 7.5 : 0.0),
                              child: Html(
                              data: posts[index].title,
                              useRichText: true,
                              defaultTextStyle: TextStyle(
                                fontSize: deviceHeight * 0.03,
                                wordSpacing: 3,
                                height: language == 'English' ? 1.0 : 0.80,
                                fontWeight: FontWeight.bold,
                                color: DynamicTheme.of(context).data.textTheme.title.color,
                                fontFamily: language == 'English' ? 'proxima-nova-bold' : 'Lohit'),
                              ),
                            ),
                            
                          ],
                        ),
                      ),
                ],
              )
              : Padding(
                  padding: const EdgeInsets.only(
                    left: 8.0,
                    right: 8.0,
                    top: 15.0
                  ),
                  child: Html(
                    data: posts[index].title,
                    defaultTextStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      wordSpacing: 3,
                      height: language == 'English' ? 1.0 : 0.8,
                      fontSize: deviceHeight * 0.023,
                      fontFamily: language == 'English' ? 'proxima-nova-bold' : 'Lohit',
                      color: DynamicTheme.of(context).data.textTheme.subtitle.color
                    ),
                  ),
                ),
            SizedBox(height: 15.0,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Html(
                blockSpacing: 8.0,
                data: posts[index].excerpt,
                defaultTextStyle: TextStyle(
                    wordSpacing: 3,
                    color: DynamicTheme.of(context).data.textTheme.subtitle.color,
                    height: language == 'English' ? 1.0 : 0.80,
                    fontSize: deviceHeight * 0.0215,
                    fontFamily: language == 'English' ? 'proxima-nova-reg' : 'Lohit'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    posts[index].date,
                    style: TextStyle(
                      color: DynamicTheme.of(context).data.textTheme.subtitle.color
                    ),
                  ),
                  IconButton(
                    icon: Image.asset('assets/share.png', height: deviceHeight * 0.0295, width: deviceHeight * 0.0295),
                    onPressed: () {
                      Share.share("${posts[index].title.trim()}... \n\n Read more at http://localwire.me/?p=${posts[index].id}");
                    },
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}