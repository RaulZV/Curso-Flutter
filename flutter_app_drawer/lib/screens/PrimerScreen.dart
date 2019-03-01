import 'package:flutter/material.dart';

class PrimerScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(title: new Text("Primera Vista"),),
      body: Center(
        child: Text("Descripcion de vista"),
      ),
    );
  }
}