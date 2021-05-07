// import 'package:flutter/material.dart';
// import 'specificCategoryPage.dart';
// import 'videoListPage.dart';

// class CategoriesPage extends StatefulWidget {
//   CategoriesPage({Key key}) : super(key: key);

//   @override
//   _CategoriesPageState createState() => _CategoriesPageState();
// }

// class _CategoriesPageState extends State<CategoriesPage> {
//   _CategoriesPageState();

//   @override
//   Widget build(BuildContext context) {
//     final double deviceHeight = MediaQuery.of(context).size.height;

//     return Scaffold(
//       body: GridView.count(
//         crossAxisCount: 3,
//         mainAxisSpacing: 2,
//         children: <Widget>[
//           InkWell(
//             onTap: () {
//               Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                       builder: (context) => SpecificCategoryPage(
//                             mainUrl:
//                                 'https://localwire.me/wp-json/wp/v2/posts/?tags=15334',
//                           )));
//             },
//             child: Card(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: <Widget>[
//                   Image.asset(
//                     'assets/happening.png',
//                     height: deviceHeight * 0.08,
//                   ),
//                   SizedBox(
//                     height: 20.0,
//                   ),
//                   Text(
//                     'Happenings',
//                     style: TextStyle(
//                         color: Colors.blue, fontSize: deviceHeight * 0.019),
//                   )
//                 ],
//               ),
//             ),
//           ),
//           InkWell(
//             onTap: () {
//               Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                       builder: (context) => SpecificCategoryPage(
//                             mainUrl:
//                                 'https://localwire.me/wp-json/wp/v2/posts/?tags=17950&per_page=20',
//                           )));
//             },
//             child: Card(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: <Widget>[
//                   Image.asset(
//                     'assets/badge.png',
//                     height: deviceHeight * 0.08,
//                   ),
//                   SizedBox(
//                     height: 20.0,
//                   ),
//                   Text(
//                     'Special',
//                     style: TextStyle(
//                         color: Colors.blue, fontSize: deviceHeight * 0.019),
//                   )
//                 ],
//               ),
//             ),
//           ),
//           InkWell(
//             onTap: () {
//               Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                       builder: (context) => SpecificCategoryPage(
//                             mainUrl:
//                                 'https://localwire.me/wp-json/wp/v2/posts/?tags=4254'
//                           )));
//             },
//             child: Card(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: <Widget>[
//                   Image.asset(
//                     'assets/business.png',
//                     height: deviceHeight * 0.08,
//                   ),
//                   SizedBox(
//                     height: 20.0,
//                   ),
//                   Text(
//                     'Business',
//                     style: TextStyle(
//                         color: Colors.blue, fontSize: deviceHeight * 0.019),
//                   )
//                 ],
//               ),
//             ),
//           ),
//           InkWell(
//             onTap: () {
//               Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                       builder: (context) => SpecificCategoryPage(
//                             mainUrl:
//                                 'https://localwire.me/wp-json/wp/v2/posts/?tags=63',
//                           )));
//             },
//             child: Card(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: <Widget>[
//                   Image.asset(
//                     'assets/education.png',
//                     height: deviceHeight * 0.08,
//                   ),
//                   SizedBox(
//                     height: 20.0,
//                   ),
//                   Text(
//                     'Education',
//                     style: TextStyle(
//                         color: Colors.blue, fontSize: deviceHeight * 0.019),
//                   )
//                 ],
//               ),
//             ),
//           ),
//           InkWell(
//             onTap: () {
//               Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                       builder: (context) => SpecificCategoryPage(
//                             mainUrl:
//                                 'https://localwire.me/wp-json/wp/v2/posts/?tags=15331'
//                           )));
//             },
//             child: Card(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: <Widget>[
//                   Image.asset(
//                     'assets/doctor.png',
//                     height: deviceHeight * 0.08,
//                   ),
//                   SizedBox(
//                     height: 20.0,
//                   ),
//                   Text(
//                     'Health',
//                     style: TextStyle(
//                         color: Colors.blue, fontSize: deviceHeight * 0.019),
//                   )
//                 ],
//               ),
//             ),
//           ),
//           InkWell(
//               onTap: () {
//                 Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                         builder: (context) => SpecificCategoryPage(
//                               mainUrl:
//                                   'https://localwire.me/wp-json/wp/v2/posts/?tags=16'
//                             )));
//               },
//               child: Card(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: <Widget>[
//                     Image.asset(
//                       'assets/politics.png',
//                       height: deviceHeight * 0.08,
//                     ),
//                     SizedBox(
//                       height: 20.0,
//                     ),
//                     Text(
//                       'Politics',
//                       style: TextStyle(
//                           color: Colors.blue, fontSize: deviceHeight * 0.019),
//                     )
//                   ],
//                 ),
//               )),
//           InkWell(
//             onTap: () {
//               Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                       builder: (context) => SpecificCategoryPage(
//                             mainUrl:
//                                 'https://localwire.me/wp-json/wp/v2/posts/?tags=28301'
//                           )));
//             },
//             child: Card(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: <Widget>[
//                   Image.asset(
//                     'assets/election.png',
//                     height: deviceHeight * 0.08,
//                   ),
//                   SizedBox(
//                     height: 20.0,
//                   ),
//                   Text(
//                     'Election - 2019',
//                     style: TextStyle(
//                         color: Colors.blue, fontSize: deviceHeight * 0.019),
//                   )
//                 ],
//               ),
//             ),
//           ),
//           InkWell(
//             onTap: () {
//               Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                       builder: (context) => SpecificCategoryPage(
//                             mainUrl:
//                                 'https://localwire.me/wp-json/wp/v2/posts/?tags=14285'
//                           )));
//             },
//             child: Card(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: <Widget>[
//                   Image.asset(
//                     'assets/sports.png',
//                     height: deviceHeight * 0.08,
//                   ),
//                   SizedBox(
//                     height: 20.0,
//                   ),
//                   Text(
//                     'Sports',
//                     style: TextStyle(
//                         color: Colors.blue, fontSize: deviceHeight * 0.019),
//                   )
//                 ],
//               ),
//             ),
//           ),
//           InkWell(
//             onTap: () {
//               Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                       builder: (context) => SpecificCategoryPage(
//                             mainUrl:
//                                 'https://localwire.me/wp-json/wp/v2/posts/?tags=41947'
//                           )));
//             },
//             child: Card(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: <Widget>[
//                   Image.asset(
//                     'assets/tornado.png',
//                     height: deviceHeight * 0.08,
//                   ),
//                   SizedBox(
//                     height: 20.0,
//                   ),
//                   Text(
//                     'Cyclone - Fani',
//                     style: TextStyle(
//                         color: Colors.blue, fontSize: deviceHeight * 0.019),
//                   )
//                 ],
//               ),
//             ),
//           ),
//           InkWell(
//               onTap: () {
//                 Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                         builder: (context) => VideoListPage(
//                             url: 'https://localwire-onair.herokuapp.com')));
//               },
//               child: Card(
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: <Widget>[
//                     Image.asset(
//                       'assets/on-air.png',
//                       height: deviceHeight * 0.08,
//                     ),
//                     SizedBox(
//                       height: 20.0,
//                     ),
//                     Text(
//                       'On Air News',
//                       style: TextStyle(
//                           color: Colors.blue, fontSize: deviceHeight * 0.019),
//                     )
//                   ],
//                 ),
//               ))
//         ],
//       ),
//     );
//   }
// }
