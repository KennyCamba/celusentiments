import 'package:celusentiments/shared/navigator_drawer.dart';
import 'package:celusentiments/views/pages/about_us.dart';
import 'package:celusentiments/views/pages/posts.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _title;
  Widget _widget;

  @override
  initState() {
    _widget = PostList();
    _title = "Posts";
    super.initState();
  }

  _onPageChange(int i, String text) {
    switch (i) {
      case 0:
        setState(() {
          _widget = PostList();
          _title = "Posts";
        });
        break;
      case 1:
        setState(() {
          _widget = AboutUs();
          _title = "About us";
        });
        break;
    }
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
        centerTitle: true,
      ),
      drawer: NavigatorDrawer(
        onMenuTap: _onPageChange,
      ),
      body: _widget,
    );
  }
}
