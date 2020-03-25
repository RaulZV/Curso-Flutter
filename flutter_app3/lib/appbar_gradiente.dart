import 'package:flutter/material.dart';


class AppBarGradiente extends StatelessWidget {

  String titulo = "Aplicación";

  AppBarGradiente(this.titulo);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Container(
      height: 250.0,
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          Color(0xFF4268D3),
          Color(0xFF584CD1)
        ],
        begin: FractionalOffset(0.2, 0.0),
          end: FractionalOffset(1.0, 0.6),
          stops: [0.0,0.6],
          tileMode: TileMode.clamp

        )
      ),
      child: Text(
        titulo,
        style: TextStyle(
          color: Colors.white,
          fontSize: 30.0,
          fontFamily: "lato",
          fontWeight: FontWeight.bold
        ),
      ),
       alignment: Alignment(0.0, -0.6),
    );
  }

}