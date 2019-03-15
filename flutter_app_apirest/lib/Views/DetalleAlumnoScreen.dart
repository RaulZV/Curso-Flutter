import 'package:flutter/material.dart';
import 'package:flutter_app_apirest/Model/Alumno.dart';

class DetalleAlumno extends StatelessWidget{

  final Alumno alumno;

  DetalleAlumno(this.alumno);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(alumno.nombre),
      ),
    );
  }

}
