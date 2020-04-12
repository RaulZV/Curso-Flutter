import 'package:flutter/material.dart';

Widget datePickerDialog(BuildContext context,
     String  _tituloboton){

  return RaisedButton(
      padding: EdgeInsets.symmetric(vertical: 14.0),
      child: new Text(
        _tituloboton,
        style: new TextStyle(color: Colors.white),
      ),
      color: Colors.green,
      onPressed: () {
        showDatePicker(
          context: context,
          initialDate: new DateTime.now(),
          firstDate: new DateTime(1970),
          lastDate: new DateTime(2500),
        ).then((DateTime value) {
          if (value != null) {
            Scaffold.of(context).showSnackBar(
                new SnackBar(content: new Text('${value}')));
          }
        });
      });
}


