import 'package:flutter/material.dart';
import 'package:flutter_app_navegacion/modelo/Persona.dart';
import 'package:flutter_app_navegacion/screens/SegundaScreen.dart';


class DetallePersonaScreen extends StatelessWidget {

  final Persona objPersona;

  DetallePersonaScreen({Key key, @required this.objPersona}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("${objPersona.nombre}"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Container(
          child: Column(
            children: <Widget>[
              Text("${objPersona.descripcion}"),
              RaisedButton(
                child: Text("Siguiente"),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder:
                          (context) => SegundaScreen(objPersona.nombre)));
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}