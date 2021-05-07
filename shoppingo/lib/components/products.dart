import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shoppingo/pages/product_details.dart';

class Products extends StatefulWidget {
  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  var product_list = [
    {
      "name": "Black Blazer",
      "picture": "images/products/blazer1.jpeg",
      "old_price": 120,
      "price": 85,
    },
    {
      "name": "Red Dress",
      "picture": "images/products/dress1.jpeg",
      "old_price": 100,
      "price": 50,
    },
    {
      "name": "Brown Hills",
      "picture": "images/products/hills1.jpeg",
      "old_price": 100,
      "price": 50,
    },
    {
      "name": "Blue Blazer",
      "picture": "images/products/blazer2.jpeg",
      "old_price": 100,
      "price": 50,
    },
    {
      "name": "Pink Skirt",
      "picture": "images/products/skt2.jpeg",
      "old_price": 100,
      "price": 50,
    },
    {
      "name": "Black Dress",
      "picture": "images/products/dress2.jpeg",
      "old_price": 100,
      "price": 50,
    },
  ];
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: product_list.length,
      gridDelegate:
          new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemBuilder: (BuildContext context, int index) {
        return Single_prod(
          prod_name: product_list[index]['name'],
          prod_picture: product_list[index]['picture'],
          prod_old_price: product_list[index]['old_price'],
          prod_price: product_list[index]['price'],
        );
      },
    );
  }
}

class Single_prod extends StatelessWidget {
  final prod_name;
  final prod_picture;
  final prod_old_price;
  final prod_price;

  Single_prod(
      {this.prod_name,
      this.prod_old_price,
      this.prod_picture,
      this.prod_price});
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Hero(
          tag: prod_name,
          child: Material(
            child: InkWell(
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => new ProductDetails(
                    product_details_name: prod_name,
                    product_details_new_price: prod_price,
                    product_details_old_price: prod_old_price,
                    product_details_picture: prod_picture,
                  ),
                ),
              ),
              child: GridTile(
                footer: Container(
                  color: Colors.white70,
                  child: new Row(
                    children: <Widget>[
                      Expanded(
                        child: Text(
                          prod_name,
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.bold, fontSize: 16.0),
                        ),
                      ),
                      Text(
                        "\$${prod_price}",
                        style: GoogleFonts.poppins(
                            color: Colors.red, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
                child: Image.asset(
                  prod_picture,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          )),
    );
  }
}
