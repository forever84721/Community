import 'package:flutter/material.dart';

class ProgressOutControl extends StatelessWidget {
  final Widget child;
  final bool isLoading;
  const ProgressOutControl(
      {Key key, @required this.child, @required this.isLoading})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    List<Widget> widgetList = [];
    widgetList.add(child);
    if (this.isLoading) {
      widgetList.add(
        Opacity(
          opacity: 0.3,
          child: ModalBarrier(
            color: Colors.black87,
          ),
        ),
      );
      widgetList.add(
        Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
    return Stack(
      children: widgetList,
    );
  }
}
