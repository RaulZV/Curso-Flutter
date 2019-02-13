import 'package:flutter/material.dart';
import 'package:flutter_app_drawer/componentes/navigationDrawer.dart';

class SegundoScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(title: new Text("Segunda Vista"),),
      //drawer: NavigationDrawer(),
      body: Center(
        child: Text("Descripcion de vista"),
      ),
    );
  }
}