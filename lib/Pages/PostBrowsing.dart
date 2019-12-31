import 'dart:async';
import 'dart:collection';

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
  final void Function(double h) notifyParent;
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
  bool isLoading = false;
  bool noMoreData = false;
  int courentPage = 1;
  HashSet<int> postIdSet;
  // double deltaH = 0;
  _scrollListener() {
    if (scrollcontroller.position.atEdge && scrollcontroller.offset > 0) {
      print('bottom!');
      if (!isLoading && !noMoreData) {
        isLoading = true;
        courentPage++;
        (() async {
          var res = await Api.getRandomPost(courentPage);
          await Future.delayed(const Duration(seconds: 1));
          if (res.success && res.data.length > 0) {
            setState(() {
              data.removeLast();
              data.addAll(res.data.where((a) => !postIdSet.contains(a.postId)));
              data.add(new PostViewModel(
                postId: -1,
              ));
            });
          } else {
            noMoreData = true;
            setState(() {
              data.removeLast();
              data.add(new PostViewModel(postId: -2));
            });
          }
          isLoading = false;
          // Future.delayed(
          //     const Duration(milliseconds: 100), () => isLoading = false);
        })();
      }
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

  void refresh() {
    var scrollTask = scrollcontroller.animateTo(
      0.0,
      curve: Curves.easeOut,
      duration: const Duration(milliseconds: 600),
    );
    init(scrollTask: scrollTask);
  }

  @override
  void initState() {
    super.initState();
    postIdSet = new HashSet();
    scrollcontroller = ScrollController();
    scrollcontroller.addListener(_scrollListener);
    init();
  }

// ignore: avoid_init_to_null
  Future init({Future<void> scrollTask = null}) async {
    noMoreData = false;
    courentPage = 1;
    var res = await Api.getRandomPost(courentPage);
    if (scrollTask != null) {
      await scrollTask;
    }
    setState(() {
      data = res.success ? res.data : [];
    });
    data.add(new PostViewModel(postId: -1));
    postIdSet.addAll(data.map((a) => a.postId));
    await Future.delayed(
        const Duration(milliseconds: 500), () => this.widget.setLoading(false));
    // await (() async {
    //   var res = await Api.getRandomPost(courentPage);
    //   if (scrollTask != null) {
    //     await scrollTask;
    //   }
    //   setState(() {
    //     data = res.success ? res.data : [];
    //   });
    //   data.add(new PostViewModel(postId: -1));
    //   postIdSet.addAll(data.map((a) => a.postId));
    //   await Future.delayed(const Duration(milliseconds: 500),
    //       () => this.widget.setLoading(false));
    // })();
    return;
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
      body: RefreshIndicator(
        child: ListView(
          physics: const AlwaysScrollableScrollPhysics(),
          padding: EdgeInsets.only(bottom: 0),
          controller: scrollcontroller,
          children: data.map((item) {
            return Post(
              postData: item,
              openMessageDialog: openMessageDialog,
              refresh: refresh,
            );
          }).toList(),
        ),
        onRefresh: init,
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
