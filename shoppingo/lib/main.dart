import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shoppingo/components/horizontal_listview.dart';
import 'package:shoppingo/components/products.dart';
import 'package:shoppingo/pages/cart.dart';

void main() {
  runApp(DynamicTheme(
    data: (Brightness brightness) {
      if (brightness == Brightness.dark) {
        return ThemeData(brightness: brightness);
      } else {
        return ThemeData(
          brightness: brightness,
        );
      }
    },
    defaultBrightness: Brightness.light,
    themedWidgetBuilder: (context, theme) {
      return MaterialApp(
        theme: theme,
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      );
    },
  ));
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void changeBrightness() {
    DynamicTheme.of(context).setBrightness(
        Theme.of(context).brightness == Brightness.dark
            ? Brightness.light
            : Brightness.dark);
  }

  @override
  Widget build(BuildContext context) {
    Widget image_carousel = new Container(
      height: 200.0,
      child: Carousel(
        boxFit: BoxFit.cover,
        images: [
          AssetImage('images/c1.jpg'),
          AssetImage('images/m1.jpeg'),
          AssetImage('images/m2.jpg'),
          AssetImage('images/w1.jpeg'),
          AssetImage('images/w3.jpeg'),
          AssetImage('images/w4.jpeg'),
        ],
        autoplay: false,
        animationCurve: Curves.fastLinearToSlowEaseIn,
        animationDuration: Duration(milliseconds: 1000),
        dotSize: 4.0,
        dotBgColor: Colors.transparent,
        indicatorBgPadding: 8.0,
      ),
    );
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        backgroundColor: Colors.pink,
        title: Text(
          'Shoppingo',
          style: GoogleFonts.raleway(),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(
              Icons.shopping_cart,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Cart()));
            },
          )
        ],
      ),
      drawer: new Drawer(
        child: ListView(
          children: <Widget>[
            //header
            new UserAccountsDrawerHeader(
              accountName: Text('Kapil Sharma'),
              accountEmail: Text('ks2822123@gmail.com'),
              currentAccountPicture: GestureDetector(
                child: new CircleAvatar(
                  backgroundColor: Colors.grey,
                  child: Icon(
                    Icons.person,
                    color: Colors.white,
                  ),
                ),
              ),
              decoration: new BoxDecoration(color: Colors.pink),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text('HOME PAGE'),
                leading: Icon(
                  Icons.home,
                  color: Colors.pink,
                ),
              ),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text('MY ACCOUNT'),
                leading: Icon(
                  Icons.person,
                  color: Colors.pink,
                ),
              ),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text('MY ORDERS'),
                leading: Icon(
                  Icons.shopping_basket,
                  color: Colors.pink,
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Cart()));
              },
              child: ListTile(
                title: Text('SHOPPING CART'),
                leading: Icon(
                  Icons.shopping_cart,
                  color: Colors.pink,
                ),
              ),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text('FAVORITE'),
                leading: Icon(
                  Icons.favorite_border,
                  color: Colors.pink,
                ),
              ),
            ),
            Divider(),
            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text('SETTINGS'),
                leading: Icon(
                  Icons.settings,
                  color: Colors.lightBlueAccent,
                ),
              ),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text('ABOUT'),
                leading: Icon(
                  Icons.help_outline,
                  color: Colors.lightBlueAccent,
                ),
              ),
            ),
            InkWell(
              onTap: () {
                changeBrightness();
              },
              child: ListTile(
                title:
                    DynamicTheme.of(context).data.brightness == Brightness.dark
                        ? Text("Light Theme")
                        : Text("Dark Theme"),
                leading: Icon(Icons.lightbulb_outline),
              ),
            )
          ],
        ),
      ),
      body: ListView(
        children: <Widget>[
          image_carousel,
          new Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Text(
                'CATEGORIES',
                style: GoogleFonts.poppins(),
              ),
            ),
          ),
          HorizontalList(),
          new Padding(
            padding: const EdgeInsets.all(15.0),
            child: Center(
              child: Text(
                'RECENT PRODUCTS',
                style: GoogleFonts.poppins(),
              ),
            ),
          ),
          Container(
            height: 200.0,
            child: Products(),
          )
        ],
      ),
    );
  }
}
