import 'package:flutter/material.dart';

class SegundaScreen  extends StatelessWidget{

  String titulo;

  SegundaScreen(this.titulo);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Segunda pantalla  $titulo"),
      ),
      body: Center(
        child: RaisedButton(
          child: Text("Regresar"),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
      ),
    );
  }

}