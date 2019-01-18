import 'package:flutter/material.dart';

class FloatingActionButtonLugar extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _FloatingActionButtonLugar();
  }


}


class _FloatingActionButtonLugar extends State<FloatingActionButtonLugar>{

  void onPressedFav(){
    Scaffold.of(context).showSnackBar(SnackBar(
        content: Text("Agregaste a tus favoritos")
    )
    );
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return FloatingActionButton(
      backgroundColor: Color(0xFF11DA53),
      mini: true,
      tooltip: "Fav",
      onPressed: onPressedFav,
      child:  Icon(
        Icons.favorite_border
      ),
    );
  }

}