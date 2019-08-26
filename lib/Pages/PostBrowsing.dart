import 'package:community/Widget/Post.dart';
// import 'package:community/Widget/SearchBar.dart';
// import 'package:community/generated/i18n.dart';
import 'package:flutter/material.dart';

class PostBrowsing extends StatefulWidget {
  @override
  _PostBrowsingState createState() => _PostBrowsingState();
}

class _PostBrowsingState extends State<PostBrowsing> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: SearchBar(title: "123"),
      backgroundColor: Colors.grey,
      body: ListView(
        // padding: const EdgeInsets.all(8.0),
        children: <Widget>[
          Post(),
          Post(),
          Post(),
          Post(),
          Post(),
          Post(),
          Post(),
          Post(),
          Post(),
          Post(),
          Post(),
          Post(),
        ],
      ),
    );
  }
}
