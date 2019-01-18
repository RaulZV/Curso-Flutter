import 'package:flutter/material.dart';
import 'review.dart';

class ReviewLista extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
          new Review("assets/img/viajero1.jpeg", "Alejandra", "1 review de 5 fotos", "Este es un ejemplo de comentario"),
          new Review("assets/img/viajero2.jpg", "Felipe", "1 review de 7 fotos", "Este es un ejemplo de comentario")
      ],
    );
  }

}