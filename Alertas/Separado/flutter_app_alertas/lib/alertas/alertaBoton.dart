import 'package:flutter/material.dart';


Widget alertaBoton(BuildContext context,
                        Color _color,
                        String _tituloBoton,
                        Widget _contenidoAlerta){

  return  RaisedButton(
    padding: EdgeInsets.symmetric(vertical: 14.0),
    child: Text(_tituloBoton,
      style: TextStyle(
          color: Colors.white
      ),
    ),
    color: _color, //Colors.purple,
    onPressed: () {

      showDialog(
          context: context,
          child: _contenidoAlerta
      ).then((onValue) {
        if(onValue != null){
          Scaffold.of(context).showSnackBar(SnackBar(
            content: Text('$onValue'),
          ));
        }
      });
    },
  );
}