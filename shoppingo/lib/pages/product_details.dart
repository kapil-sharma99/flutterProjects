import 'dart:ui';
import 'package:shoppingo/pages/cart.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shoppingo/main.dart';

class ProductDetails extends StatefulWidget {
  final product_details_name;
  final product_details_old_price;
  final product_details_new_price;
  final product_details_picture;

  ProductDetails(
      {this.product_details_name,
      this.product_details_new_price,
      this.product_details_old_price,
      this.product_details_picture});
  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        backgroundColor: Colors.pink,
        title: InkWell(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => new HomePage()));
          },
          child: Text(
            'Shoppingo',
            style: GoogleFonts.raleway(),
          ),
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
      body: ListView(
        children: <Widget>[
          Container(
            height: 300.0,
            child: GridTile(
              child: Container(
                color: Colors.white,
                child: Image.asset(widget.product_details_picture),
              ),
              footer: new Container(
                color: Colors.white70,
                child: ListTile(
                  leading: new Text(
                    widget.product_details_name,
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                    ),
                  ),
                  title: new Row(
                    children: <Widget>[
                      Expanded(
                        child: Text(
                          "\$${widget.product_details_old_price}",
                          style: GoogleFonts.poppins(
                              color: Colors.grey,
                              decoration: TextDecoration.lineThrough),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          "\$${widget.product_details_new_price}",
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),

          //the first buttons

          Row(
            children: <Widget>[
              //the size button
              Expanded(
                child: MaterialButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return new AlertDialog(
                            title: Text(
                              'SIZE',
                              style: GoogleFonts.poppins(),
                            ),
                            content: Text(
                              'Choose your size',
                              style: GoogleFonts.poppins(),
                            ),
                            actions: <Widget>[
                              new MaterialButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text(
                                  'CLOSE',
                                  style:
                                      GoogleFonts.poppins(color: Colors.blue),
                                ),
                              )
                            ],
                          );
                        });
                  },
                  color: Colors.white,
                  textColor: Colors.grey,
                  elevation: 0.2,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Text(
                          'SIZE',
                          style: GoogleFonts.poppins(),
                        ),
                      ),
                      Expanded(
                        child: Icon(Icons.arrow_drop_down),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: MaterialButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return new AlertDialog(
                            title: Text(
                              'COLOR',
                              style: GoogleFonts.poppins(),
                            ),
                            content: Text(
                              'Choose a Color',
                              style: GoogleFonts.poppins(),
                            ),
                            actions: <Widget>[
                              new MaterialButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text(
                                  'CLOSE',
                                  style:
                                      GoogleFonts.poppins(color: Colors.blue),
                                ),
                              )
                            ],
                          );
                        });
                  },
                  color: Colors.white,
                  textColor: Colors.grey,
                  elevation: 0.2,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Text(
                          'COLOR',
                          style: GoogleFonts.poppins(),
                        ),
                      ),
                      Expanded(
                        child: Icon(Icons.arrow_drop_down),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: MaterialButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return new AlertDialog(
                            title: Text(
                              'QUANTITY',
                              style: GoogleFonts.poppins(),
                            ),
                            content: Text(
                              'Choose your Quantity',
                              style: GoogleFonts.poppins(),
                            ),
                            actions: <Widget>[
                              new MaterialButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text(
                                  'CLOSE',
                                  style:
                                      GoogleFonts.poppins(color: Colors.blue),
                                ),
                              )
                            ],
                          );
                        });
                  },
                  color: Colors.white,
                  textColor: Colors.grey,
                  elevation: 0.2,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Text(
                          'QTY',
                          style: GoogleFonts.poppins(),
                        ),
                      ),
                      Expanded(
                        child: Icon(Icons.arrow_drop_down),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          // The second button
          Row(
            children: <Widget>[
              //the size button
              Expanded(
                child: MaterialButton(
                  onPressed: () {},
                  color: Colors.pink,
                  textColor: Colors.white,
                  elevation: 0.2,
                  child: new Text(
                    'BUY NOW',
                    style: GoogleFonts.play(),
                  ),
                ),
              ),
              new IconButton(
                  icon: Icon(Icons.add_shopping_cart),
                  color: Colors.pink,
                  onPressed: () {}),
              new IconButton(
                  icon: Icon(Icons.favorite_border),
                  color: Colors.pink,
                  onPressed: () {})
            ],
          ),
          Divider(
            color: Colors.pink,
          ),
          new ListTile(
            title: new Text(
              'Product Details',
              style: GoogleFonts.poppins(),
            ),
            subtitle: new Text(
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."),
          ),
          Divider(
            color: Colors.pink,
          ),
          new Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
                child: Text(
                  'Product name',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(5.0),
                child: Text(widget.product_details_name),
              ),
            ],
          ),
          new Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
                child: Text(
                  'Product Brand',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              // #todo: remember to create a product brand
              Padding(
                padding: EdgeInsets.all(5.0),
                child: Text('Raymond'),
              ),
            ],
          ),
          new Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
                child: Text(
                  'Product Condition',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(5.0),
                child: Text('Brand new'),
              ),
            ],
          ),
          Divider(),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Similar Products',
                style: GoogleFonts.poppins(),
              ),
            ),
          ),
          //SIMILAR_PRODUCT_SECTION
          Container(
            height: 340.0,
            child: Similar_products(),
          )
        ],
      ),
    );
  }
}

class Similar_products extends StatefulWidget {
  @override
  _Similar_productsState createState() => _Similar_productsState();
}

class _Similar_productsState extends State<Similar_products> {
  var product_list = [
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
        return Similar_single_prod(
          prod_name: product_list[index]['name'],
          prod_picture: product_list[index]['picture'],
          prod_old_price: product_list[index]['old_price'],
          prod_price: product_list[index]['price'],
        );
      },
    );
  }
}

class Similar_single_prod extends StatelessWidget {
  final prod_name;
  final prod_picture;
  final prod_old_price;
  final prod_price;

  Similar_single_prod(
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
