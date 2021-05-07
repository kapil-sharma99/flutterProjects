import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:flutter/material.dart';
import '../models/post.dart';
import 'package:share/share.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailsPage extends StatelessWidget {
  final List posts;
  final String language;
  DetailsPage(this.posts, this.index, this.language);
  final int index;

  Widget _buildShareButton() {
    return Row(
      children: <Widget>[
        IconButton(
          icon: Icon(Icons.bookmark),
          onPressed: () {
            Share.share(
              "${posts[index].title} \n ${posts[index].excerpt} \n\n http://localwire.me/?p=${posts[index].id}",
            );
          },
        ),
        IconButton(
          icon: Icon(Icons.share),
          onPressed: () {
            Share.share(
              "${posts[index].title} \n ${posts[index].excerpt} \n\n http://localwire.me/?p=${posts[index].id}",
            );
          },
        ),
      ],
    );
  }

  Widget _buildPostImage(int index) {
    if (posts[index].image != null) {
      return Image.network(posts[index].image);
    } else {
      return SizedBox();
    }
  }

  @override
  Widget build(BuildContext context) {
    final double deviceHeight = MediaQuery.of(context).size.height;

    return PageView.builder(
      controller: PageController(
        initialPage: this.index,
      ),
      itemCount: posts.length,
      itemBuilder: (context, position) {
        return Stack(
          children: <Widget>[
            Container(
                child: Scaffold(
              backgroundColor: DynamicTheme.of(context).data.backgroundColor,
              appBar: AppBar(
                backgroundColor: DynamicTheme.of(context).data.backgroundColor,
                elevation: 1,
                iconTheme: IconThemeData(color: Colors.blue),
                actions: <Widget>[
                  _buildShareButton(),
                  SizedBox(
                    width: 5,
                  ),
                  SizedBox(
                    width: 10,
                  )
                ],
              ),
              body: CustomScrollView(
                slivers: <Widget>[
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  posts[position]
                                      .title
                                      .replaceAll('&#8217;', '\''),
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      wordSpacing: 4,
                                      fontSize: deviceHeight * 0.03,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: language == 'English'
                                          ? 'proxima-nova-bold'
                                          : 'Lohit'),
                                ),
                              ),
                              SizedBox(
                                height: 14.5,
                              ),
                              _buildPostImage(position),
                              SizedBox(
                                height: 16.0,
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 8.0),
                                child: Row(
                                  children: <Widget>[
                                    Text(
                                      posts[position].date.toString(),
                                      style: TextStyle(
                                          color: Colors.lightBlue,
                                          fontSize: deviceHeight * 0.014,
                                          wordSpacing: 4),
                                    ),
                                    SizedBox(
                                      width: 10.0,
                                    ),
                                    Text(
                                      '| By ' +
                                          posts[position].author.toString(),
                                      style: TextStyle(
                                          color: Colors.lightBlue,
                                          fontSize: deviceHeight * 0.018),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 2,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Html(
                                  onLinkTap: (String link) {
                                    _launchUrlForBrowser(link);
                                  },
                                  data: """${posts[position].content}""",
                                  defaultTextStyle: TextStyle(
                                      fontSize: deviceHeight * 0.020,
                                      fontFamily: language == 'English'
                                          ? 'proxima-nova-reg'
                                          : 'Lohit',
                                      wordSpacing: 4),
                                ),
                              ),
                              Row(
                                children: <Widget>[
                                  IconButton(
                                    icon: Icon(Icons.thumb_up),
                                  ),
                                  Text('20 Likes  |  '),
                                  Text('120 Views  |  '),
                                  Text('15 Shares  |  '),
                                ],
                              )
                            ],
                          ),
                        );
                      },
                      childCount: 1,
                    ),
                  ),
                ],
              ),
            )),
          ],
        );
      },
    );
  }
}

_launchUrlForBrowser(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw ('Cannot send email.');
  }
}
