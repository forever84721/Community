import 'package:flutter/material.dart';

import 'DrawerItem.dart';

class GeneralDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: Column(
          children: <Widget>[
            DrawerItem(1, '列表1'),
            DrawerItem(2, '列表2'),
            DrawerItem(3, '列表3'),
            DrawerItem(4, '列表4'),
            DrawerItem(5, '列表5'),
          ],
        ),
      ),
    );
  }
}
