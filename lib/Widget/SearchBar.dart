import 'package:community/generated/i18n.dart';
import 'package:flutter/material.dart';

class SearchBar extends StatefulWidget implements PreferredSizeWidget {
  final String title;
  final SearchBarVisible visible;
  const SearchBar({Key key, this.title, @required this.visible})
      : super(key: key);
  @override
  _SearchBarState createState() => _SearchBarState(); //foo: this.foo

  @override
  Size get preferredSize {
    return new Size.fromHeight(50.0);
  }
}

class _SearchBarState extends State<SearchBar> {
  Widget appBarTitle;
  Icon actionIcon = new Icon(Icons.search);
  @override
  void initState() {
    super.initState();
    setState(() {
      appBarTitle = new Text(widget.title);
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: this.widget.visible.value ? 1.0 : 0.0,
      duration: Duration(milliseconds: 1000),
      child: AnimatedContainer(
        height: this.widget.visible.value ? 100.0 : 0.0,
        duration: Duration(milliseconds: 1000),
        child: Scaffold(
          appBar: AppBar(
              leading: new IconButton(
                icon: new Icon(Icons.menu),
                onPressed: () => Scaffold.of(context).openDrawer(),
              ),
              centerTitle: true,
              title: appBarTitle,
              actions: <Widget>[
                new IconButton(
                  icon: actionIcon,
                  onPressed: () {
                    setState(() {
                      if (this.actionIcon.icon == Icons.search) {
                        this.actionIcon = new Icon(Icons.close);
                        this.appBarTitle = new TextField(
                          style: new TextStyle(
                            color: Colors.white,
                          ),
                          decoration: new InputDecoration(
                            prefixIcon:
                                new Icon(Icons.search, color: Colors.white),
                            hintText: I18n.of(context).SearchDotDotDot,
                            hintStyle: new TextStyle(color: Colors.white),
                          ),
                        );
                      } else {
                        this.actionIcon = new Icon(Icons.search);
                        this.appBarTitle = new Text(widget.title);
                      }
                    });
                  },
                ),
              ]),
        ),
      ),
    );
  }
}

class SearchBarVisible {
  bool value;
  SearchBarVisible({this.value});
}
