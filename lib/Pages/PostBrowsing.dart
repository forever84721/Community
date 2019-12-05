import 'dart:async';

import 'package:community/Api/Api.dart';
import 'package:community/Models/ResponseModels.dart';
import 'package:community/Pages/MessageDialog/MessageDialog.dart';
import 'package:community/Widget/GeneralDrawer.dart';
import 'package:community/Widget/Post.dart';
import 'package:community/Widget/ProgressDialog/IProgressDialog.dart';
import 'package:community/Widget/SearchBar.dart';
import 'package:community/generated/i18n.dart';
import 'package:flutter/material.dart';
// import 'package:slide_popup_dialog/slide_popup_dialog.dart' as slideDialog;

// ignore: must_be_immutable
class PostBrowsing extends StatefulWidget with IProgressDialog {
  final Function(double h) notifyParent;
  PostBrowsing({Key key, this.notifyParent}) : super(key: key);
  @override
  _PostBrowsingState createState() => _PostBrowsingState();
}

class _PostBrowsingState extends State<PostBrowsing>
    with AutomaticKeepAliveClientMixin {
  List<PostViewModel> data = [];
  double oldOffset = 0;
  ScrollController scrollcontroller;
  bool delay = false;
  bool showAppBar = true;
  bool bottomdelay = false;
  int delayms = 500;
  // double deltaH = 0;
  _scrollListener() {
    if (scrollcontroller.position.atEdge && scrollcontroller.offset > 0) {
      bottomdelay = true;
      Timer(Duration(milliseconds: 3000), () {
        bottomdelay = false;
      });
    }
    if (!delay && !bottomdelay) {
      var deltaH = oldOffset - scrollcontroller.offset;
      if (deltaH < 0) {
        deltaH = 0;
      } else if (deltaH > 0) {
        deltaH = 60;
      }
      delay = true;
      // print(scrollcontroller.offset);
      // print(scrollcontroller.initialScrollOffset);

      oldOffset = scrollcontroller.offset;
      setState(() {
        showAppBar = deltaH != 0;
        widget.notifyParent(deltaH);
      });
      Timer(Duration(milliseconds: 500), () {
        delay = false;
      });
    }
  }

  void openMessageDialog(int postId) {
    print('openMessageDialog$postId');
    showMessageDialog(
      context: context,
      postId: postId,
      backgroundColor: Colors.black,
    );
  }

  @override
  void initState() {
    super.initState();
    scrollcontroller = ScrollController();
    scrollcontroller.addListener(_scrollListener);
    (() async {
      var res = await Api.getRandomPost();
      setState(() {
        data = res.success ? res.data : [];
      });
      Future.delayed(
          const Duration(seconds: 1), () => this.widget.setLoading(false));
    })();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      drawer: GeneralDrawer(),
      appBar: SearchBar(
        title: I18n.of(context).Post,
        visible: SearchBarVisible(value: showAppBar),
      ),
      backgroundColor: Colors.grey,
      body: ListView(
        padding: EdgeInsets.only(bottom: 0),
        controller: scrollcontroller,
        children: data.map((item) {
          return Post(postData: item, openMessageDialog: openMessageDialog);
        }).toList(),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
