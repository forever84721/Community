import 'package:community/Widget/SearchBar.dart';
import 'package:community/generated/i18n.dart';
import 'package:flutter/material.dart';

class PostBrowsing extends StatefulWidget {
  @override
  _PostBrowsingState createState() => _PostBrowsingState();
}

class _PostBrowsingState extends State<PostBrowsing> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SearchBar(title: "123"),
      body: Text("123"),
    );
  }
}
