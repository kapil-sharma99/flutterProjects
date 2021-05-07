import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HorizontalList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 105.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Category(
            image_location: 'images/cats/tshirt.png',
            image_caption: 'SHIRT',
          ),
          Category(
            image_location: 'images/cats/dress.png',
            image_caption: 'DRESS',
          ),
          Category(
            image_location: 'images/cats/jeans.png',
            image_caption: 'PANTS',
          ),
          Category(
            image_location: 'images/cats/formal.png',
            image_caption: 'FORMAL',
          ),
          Category(
            image_location: 'images/cats/informal.png',
            image_caption: 'INFORMAL',
          ),
          Category(
            image_location: 'images/cats/shoe.png',
            image_caption: 'SHOES',
          ),
          Category(
            image_location: 'images/cats/accessories.png',
            image_caption: 'ACCESSORIES',
          ),
        ],
      ),
    );
  }
}

class Category extends StatelessWidget {
  final String image_location;
  final String image_caption;

  Category({this.image_location, this.image_caption});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(2.0),
      child: InkWell(
        onTap: () {},
        child: Container(
          width: 100.0,
          child: ListTile(
            isThreeLine: true,
            title: Image.asset(
              image_location,
              width: 100.0,
              height: 80.0,
            ),
            subtitle: Container(
              alignment: Alignment.topCenter,
              child: Text(image_caption, style: GoogleFonts.titilliumWeb()),
            ),
          ),
        ),
      ),
    );
  }
}
