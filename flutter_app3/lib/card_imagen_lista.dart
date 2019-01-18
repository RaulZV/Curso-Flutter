import 'package:flutter/material.dart';
import 'card_imagen.dart';

class CardImagenLista  extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  Container(
      height: 350.0,
      child: ListView(
        padding:  EdgeInsets.all(25.0),
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          CardImagen("assets/img/lugares/lugar1.jpg"),
          CardImagen("assets/img/lugares/lugar2.jpg"),
          CardImagen("assets/img/lugares/lugar3.jpg"),
          CardImagen("assets/img/lugares/lugar4.jpg"),
          CardImagen("assets/img/lugares/lugar5.jpg"),
          CardImagen("assets/img/lugares/lugar6.jpeg")
        ],
      ),
    );
  }


}