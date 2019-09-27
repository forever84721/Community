import 'package:community/Pages/PostBrowsing.dart';
import 'package:community/Widget/GeneralDrawer.dart';
import 'package:community/Widget/SearchBar.dart';
import 'package:community/generated/i18n.dart';
import 'package:flutter/material.dart';

class Index extends StatefulWidget {
  @override
  _IndexState createState() => _IndexState();
}

class _IndexState extends State<Index> {
  bool init = false;
  // bool isVisible = true;
  double bottomNavigationBarHeight = 60;
  int oldIndex = 0;
  int _currentIndex = 0;
  List<Widget> pages = List<Widget>();
  List<NavigationBarInfo> navigationBars = [];
  PageController pageController = PageController(
    initialPage: 0,
    keepPage: true,
  );

  @override
  void initState() {
    super.initState();

    pages.add(PostBrowsing(notifyParent: refresh));
    pages.add(PostBrowsing(notifyParent: refresh));
    pages.add(PostBrowsing(notifyParent: refresh));
  }

  void pageChanged(int index) {
    setState(() {
      _currentIndex = index;
      if ((oldIndex - index).abs() == 1) {
        pageController.animateToPage(index,
            duration: Duration(milliseconds: 500), curve: Curves.ease);
      } else {
        pageController.jumpToPage(index);
      }
      oldIndex = index;
    });
  }

  refresh(double h) {
    setState(() {
      bottomNavigationBarHeight = h;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (!init) {
      //I18n.of(context).Post
      navigationBars.add(
          NavigationBarInfo("", Icon(Icons.picture_in_picture), Colors.blue));
      navigationBars.add(NavigationBarInfo(
          "", Icon(Icons.picture_in_picture_alt), Colors.blue));
      navigationBars
          .add(NavigationBarInfo("", Icon(Icons.picture_as_pdf), Colors.blue));
      init = true;
    }
    return Scaffold(
      drawer: GeneralDrawer(),
      appBar: SearchBar(title: I18n.of(context).Post),
      bottomNavigationBar: AnimatedContainer(
        duration: Duration(milliseconds: 500),
        height: bottomNavigationBarHeight,
        decoration: new BoxDecoration(
          border: Border(
            top: BorderSide(
              color: Colors.grey,
              width: 1.0,
            ),
          ),
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: navigationBars.map((item) {
            return BottomNavigationBarItem(
              icon: item.icon,
              title: Text(
                item.title,
                style: TextStyle(color: item.color),
              ),
            );
          }).toList(),
          currentIndex: _currentIndex,
          onTap: (int index) {
            pageChanged(index);
          },
        ),
      ),
      body: PageView(
        controller: pageController,
        onPageChanged: (
          index,
        ) {
          pageChanged(index);
        },
        children: pages,
      ),
    );
  }
}

class NavigationBarInfo {
  NavigationBarInfo(String title, Icon icon, Color color) {
    this.title = title;
    this.icon = icon;
    this.color = color;
  }
  String title;
  Icon icon;
  Color color;
}
