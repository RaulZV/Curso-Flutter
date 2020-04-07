import 'package:flutter/material.dart';

class  ReviewWidget  extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
         review("assets/img/viajero1.jpeg", "Alejandra", "1 review de 5 fotos", "Este es un ejemplo de comentario"),
         review("assets/img/viajero2.jpg", "Felipe", "1 review de 7 fotos", "Este es un ejemplo de comentario")
      ],
    );
  }


  Widget review(String pPathImage, String  pNombre,
         String pDetalle, String pComentario){

    final comentarioUsuario = Container(
      margin: EdgeInsets.only(
          left: 20.0
      ),
      child: Text(
        pComentario,
        textAlign: TextAlign.left,
        style: TextStyle(
          fontSize: 13.0,
          fontWeight: FontWeight.w900,
        ),
      ),
    );

    final informacionUsuario = Container(
      margin: EdgeInsets.only(
          left: 20.0
      ),
      child: Text(
        pDetalle,
        textAlign: TextAlign.left,
        style: TextStyle(
            fontSize: 13.0,
            color: Color(0xFFa3a5a7)
        ),
      ),
    );

    final nombreUsuario =  Container(
      margin: EdgeInsets.only(
          left: 20.0
      ),
      child: Text(
        pNombre,
        textAlign: TextAlign.left,
        style: TextStyle(
            fontSize: 17.0
        ),
      ),
    );

    final detalleUsuario =  Column(

      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        nombreUsuario,
        informacionUsuario,
        comentarioUsuario
      ],
    );

    final foto = Container(
      margin: EdgeInsets.only(
          top: 20.0,
          left: 20.0
      ),
      width: 80.0,
      height: 80.0,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(pPathImage)),
      ),
    );


    return  Row(
      children: <Widget>[
        foto,
        detalleUsuario
      ],
    );
  }

}