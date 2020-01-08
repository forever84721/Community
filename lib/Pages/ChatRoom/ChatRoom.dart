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

class _ChatRoomState extends State<ChatRoom>
    with AutomaticKeepAliveClientMixin {
  static String serverUrl = "http://192.168.20.13:8080/api/chatHub";
  HubConnection hubConnection =
      HubConnectionBuilder().withUrl(serverUrl).build();
  List<ChatViewModel> chatData = [];
  ScrollController _scrollController;
  @override
  void initState() {
    super.initState();
    // this.widget.setLoading(false);
    _scrollController = new ScrollController();
    (() async {
      hubConnection.onclose((error) => print("Connection Closed"));
      await hubConnection.start();
      // final result = await hubConnection.invoke("MethodOneSimpleParameterSimpleReturnValue", args: <Object>["ParameterValue"]);
      hubConnection.on("ServerMessage", _handleAClientProvidedFunction);
      Future.delayed(const Duration(milliseconds: 800),
          () => this.widget.setLoading(false));
      setState(() {
        // for (var i = 0; i < 10; i++) {
        //   chatData.add(new ChatViewModel(
        //       issuerId: i,
        //       name: "name$i",
        //       postTime: DateTime.now().add(Duration(minutes: -i)),
        //       content: "test$i"));
        // }
      });
    })();
  }

  void _handleAClientProvidedFunction(List<Object> parameters) {
    var asd = ChatViewModel.fromJson(parameters[0]); // as Map<String, dynamic>
    setState(() {
      chatData.add(asd);
      if (_scrollController.position.atEdge && _scrollController.offset > 0) {
        Future.delayed(
            const Duration(milliseconds: 100),
            () => _scrollController.animateTo(
                  _scrollController.position.maxScrollExtent,
                  curve: Curves.easeOut,
                  duration: const Duration(milliseconds: 500),
                ));
      }
    });
  }

  Future<bool> send(String text) async {
    print("send:" + text);
    try {
      await hubConnection.invoke("ClientMessage", args: <Object>[
        ChatViewModel(
            issuerId: 0, name: "Flutter", postTime: null, content: text)
      ]);
      return true;
    } catch (e /*,s*/) {
      print(e);
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return SafeArea(
      child: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              // reverse: true,
              controller: _scrollController,
              itemCount: chatData.length,
              itemBuilder: (BuildContext ctxt, int index) => Message(
                  name: chatData[index].name,
                  issuerId: chatData[index].issuerId,
                  postTime: chatData[index].postTime,
                  content: chatData[index].content),
            ),
          ),
          MessageInput(
            send: send,
          )
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
