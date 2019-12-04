import 'package:community/Common/Util.dart';
import 'package:community/Models/ResponseModels.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class Message extends StatefulWidget {
  final ReplyViewModel replyViewModel;

  const Message({Key key, this.replyViewModel}) : super(key: key);

  @override
  _MessageState createState() => _MessageState();
}

class _MessageState extends State<Message> {
  @override
  Widget build(BuildContext context) {
    return Slidable(
      actionPane: SlidableDrawerActionPane(),
      actionExtentRatio: 0.25,
      child: Container(
        color: Colors.white,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipRRect(
                    borderRadius: new BorderRadius.circular(50.0),
                    child: Image.network(
                      "https://placem.at/places?w=40&h=40&&txtclr=0000&random=2",
                      width: 40.0,
                      height: 40.0,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 4, 0, 4),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    constraints: BoxConstraints(
                        // minWidth: ,
                        maxWidth:
                            MediaQuery.of(context).size.width - (40 + 16 + 8)),
                    // width: MediaQuery.of(context).size.width - (40 + 16 + 8),
                    decoration: new BoxDecoration(
                      shape: BoxShape.rectangle,
                      // border: new Border.all(
                      //   color: Colors.black,
                      //   width: 1.0,
                      // ),
                      color: Color.fromARGB(120, 200, 200, 200),
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    padding: const EdgeInsets.all(8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(bottom: 2),
                          child: Text(this.widget.replyViewModel.name),
                        ),
                        Text(this.widget.replyViewModel.content),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Text(Util.dateTimeToString(
                        this.widget.replyViewModel.postTime)),
                  ),
                ],
              ),
            ),
          ],
        ),
        // child: ListTile(
        //   leading: CircleAvatar(
        //     backgroundColor: Colors.indigoAccent,
        //     child: Text('123'),
        //     foregroundColor: Colors.white,
        //   ),
        //   title: Text('name'),
        //   subtitle: Text('%#@%ERTYWTYREWY%#^%'),
        // ),
      ),
      // actions: <Widget>[
      //   IconSlideAction(
      //     caption: 'Archive',
      //     color: Colors.blue,
      //     icon: Icons.archive,
      //     onTap: () => print('object1'),
      //   ),
      //   IconSlideAction(
      //     caption: 'Share',
      //     color: Colors.indigo,
      //     icon: Icons.share,
      //     onTap: () => print('object2'),
      //   ),
      // ],
      secondaryActions: <Widget>[
        IconSlideAction(
          caption: 'More',
          color: Colors.black45,
          icon: Icons.more_horiz,
          onTap: () => print('object3'),
        ),
        IconSlideAction(
          caption: 'Delete',
          color: Colors.red,
          icon: Icons.delete,
          onTap: () => print('object4'),
        ),
      ],
    );
  }
}
