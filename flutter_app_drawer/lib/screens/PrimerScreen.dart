import 'package:flutter/material.dart';


class PrimerScreen extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text("Primera vista"),),
      body: Center(
        child: Text("Contenido primera vista"),
      ),
    );
  }

}