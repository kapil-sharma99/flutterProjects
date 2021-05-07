import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        backgroundColor: Colors.pink,
        title: Text(
          'Cart',
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
        ],
      ),
      bottomNavigationBar: Container(
        color: Colors.white,
        child: Row(
          children: <Widget>[
            Expanded(
              child: ListTile(
                title: Text(
                  'Total Amount:',
                  style: GoogleFonts.poppins(),
                ),
                subtitle: new Text(
                  '\$250',
                  style: GoogleFonts.poppins(),
                ),
              ),
            ),
            Expanded(
              child: MaterialButton(
                color: Colors.pink,
                onPressed: () {},
                child: new Text(
                  'Check Out',
                  style: GoogleFonts.poppins(color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
