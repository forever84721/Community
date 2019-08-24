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
    // print(Util.context);
    // print("123");
    pages.add(PostBrowsing());
    pages.add(PostBrowsing());
    pages.add(PostBrowsing());
  }

  void pageChanged(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  void bottomTapped(int index) {
    setState(() {
      _currentIndex = index;
      pageController.animateToPage(index,
          duration: Duration(milliseconds: 500), curve: Curves.ease);
    });
  }

  @override
  Widget build(BuildContext context) {
    if (!init) {
      navigationBars.add(NavigationBarInfo(
          I18n.of(context).Post, Icon(Icons.picture_in_picture), Colors.blue));
      navigationBars.add(
          NavigationBarInfo("", Icon(Icons.picture_in_picture), Colors.blue));
      navigationBars.add(
          NavigationBarInfo("", Icon(Icons.picture_in_picture), Colors.blue));
      init = true;
    }
    return Scaffold(
      drawer: GeneralDrawer(),
      appBar: SearchBar(title: I18n.of(context).Post),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
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
          setState(() {
            _currentIndex = index;
          });
        },
      ),
      body: PageView(
        controller: pageController,
        onPageChanged: (index) {
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
