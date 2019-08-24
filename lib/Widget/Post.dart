import 'package:flutter/material.dart';

class Post extends StatefulWidget {
  @override
  _PostState createState() => _PostState();
}

class _PostState extends State<Post> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: new BorderRadius.circular(10.0),
      child: Padding(
        padding: const EdgeInsets.all(4),
        child: Container(
          height: 250,
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
                  //給爛薪水的別指望會有未來性，都給不出正常薪資了，怎會在花時間跟金錢去培養你呢?
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("#純靠北工程師1t4"),
                        Text(
                          "錢才是真的，加薪，升官，未來性，會培養，",
                        ),
                        Text("📢 匿名發文請至 https://kaobei.eng"),
                        Text("🥙 全平台留言 https://kaobei.engi"),
                      ],
                    ),
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
