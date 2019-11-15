import 'package:community/Models/index.dart';
import 'package:community/generated/i18n.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Post extends StatefulWidget {
  final PostViewModel postData;

  const Post({Key key, this.postData}) : super(key: key);
  @override
  _PostState createState() => _PostState();
}

class _PostState extends State<Post> {
  var formatter = new DateFormat('yyyy-MM-dd HH:mm');
  void testmethod() {
    print("testmethod");
  }

  Widget buildButtonColumn(IconData icon, String label, [int likeType = 0]) {
    // Color color = Theme.of(context).primaryColor;
    Color color = likeType == 0
        ? Color.fromARGB(200, 100, 100, 100)
        : Theme.of(context).primaryColor;
    return Material(
      child: InkWell(
        onTap: testmethod,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            new Icon(icon, color: color),
            new Container(
              width: (MediaQuery.of(context).size.width - 0) / 3,
              // margin: const EdgeInsets.only(top: 8.0),
              child: Center(
                child: Text(
                  label,
                  style: new TextStyle(
                    fontSize: 12.0,
                    fontWeight: FontWeight.w400,
                    color: color,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: new BorderRadius.circular(10.0),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 4, 0, 4),
        child: Container(
          // width: MediaQuery.of(context).size.width,
          color: Colors.white,
          child: Column(
            children: <Widget>[
              Row(
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ClipRRect(
                          borderRadius: new BorderRadius.circular(50.0),
                          child: Image.network(
                            "https://placem.at/places?w=40&h=40&&txtclr=0000&random=1",
                            width: 40.0,
                            height: 40.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.postData.name,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      // Text("昨天下午4:49"),
                      Text(formatter.format(widget.postData.postTime)),
                    ],
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(widget.postData.content),
                    ),
                  ],
                ),
              ),
              Container(
                // padding: const EdgeInsets.fromLTRB(0, 2, 0, 2),
                // decoration: new BoxDecoration(
                //     border: Border(
                //   top: BorderSide(
                //     color: Colors.grey,
                //     width: 1.0,
                //   ),
                // )),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 0),
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(widget.postData.numOfLike.toString() +
                          I18n.of(context).Like),
                      Spacer(),
                      Text(widget.postData.numOfComment.toString() +
                          I18n.of(context).Comment),
                      Text("-"),
                      Text(widget.postData.numOfShare.toString() +
                          I18n.of(context).Share),
                    ],
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(0, 2, 0, 2),
                decoration: new BoxDecoration(
                    border: Border(
                  top: BorderSide(
                    color: Colors.grey,
                    width: 1.0,
                  ),
                )),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    buildButtonColumn(Icons.star, I18n.of(context).Like,
                        widget.postData.likeType),
                    buildButtonColumn(Icons.chat, I18n.of(context).Comment),
                    buildButtonColumn(Icons.share, I18n.of(context).Share),
                    // CircularProgressIndicator(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
