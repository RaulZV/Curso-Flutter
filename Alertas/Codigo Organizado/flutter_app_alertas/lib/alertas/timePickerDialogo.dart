import 'package:flutter/material.dart';


Widget timePickerDialogo(BuildContext context,
                     TimeOfDay _selectedTime,
                    String  _tituloBoton){
  return RaisedButton(
      padding: EdgeInsets.symmetric(vertical: 14.0),
      child: new Text(
        _tituloBoton,
        style: new TextStyle(color: Colors.white),
      ),
      color: Colors.teal,
      onPressed: () {
        showTimePicker(
          context: context,
          initialTime: _selectedTime,
        ).then((TimeOfDay value) {
          if (value != null) {
            _selectedTime = value;
            Scaffold.of(context).showSnackBar(new SnackBar(
                content: new Text('${value.format(context)}')));
          }
        });
      });
}
