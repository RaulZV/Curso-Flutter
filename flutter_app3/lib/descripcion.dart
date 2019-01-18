import 'package:flutter/material.dart';
import 'boton_custom.dart';

class Descripcion  extends StatelessWidget{

  String pNombreLugar;
  int pEstrellas;
  String pDescripcionLugar;

  Descripcion(this.pNombreLugar,this.pEstrellas,this.pDescripcionLugar);


  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    final estrellaMitad = Container(
      margin: EdgeInsets.only(
          top: 323.0,
          right: 3.0
      ),
      child: Icon(
        Icons.star_half,
        color: Color(0xFFf2C611),),
    );

    final estrellaBorder = Container(
      margin: EdgeInsets.only(
          top: 323.0,
          right: 3.0
      ),
      child: Icon(
        Icons.star_border,
        color: Color(0xFFf2C611),),
    );

    String descripcionContenido = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.";

    final estrellas = Container(
       margin: EdgeInsets.only(
         top: 323.0,
         right: 3.0
       ),
      child: Icon(
        Icons.star,
        color: Color(0xFFf2C611),),
    );

    final descripcion =  Container(
      margin: new EdgeInsets.only(
        top: 20.0,
        left: 20.0,
        right: 20.0
      ),
      child: new Text(
          pDescripcionLugar,
        style: const TextStyle(
            fontSize: 16.0,
            fontFamily: "Lato",
            fontWeight: FontWeight.bold,
            color: Color(0xFF56575a)
        ),
      ),
    );

    final titulo =  Row(
       children: <Widget>[
         Container(
           margin: EdgeInsets.only(
             top: 320.0,
             left: 20.0,
             right: 20.0
           ),
           child: Text(
             pNombreLugar,
             style: TextStyle(
               fontFamily: "Lato",
               fontSize: 30.0,
               fontWeight: FontWeight.w900
             ),
             textAlign: TextAlign.left,
           ),
         ),
         Row(
           children: <Widget>[
             estrellas,
             estrellas,
             estrellas,
             estrellas,
             estrellaBorder
           ],
         )
       ],
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        titulo,
        descripcion,
        ButtonCustom("Navegar")
      ],
    );
  }

}