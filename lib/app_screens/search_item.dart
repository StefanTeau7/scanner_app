import 'dart:math';

import 'package:flappy_search_bar/scaled_tile.dart';
import 'package:flutter/material.dart';
import 'package:scanner_app/others/constants.dart';
import 'package:flappy_search_bar/flappy_search_bar.dart';


class SearchItem extends StatefulWidget {
  @override
  _SearchItemState createState() => _SearchItemState();
}
class Post {
  final String title;
  final String body;

  Post(this.title, this.body);
}

class _SearchItemState extends State<SearchItem> {
  
    final SearchBarController<Post> _searchBarController = SearchBarController();
  bool isReplay = false;

  Future<List<Post>> _getALlPosts(String text) async {
    await Future.delayed(Duration(seconds: text.length == 4 ? 10 : 1));
    if (isReplay) return [Post("Replaying !", "Replaying body")];
    if (text.length == 5) throw Error();
    if (text.length == 6) return [];
    List<Post> posts = [];

    var random = new Random();
    for (int i = 0; i < 10; i++) {
      posts.add(Post("$text $i", "body random number : ${random.nextInt(100)}"));
    }
    return posts;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: normalColor,
      bottomNavigationBar: BottomAppBar(
          elevation: 20,
          color: backgroundColor,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Text("Add to...",
                  style: TextStyle(color: normalColor)),
                  IconButton(
                    icon: Icon(Icons.bookmark),
                    color: normalColor,
                    onPressed: () {},
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Text("Add to...",
                  style: TextStyle(color: normalColor)),
                  IconButton(
                    icon: Icon(Icons.track_changes),
                    color: normalColor,
                    onPressed: () {},
                  ),
                ],
              ),
            ],
          )),
    body: SafeArea(child: 
    SearchBar<Post>(
          searchBarPadding: EdgeInsets.symmetric(horizontal: 10),
          headerPadding: EdgeInsets.symmetric(horizontal: 10),
          listPadding: EdgeInsets.symmetric(horizontal: 10),
          onSearch: _getALlPosts,
          searchBarController: _searchBarController,
          placeHolder: Text(""),
          cancellationWidget: Text("Cancel"),
          emptyWidget: Text("empty"),
          indexedScaledTileBuilder: (int index) => ScaledTile.count(1, index.isEven ? 2 : 1),
          header: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              
              RaisedButton(
                 color: backgroundColor,
                child: Text("Sort",style: TextStyle(color: normalColor)),
                onPressed: () {
                  _searchBarController.sortList((Post a, Post b) {
                    return a.body.compareTo(b.body);
                  });
                },
              ),
              RaisedButton(
                color: backgroundColor,
                child: Text("Filter",style: TextStyle(color: normalColor)),
                onPressed: () {
                  _searchBarController.removeSort();
                },
              ),
              
            ],
          ),
          onCancelled: () {
            print("Cancelled triggered");
          },
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          crossAxisCount: 2,
          onItemFound: (Post post, int index) {
            return Container(
              color: secondColor,
              child: ListTile(
                title: Text(post.title),
                isThreeLine: true,
                subtitle: Text(post.body),
                onTap: () {
                  //Navigator.of(context).push(MaterialPageRoute(builder: (context) => Detail()));
                },
              ),
            );
          },
        ),),
    );
  }
}