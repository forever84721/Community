import 'package:flutter/material.dart';

class MessageInput extends StatelessWidget {
  const MessageInput({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Container(
        decoration: new BoxDecoration(
            // shape: BoxShape.rectangle,
            // border: new Border.all(
            // color: Colors.black,
            // width: 1.0,
            // ),
            // color: Colors.red,
            // borderRadius: BorderRadius.circular(80.0),
            ),
        child: TextField(
          style: new TextStyle(
            fontSize: 20.0,
            // height: 2.0,
            color: Colors.black,
          ),
          decoration: new InputDecoration(
            // border: new OutlineInputBorder(
            //   borderSide: new BorderSide(color: Colors.red),
            // ),
            // focusedBorder: OutlineInputBorder(
            //   borderSide: BorderSide(color: Colors.white),
            //   borderRadius: BorderRadius.circular(25.7),
            // ),
            // enabledBorder: UnderlineInputBorder(
            //   borderSide: BorderSide(color: Colors.white),
            //   borderRadius: BorderRadius.circular(25.7),
            // ),
            hintText: 'Leave a message',
            // helperText: 'Keep it short, this is just a demo.',
            // labelText: 'Life story',
            prefixIcon: Material(
              child: InkWell(
                onTap: () => print('object'),
                child: Icon(Icons.camera_alt),
              ),
            ),
            prefixText: ' ',
            // suffixText: 'USD',
            // suffixStyle:
            //     const TextStyle(color: Colors.green)
            suffixIcon: Material(
              child: InkWell(
                onTap: () => print('object'),
                child: Icon(Icons.send),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
