import 'package:flutter/material.dart';
import 'package:giffy_dialog/giffy_dialog.dart';


Widget alertaLibreria(BuildContext context, String  tituloBoton){

  return RaisedButton(
    padding: EdgeInsets.symmetric(vertical: 16.0),
    child: Text(tituloBoton,
      style: TextStyle(
          color: Colors.white
      ),
    ),
    color: Colors.red,
    onPressed: () {
      showDialog(
          context: context,
          builder: (objeto) =>
              NetworkGiffyDialog(
                entryAnimation: EntryAnimation.BOTTOM,
                image: Image.network(
                  "https://raw.githubusercontent.com/Shashank02051997/FancyGifDialog-Android/master/GIF's/gif14.gif",
                  fit: BoxFit.fill,
                ),
                title: Text("Imagen internet",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 22.0,
                      fontWeight: FontWeight.w600
                  ),
                ),
                description: Text("Esto es uan descripción larga ... ",
                    textAlign: TextAlign.center
                ),
                onOkButtonPressed: (){},
              )
      );
    },
  );
}