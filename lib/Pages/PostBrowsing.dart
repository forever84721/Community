import 'package:community/Widget/Post.dart';
// import 'package:community/Widget/SearchBar.dart';
// import 'package:community/generated/i18n.dart';
import 'package:flutter/material.dart';

class PostBrowsing extends StatefulWidget {
  final Function(double h) notifyParent;
  const PostBrowsing({Key key, this.notifyParent}) : super(key: key);
  @override
  _PostBrowsingState createState() => _PostBrowsingState();
}

class _PostBrowsingState extends State<PostBrowsing>
    with AutomaticKeepAliveClientMixin {
  double oldOffset = 0;
  ScrollController _controller;
  _scrollListener() {
    // print(oldOffset);
    // print(_controller.offset);
    var deltaH = oldOffset - _controller.offset;
    if (deltaH < 0) {
      deltaH = 0;
    } else if (deltaH > 0) {
      deltaH = 60;
    }
    oldOffset = _controller.offset;
    // print("newH:" + deltaH.toString());
    setState(() {
      widget.notifyParent(deltaH);
    });
  }

  @override
  void initState() {
    super.initState();
    _controller = ScrollController();
    _controller.addListener(_scrollListener);
    print("initState");
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      // appBar: SearchBar(title: "123"),
      backgroundColor: Colors.grey,
      body: ListView(
        // padding: const EdgeInsets.all(8.0),
        controller: _controller,
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

  @override
  bool get wantKeepAlive => true;
}
