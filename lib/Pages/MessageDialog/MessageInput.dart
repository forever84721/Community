import 'package:flutter/material.dart';

class MessageInput extends StatefulWidget {
  final Future<bool> Function(String text) send;
  const MessageInput({
    Key key,
    @required this.send,
  }) : super(key: key);

  @override
  _MessageInputState createState() => _MessageInputState();
}

class _MessageInputState extends State<MessageInput> {
  TextEditingController textEditingController;
  @override
  void initState() {
    super.initState();
    textEditingController = new TextEditingController();
  }

  void send() async {
    if (await this.widget.send(textEditingController.text)) {
      textEditingController.text = "";
    }
  }

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
          controller: textEditingController,
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
            // prefixText: ' ',
            // suffixText: 'USD',
            // suffixStyle:
            //     const TextStyle(color: Colors.green)
            suffixIcon: Material(
              child: InkWell(
                onTap: send,
                child: Icon(Icons.send),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
