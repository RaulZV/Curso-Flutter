import 'package:flutter/material.dart';

import 'package:flutter_app_drawer/screens/PrimerScreen.dart';
import 'package:flutter_app_drawer/screens/SegundoScreen.dart';

class NavigationDrawer extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _NavigationDrawer();
  }
}

class _NavigationDrawer extends State<NavigationDrawer> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text("Aplicacion Drawer"),
            accountEmail: Text("felipe@gmail.com"),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.white,
              child: FlutterLogo(size: 42.0),
            ),
          ),
          Ink(
            color: Colors.blue,
            child: ListTile(
              leading: Icon(Icons.home, color: Colors.white),
              title: Text(
                "Item 1 ",
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => PrimerScreen()));
              },
            ),
          ),
          ListTile(
            title: Text(
              "Item 2 ",
            ),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => SegundaScreen()));
            },
          ),
          ListTile(
            title: Text(
              "Item 3 ",
            ),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => PrimerScreen()));
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.info),
            title: Text(
              "Item 2 ",
            ),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => SegundaScreen()));
            },
          )
        ],
      ),
    );
  }
}
