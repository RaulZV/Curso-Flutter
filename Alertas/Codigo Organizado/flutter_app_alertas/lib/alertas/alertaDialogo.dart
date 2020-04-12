import 'package:flutter/material.dart';

class alertaDialogo extends StatefulWidget {



  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return alertaDialogoState();
  }

}

class alertaDialogoState extends State<alertaDialogo> {
  @override
  Widget build(BuildContext context) {

    final ThemeData theme  =  Theme.of(context);

    final  TextStyle dialogTextStyle =
    theme.textTheme.subhead.copyWith(color: theme.textTheme.caption.color);


    // TODO: implement build
    return  AlertDialog(
      title: Text("Texto prueba"),
      content: Text("Este es un contenido",
                    style: dialogTextStyle),
      actions: <Widget>[
        FlatButton(
          onPressed: () {
            Navigator.pop(context,"Cancelar");
          },
          child: Text("Cancelar"),
        ),
        FlatButton(
          onPressed: () {
            Navigator.pop(context,"Aceptar");
          },
          child: Text("Aceptar"),
        )
      ],
    );
  }

}