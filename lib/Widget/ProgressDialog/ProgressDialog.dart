import 'package:community/Pages/Login.dart';
import 'package:flutter/material.dart';

// class ProgressDialog extends StatelessWidget {
//   final bool loading;
//   final Widget child;
//   void setLoading(bool tf){
//     setsta
//   }
//   ProgressDialog({Key key, this.loading, this.child}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     List<Widget> widgetList = [];
//     (widgetList as Login).progressDialog = this;
//     widgetList.add(child);
//     if (loading) {
//       widgetList.add(
//         Opacity(
//           opacity: 0.8,
//           child: ModalBarrier(
//             color: Colors.black87,
//           ),
//         ),
//       );
//       widgetList.add(
//         Center(
//           child: CircularProgressIndicator(),
//         ),
//       );
//     }
//     return Stack(
//       children: widgetList,
//     );
//   }
// }

class ProgressDialog extends StatefulWidget {
  final LoadingStatus loading;
  final Widget child;

  const ProgressDialog({Key key, this.loading, this.child}) : super(key: key);

  @override
  _ProgressDialogState createState() => _ProgressDialogState();
}

class _ProgressDialogState extends State<ProgressDialog>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  void setLoading(bool tf) {
    setState(() {
      this.widget.loading.value = tf;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> widgetList = [];
    (this.widget.child as Login).notifyParent = setLoading;
    widgetList.add(this.widget.child);
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
