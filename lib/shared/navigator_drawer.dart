import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class NavigatorDrawer extends StatelessWidget {
  final Function(int, String) onMenuTap;

  const NavigatorDrawer({
    Key key,
    this.onMenuTap
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          MenuHeader(),
          ListTile(
            leading: Icon(Icons.sentiment_very_satisfied),
            title: Text("Posts"),
            onTap: () => this.onMenuTap(0, "Posts"),
          ),
          ListTile(
            leading: Icon(Icons.info),
            title: Text("About us"),
            onTap: () => this.onMenuTap(1, "About us"),
          )
        ],
      ),
    );
  }
}

class MenuHeader extends StatelessWidget {
  const MenuHeader({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return UserAccountsDrawerHeader(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [Colors.cyan, Colors.deepOrangeAccent])),
        currentAccountPicture:
            Image(image: AssetImage("assets/images/logo.png")),
        accountName: Text("Celula Microsoft ESPOL"),
        accountEmail: Text(""));
  }
}
