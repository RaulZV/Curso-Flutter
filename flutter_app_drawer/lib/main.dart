import 'package:flutter/material.dart';
import 'package:flutter_app_drawer/componentes/navigationDrawer.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(title: Text("Drawer")),
        drawer: NavigationDrawer(),
        body: Center(
          child: Text("Bienvenido"),
        ),
      )
    );
  }
}


