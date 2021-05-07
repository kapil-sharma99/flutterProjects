import 'package:LocalWire/pages/savedPosts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:dynamic_theme/theme_switcher_widgets.dart';

class MenuPage extends StatefulWidget {
  final String language;

  MenuPage(this.language);

  @override
  _MenuPageState createState() => _MenuPageState(this.language);
}

class _MenuPageState extends State<MenuPage> {
  String language;
  bool isDarkMode;
  bool isTap = false;
  _MenuPageState(this.language);

  @override
  void initState() {
    setState(() {
      this.language = language;
    });
    super.initState();
  }

  Future _askAboutLanguage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    switch (await showDialog(
        context: context,
        builder: (BuildContext context) => SimpleDialog(
              title: Text(
                'Language Preference',
                style: TextStyle(
                    color:
                        DynamicTheme.of(context).data.textTheme.subtitle.color),
              ),
              children: <Widget>[
                SimpleDialogOption(
                    child: Container(
                        color: prefs.getString('language') == 'English'
                            ? Colors.blue[300]
                            : Colors.white,
                        child: InkWell(
                          child: Text(
                            'English',
                          ),
                          onTap: () async {
                            SharedPreferences prefs =
                                await SharedPreferences.getInstance();
                            prefs.setString('language', 'English');
                            Navigator.pop(context, language);
                          },
                        ))),
                SimpleDialogOption(
                    child: Container(
                  color: prefs.getString('language') == 'ଓଡ଼ିଆ'
                      ? Colors.blue
                      : Colors.white,
                  child: InkWell(
                    child: Text(
                      'ଓଡ଼ିଆ',
                    ),
                    onTap: () async {
                      SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                      prefs.setString('language', 'ଓଡ଼ିଆ');
                      Navigator.pop(context, language);
                    },
                  ),
                )),
              ],
            ))) {
    }
  }

  void changeBrightness() {
    DynamicTheme.of(context).setBrightness(
        Theme.of(context).brightness == Brightness.dark
            ? Brightness.light
            : Brightness.dark);
  }

  void changeColor() {
    DynamicTheme.of(context).setThemeData(new ThemeData(
        primaryColor: Theme.of(context).primaryColor == Colors.indigo
            ? Colors.red
            : Colors.indigo));
  }

  Future<String> getDefaultLanguage() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String language = preferences.getString('language');
    return language;
  }

  @override
  Widget build(BuildContext context) {
    final double deviceHeight = MediaQuery.of(context).size.height;
    String language = '';
    getDefaultLanguage().then((onValue) {
      if (onValue == null) {
        language = 'Not set';
      } else {
        language = onValue;
      }
    });
    String isDark;
    getDefaultLanguage().then((value) {
      isDark = value;
    });

    return Scaffold(
        body: ListView(
      children: <Widget>[
        TopSection(),
        Card(
          child: Row(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(vertical: 22.0, horizontal: 10.0),
              ),
              Text(
                'General',
                style: TextStyle(color: Colors.blue),
              ),
            ],
          ),
        ),
        Card(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  IconButton(
                    icon: Image.asset('assets/language.png'),
                  ),
                  Text(
                    'Language Preferences',
                  ),
                ],
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.grey,
                ),
              )
            ],
          ),
        ),
        Card(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  IconButton(
                    icon: Image.asset('assets/night.png'),
                  ),
                  Text(
                    'Night Mode',
                  ),
                ],
              ),
              IconButton(
                icon: Icon(
                  Icons.radio_button_unchecked,
                  color: Colors.grey,
                ),
              )
            ],
          ),
        ),
        Card(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  IconButton(
                    icon: Image.asset('assets/fav1.png'),
                  ),
                  Text(
                    'Saved Stories',
                  ),
                ],
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.grey,
                ),
              )
            ],
          ),
        ),
        Card(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  IconButton(
                    icon: Image.asset('assets/noti.png'),
                  ),
                  Text(
                    'Notification Settings',
                  ),
                ],
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.grey,
                ),
              )
            ],
          ),
        ),
        Card(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  IconButton(
                    icon: Image.asset('assets/group.png'),
                  ),
                  Text(
                    'About',
                  ),
                ],
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.grey,
                ),
              )
            ],
          ),
        ),
        Card(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  IconButton(
                    icon: Image.asset('assets/privacy.png'),
                  ),
                  Text(
                    'Privacy Policy',
                  ),
                ],
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.grey,
                ),
              )
            ],
          ),
        ),
        Card(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  IconButton(
                    icon: Image.asset('assets/update.png'),
                  ),
                  Text(
                    'App Update',
                  ),
                ],
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.grey,
                ),
              )
            ],
          ),
        ),
        Card(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  IconButton(
                    icon: Image.asset('assets/clear.png'),
                  ),
                  Text(
                    'Clear Cache',
                  ),
                ],
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.grey,
                ),
              )
            ],
          ),
        ),
        Card(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  IconButton(
                    icon: Image.asset('assets/invite.png'),
                  ),
                  Text(
                    'Invite Your Friend',
                  ),
                ],
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.grey,
                ),
              )
            ],
          ),
        ),
        Card(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  IconButton(
                    icon: Image.asset('assets/quiz.png'),
                  ),
                  Text(
                    'Quiz Dashboard',
                  ),
                ],
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.grey,
                ),
              )
            ],
          ),
        ),
        Card(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  IconButton(
                    icon: Image.asset('assets/refer.png'),
                  ),
                  Text(
                    'Refer and Earn',
                  ),
                ],
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.grey,
                ),
              )
            ],
          ),
        ),
        Card(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  IconButton(
                    icon: Image.asset('assets/career.png'),
                  ),
                  Text(
                    'Career',
                  ),
                ],
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.grey,
                ),
              )
            ],
          ),
        ),
        Card(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  IconButton(
                    icon: Image.asset('assets/feedback.png'),
                  ),
                  Text(
                    'Feedback',
                  ),
                ],
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.grey,
                ),
              )
            ],
          ),
        ),
      ],
    ));
  }
}

class TopSection extends StatelessWidget {
  const TopSection({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xff00129b),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20.0),
          bottomRight: Radius.circular(20.0),
        ),
      ),
      height: 150.0,
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
              ),
              Text(
                'Settings',
                style: TextStyle(color: Colors.white),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 15.0),
                child: Row(
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        CircleAvatar(
                          child: Image.asset('assets/job.png'),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          'Kapil Sharma',
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Row(
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        IconButton(
                          icon: Icon(
                            Icons.dashboard,
                            size: 35.0,
                            color: Colors.blue,
                          ),
                        ),
                        Text(
                          'Dashboard',
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Column(
                      children: <Widget>[
                        IconButton(
                          icon: Icon(
                            Icons.person,
                            size: 35.0,
                            color: Colors.blue,
                          ),
                        ),
                        Text(
                          'Sign out',
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

_launchUrlForMail(String toMailId, String subject) async {
  var url = "mailto:$toMailId?subject=$subject";
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw ('Cannot send email.');
  }
}

_launchUrlForBrowser(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw ('Cannot send email.');
  }
}
