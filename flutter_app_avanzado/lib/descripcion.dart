import 'package:flutter/material.dart';
import 'package:flutterappavanzado/librerias/ratingBarCustom.dart';
import 'package:flutterappavanzado/librerias/ButtonCustom.dart';

class Descripcion extends StatelessWidget{

  String pNombreLugar;
  int pEstrellas;
  String pDescripcionLugar;

  Descripcion(this.pNombreLugar, this.pDescripcionLugar,this.pEstrellas);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    final descripcion = Container(
       margin: EdgeInsets.only(
         top: 20.0,
         left: 20.0,
         right: 20.0
       ),
      child: Text(
        pDescripcionLugar,
        style: TextStyle(
          fontSize: 16.0,
          fontWeight: FontWeight.bold,
          color: Color(0xFF56575A)
        ),
      ),
    );

    final titulo =  Row(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(
              top: 340.0,
              left: 20.0,
              right: 20.0
          ),
          child: Text(
            pNombreLugar,
            style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.w900
            ),
            textAlign: TextAlign.left,
          ),
        ),
        RatingBarCustom(numberStart: 5,startCount: 4.7, colorStart: Color(0xFF493f90),)
      ],
    );

    //https://encycolorpedia.com/a52a2a

    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        titulo,
        descripcion,
        ButtonCustom(textoBoton: "Navegar",funcOnTap: (){
          print("Evento onTap");
        })
      ],
    );
  }



}