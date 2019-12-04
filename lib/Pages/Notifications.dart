import 'package:community/Widget/ProgressDialog/IProgressDialog.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Notifications extends StatefulWidget with IProgressDialog {
  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  void initState() {
    super.initState();
    // this.widget.setLoading(false);
    (() async {
      Future.delayed(
          const Duration(seconds: 1), () => this.widget.setLoading(false));
    })();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("456"),
    );
  }
}
