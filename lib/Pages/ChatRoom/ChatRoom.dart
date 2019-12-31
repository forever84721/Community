// import 'package:flutter/cupertino.dart';
import 'package:community/Models/ResponseModels.dart';
import 'package:community/Pages/MessageDialog/Message.dart';
import 'package:community/Pages/MessageDialog/MessageInput.dart';
import 'package:community/Widget/ProgressDialog/IProgressDialog.dart';
import 'package:flutter/material.dart';
import 'package:signalr_client/signalr_client.dart';

// ignore: must_be_immutable
class ChatRoom extends StatefulWidget with IProgressDialog {
  final void Function(double h) notifyParent;
  ChatRoom({Key key, this.notifyParent}) : super(key: key);
  @override
  _ChatRoomState createState() => _ChatRoomState();
}

class _ChatRoomState extends State<ChatRoom> {
  // The location of the SignalR Server.
  static String serverUrl = "http://192.168.20.13:8080/api/chatHub";
// Creates the connection by using the HubConnectionBuilder.
  // final hubConnection = HubConnectionBuilder().withUrl(serverUrl).build();
// When the connection is closed, print out a message to the console.
// final hubConnection.onclose( (error) => print("Connection Closed"));
  List<ChatViewModel> chatData = [];
  @override
  void initState() {
    super.initState();
    // this.widget.setLoading(false);

    (() async {
      var hubConnection = HubConnectionBuilder().withUrl(serverUrl).build();
      await hubConnection.start();
      // final result = await hubConnection.invoke("MethodOneSimpleParameterSimpleReturnValue", args: <Object>["ParameterValue"]);
      hubConnection.on("ServerMessage", _handleAClientProvidedFunction);

      Future.delayed(const Duration(milliseconds: 800),
          () => this.widget.setLoading(false));
      setState(() {
        for (var i = 0; i < 10; i++) {
          chatData.add(new ChatViewModel(
              issuerId: i,
              name: "name$i",
              postTime: DateTime.now().add(Duration(minutes: -i)),
              content: "test$i"));
        }
      });
    })();
  }

  void _handleAClientProvidedFunction(List<Object> parameters) {
    print(parameters);
    setState(() {
      chatData.add(new ChatViewModel(
          issuerId: 123,
          name: parameters[0],
          postTime: DateTime.now(),
          content: parameters[0]));
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              // reverse: true,
              itemCount: chatData.length,
              itemBuilder: (BuildContext ctxt, int index) => Message(
                  name: chatData[index].name,
                  issuerId: chatData[index].issuerId,
                  postTime: chatData[index].postTime,
                  content: chatData[index].content),
            ),
          ),
          MessageInput(
            send: null,
          )
        ],
      ),
    );
  }
}
