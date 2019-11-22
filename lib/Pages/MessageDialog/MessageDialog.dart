// library slide_popup_dialog;

import 'package:community/Api/Api.dart';
import 'package:community/Models/RequestModels.dart';
import 'package:community/Models/ResponseModels.dart';
import 'package:community/Pages/MessageDialog/Message.dart';
import 'package:community/Pages/MessageDialog/MessageDialogGesture.dart';
import 'package:community/Pages/MessageDialog/MessageInput.dart';
import 'package:community/Widget/ProgressDialog/ProgressOutControl.dart';
import 'package:flutter/material.dart';

/// Display slide dialog.
///
/// `barrierColor` Color of outside dialog. Defaults to Colors.black.withOpacity(0.7).
///
/// `barrierDismissible` Can be dismissed by tapping outside dialog. Defaults to true.
///
/// `transitionDuration` Duration of slide transition. Defaults to Duration(milliseconds: 300).
///
/// `backgroundColor` Color of dialog background. Defaults to Theme.of(context).canvasColor.
Future<T> showMessageDialog<T>({
  @required BuildContext context,
  @required int postId,
  bool barrierDismissible = true,
  Duration transitionDuration = const Duration(milliseconds: 400),
  Color backgroundColor,
}) {
  assert(context != null);
  assert(postId != null);

  return showGeneralDialog(
    context: context,
    // ignore: missing_return
    pageBuilder: (context, animation1, animation2) {},
    barrierColor: Colors.black.withOpacity(0.5),
    barrierDismissible: barrierDismissible,
    barrierLabel: "Dismiss",
    transitionDuration: transitionDuration,
    transitionBuilder: (context, animation1, animation2, widget) {
      final curvedValue = Curves.easeInOut.transform(animation1.value) - 1.0;
      return Transform(
        transform: Matrix4.translationValues(0.0, curvedValue * -500, 0.0),
        child: Opacity(
          opacity: animation1.value,
          child: MessageDialog(postId: postId),
        ),
      );
    },
  );
}

class MessageDialog extends StatefulWidget {
  final int postId;

  const MessageDialog({Key key, this.postId}) : super(key: key);
  @override
  _MessageDialogState createState() => _MessageDialogState();
}

class _MessageDialogState extends State<MessageDialog> {
  var _initialPosition = 0.0;
  var _currentPosition = 0.0;
  var initLoading = true;
  var close = false;
  List<ReplyViewModel> replyData = [];

  @override
  void initState() {
    super.initState();
    (() async {
      var res = await Api.getReply(
          new GetReplyRequestModel(postId: this.widget.postId, page: 1));
      var ss = setState;
      setState(() {
        replyData = res.success ? res.data : [];
        // initLoading = a;
        Future.delayed(
            const Duration(milliseconds: 500),
            () => ss(() {
                  initLoading = false;
                }));
      });
    })();
  }

  void _onVerticalDragStart(DragStartDetails drag) {
    setState(() {
      _initialPosition = drag.globalPosition.dy;
    });
  }

  void _onVerticalDragUpdate(DragUpdateDetails drag) {
    setState(() {
      final temp = _currentPosition;
      _currentPosition = drag.globalPosition.dy - _initialPosition;
      if (_currentPosition < 0) {
        _currentPosition = temp;
      }
    });
  }

  void _onVerticalDragEnd(DragEndDetails drag) {
    if (_currentPosition > 100.0) {
      // Future.delayed(
      //     const Duration(seconds: 100), () => Navigator.pop(context));
      if (!close) {
        close = true;
        Navigator.pop(context);
      }
      return;
    }
    setState(() {
      _currentPosition = 0.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    final deviceHeight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: AnimatedPadding(
        padding: MediaQuery.of(context).viewInsets +
            EdgeInsets.only(top: _currentPosition),
        duration: Duration(milliseconds: 0),
        curve: Curves.decelerate,
        child: MediaQuery.removeViewInsets(
          removeLeft: true,
          removeTop: true,
          removeRight: true,
          removeBottom: true,
          context: context,
          child: Center(
            child: Container(
              width: deviceWidth,
              height: deviceHeight,
              child: Material(
                color: Theme.of(context).dialogBackgroundColor,
                elevation: 24.0,
                type: MaterialType.card,
                child: Column(
                  children: <Widget>[
                    MessageDialogGesture(
                      pillColor: Colors.red,
                      onVerticalDragStart: _onVerticalDragStart,
                      onVerticalDragEnd: _onVerticalDragEnd,
                      onVerticalDragUpdate: _onVerticalDragUpdate,
                    ),
                    Expanded(
                      child: ProgressOutControl(
                        isLoading: initLoading,
                        child: ListView(
                            reverse: true,
                            padding: const EdgeInsets.all(0.0),
                            // controller: _controller,
                            children: replyData.map((reply) {
                              return Message(
                                replyViewModel: reply,
                              );
                            }).toList()
                            // ..add(Message(name: "Jay", text: "123456789")),
                            ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(0),
                      decoration: new BoxDecoration(
                        border: Border(
                          top: BorderSide(
                            color: Colors.grey,
                            width: 1.0,
                          ),
                        ),
                      ),
                      child: MessageInput(),
                    ),
                  ],
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15.0),
                    topRight: Radius.circular(15.0),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
