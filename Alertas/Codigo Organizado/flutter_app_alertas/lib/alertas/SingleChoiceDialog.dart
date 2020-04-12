import 'package:flutter/material.dart';

int singleItemSelected = 0;

class SingleChoiceDialog extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return SingleChoiceDialogState();
  }

}

class SingleChoiceDialogState extends State<SingleChoiceDialog> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SimpleDialog(
      contentPadding: EdgeInsets.fromLTRB(0.0, 12.0, 0.0, 0.0),
      title: Text("Esto es un titulo"),
      children: <Widget>[
        Column(
          children: <Widget>[
            RadioListTile<int>(
              title: Text("Item 0"),
              value: 0,
              groupValue: singleItemSelected,
              onChanged: (int value) {
                setState(() {
                  singleItemSelected = value;
                });
                Navigator.pop(context, value);
              },
            ),
            RadioListTile<int>(
              title: Text("Item 1"),
              value: 1,
              groupValue: singleItemSelected,
              onChanged: (int value) {
                setState(() {
                  singleItemSelected = value;
                });
                Navigator.pop(context, value);
              },
            ),
            RadioListTile<int>(
              title: Text("Item 2"),
              value: 2,
              groupValue: singleItemSelected,
              onChanged: (int value) {
                setState(() {
                  singleItemSelected = value;
                });
                Navigator.pop(context, value);
              },
            ),
            ItemRadioButton("item 3", 3, context),
          ],
        ),
        ButtonBarTheme(
          data: ButtonBarThemeData(alignment: MainAxisAlignment.end),
          child: ButtonBar(
            children: <Widget>[
              FlatButton(
                onPressed: () {
                  Navigator.pop(context, "Cancelar");
                },
                child: Text("Cancelar"),
              )
            ],
          ),
        )
      ],
    );
  }

  //Metodo  para simplificar la creacion de elementos
  Widget ItemRadioButton(String titulo, int valor, BuildContext context) {
    return RadioListTile<int>(
      title: Text(titulo),
      value: valor,
      groupValue: singleItemSelected,
      onChanged: (int value) {
        setState(() {
          singleItemSelected = value;
        });
        Navigator.pop(context, value);
      },
    );
  }

}