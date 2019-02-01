import 'package:flutter/material.dart';

class SegundoScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(title: new Text("Segunda Vista"),),
      body: Center(
        child: Text("Descripcion de vista"),
      ),
    );
  }
}