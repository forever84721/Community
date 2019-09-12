import 'package:community/Models/index.dart';
import 'package:flutter/material.dart';

class Post extends StatefulWidget {
  final PostViewModel postData;

  const Post({Key key, this.postData}) : super(key: key);
  @override
  _PostState createState() => _PostState();
}

class _PostState extends State<Post> {
  Column buildButtonColumn(IconData icon, String label) {
    Color color = Theme.of(context).primaryColor;
    return new Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        new Icon(icon, color: color),
        new Container(
          width: (MediaQuery.of(context).size.width - 46) / 3,
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
                        "靠北工程師",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text("昨天下午4:49"),
                    ],
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                          "#純靠北工程師1t4\n\n錢才是真的，加薪，升官，未來性，會培養，給爛薪水的別指望會有未來性，都給不出正常薪資了，怎會在花時間跟金錢去培養你呢?\n\n📢 匿名發文請至 https://kaobei.eng\n🥙 全平台留言 https://kaobei.engi"),
                    ),
                  ],
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
                    buildButtonColumn(Icons.star, 'Like'),
                    buildButtonColumn(Icons.chat, 'Chat'),
                    buildButtonColumn(Icons.share, 'SHARE'),
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
