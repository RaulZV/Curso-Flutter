import 'package:flutter/material.dart';
import 'appbar_gradiente.dart';
import 'card_imagen_lista.dart';

class HeaderAppBar extends StatelessWidget{


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Stack(
      children: <Widget>[
        AppBarGradiente("Bienvenido"),
        CardImagenLista()
      ],
    );
  }


}