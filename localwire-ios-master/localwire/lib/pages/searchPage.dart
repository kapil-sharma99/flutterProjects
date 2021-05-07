import 'package:LocalWire/pages/detailsPage.dart';
import 'package:LocalWire/widgets/news_card.dart';
import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/searchedPost.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {

  List<SearchedPost> searchResults = List();
  ScrollController _listScrollController;
  int lastPage = 1;
  bool isLoading = false, hasNotSearched = true, isLoadingNext = false, isEnded = false, isSearchSuccessful = true;
  String searchTerm;

  TextEditingController textEditingController = TextEditingController();

  @override
  void initState() {
    _listScrollController = ScrollController();
    _listScrollController.addListener(listScrollListener);
    super.initState();
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  listScrollListener() {
    if (_listScrollController.offset >= _listScrollController.position.maxScrollExtent &&
        !_listScrollController.position.outOfRange) {
          setState(() {
            lastPage += 1;
          });
          _fetchPage(lastPage);
        }
  }

  Future<void> _fetchPage(int pageno) async {
    setState(() {
      isLoadingNext = true;
    });

    try {
      final response = await http.get('http://localwire.me/wp-json/wp/v2/posts/?search=$searchTerm&_embed=1&per_page=20&page=$pageno');
      if (response.statusCode == 200) {
        setState(() {
          isLoadingNext = false;
          searchResults += (json.decode(response.body) as List).map((data) {
            return SearchedPost.fromJSON(data);
          }).toList();
        });
      }
    } catch (e) {
      if (e is NoSuchMethodError) {
        setState(() {
          isLoading = false;
          isLoadingNext = false;
          isEnded = true;
        });
      }
    }
  }

  handleSubmit(String term) async {
    setState(() {
      isLoading = true;
      hasNotSearched = false;
      searchTerm = term;
    });
    try {
      final response = await http.get('http://localwire.me/wp-json/wp/v2/posts/?search=$term&_embed=1&per_page=20');
      if (response.statusCode == 200) {
        searchResults = (json.decode(response.body) as List).map((data) {
          return SearchedPost.fromJSON(data);
        }).toList();
        if (searchResults.length == 0) {
          setState(() {
            isSearchSuccessful = false;
          });
        }
        setState(() {
          isSearchSuccessful = true;
          isLoading = false;
        });
      }
    } catch (e) {
      if (e is NoSuchMethodError) {

      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: DynamicTheme.of(context).data.backgroundColor,
        elevation: 5,
        title: TextField(
          controller: textEditingController,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: 'Type here to search...',           
          ),
          onSubmitted: handleSubmit
        ),
        actions: <Widget>[
          hasNotSearched == false ? IconButton(
            icon: Icon(Icons.remove_circle_outline, color: Colors.grey,),
            onPressed: () {
              setState(() {
                textEditingController.text = '';
                searchResults = List();
                hasNotSearched = true;
              });
            },
          ) : SizedBox()
        ],
      ),
      body: hasNotSearched
          ? SizedBox()
          : isLoading
        ? Center(
          child: CircularProgressIndicator(),
        ) : isSearchSuccessful ?
        ListView.builder(
          itemCount: searchResults.length + 1,
          controller: _listScrollController,
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index) {
            return (index == searchResults.length)
                ? isEnded ? SizedBox(height: 0,)
                : Center(child: CircularProgressIndicator(),) 
                : ListTile(
                  title: Text(searchResults[index].title),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => DetailsPage(searchResults, index, 'English')
                      )
                    );
                  },
                );
          },
        )
        : Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 20,),
            Text(
              'No results found',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20
              ),
            )
          ],
        )
    );
  }
}