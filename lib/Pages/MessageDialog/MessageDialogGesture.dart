import 'package:flutter/material.dart';

class MessageDialogGesture extends StatelessWidget {
  final GestureDragStartCallback onVerticalDragStart;
  final GestureDragUpdateCallback onVerticalDragUpdate;
  final GestureDragEndCallback onVerticalDragEnd;
  final Color pillColor;

  MessageDialogGesture({
    @required this.onVerticalDragStart,
    @required this.onVerticalDragUpdate,
    @required this.onVerticalDragEnd,
    @required this.pillColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onVerticalDragStart: onVerticalDragStart,
      onVerticalDragUpdate: onVerticalDragUpdate,
      onVerticalDragEnd: onVerticalDragEnd,
      child: Container(
        width: double.infinity,
        child: Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("1986"),
            ),
            Spacer(),
            Container(
              height: 5.0,
              width: 25.0,
              decoration: BoxDecoration(
                color: pillColor ?? Colors.blueGrey[200],
                borderRadius: BorderRadius.circular(50.0),
              ),
            ),
            Spacer(),
            SizedBox(
              width: 50,
              child: Material(
                child: InkWell(
                  onTap: () => {},
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      new Icon(Icons.star,
                          color: Theme.of(context).primaryColor),
                    ],
                  ),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(15.0),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
