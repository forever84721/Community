import 'package:community/Widget/ProgressDialog/IProgressDialog.dart';
import 'package:flutter/material.dart';

class ProgressDialog extends StatefulWidget {
  final LoadingStatus loading;
  final IProgressDialog child;
  const ProgressDialog({Key key, this.loading, this.child}) : super(key: key);

  @override
  _ProgressDialogState createState() => _ProgressDialogState();
}

class _ProgressDialogState extends State<ProgressDialog>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    this.widget.child.setLoading = setLoading;
  }

  @override
  void dispose() {
    super.dispose();
  }

  void setLoading(bool tf) {
    setState(() {
      this.widget.loading.value = tf;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> widgetList = [];
    widgetList.add(this.widget.child as Widget);
    if (this.widget.loading.value) {
      widgetList.add(
        Opacity(
          opacity: 0.8,
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

class LoadingStatus {
  bool value = false;
  LoadingStatus(bool value) {
    this.value = value;
  }
}
