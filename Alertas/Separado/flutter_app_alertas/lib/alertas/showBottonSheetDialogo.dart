import 'package:flutter/material.dart';

Widget showBottonSheetDialogo(BuildContext context,
    String titulo){

  return  new RaisedButton(
      padding: EdgeInsets.symmetric(vertical: 14.0),
      child: new Text(
          titulo,
        style: new TextStyle(color: Colors.white),
      ),
      color: Colors.blueGrey,
      onPressed: () {
        showBottomSheet(
            context: context,
            builder: (BuildContext context) {
              return new Container(
                  padding: EdgeInsets.only(top: 16.0),
                  decoration: const BoxDecoration(
                    border: const Border(
                        top: const BorderSide(color: Colors.black12)),
                  ),
                  child: new ListView(
                    shrinkWrap: true,
                    primary: false,
                    children: <Widget>[
                      new ListTile(
                        dense: true,
                        title: const Text('This is a bottom sheet'),
                      ),
                      new ListTile(
                        dense: true,
                        title: const Text('Click OK to dismiss'),
                      ),
                      ButtonBarTheme(
                        data: ButtonBarThemeData(alignment: MainAxisAlignment.center),
                        // make buttons use the appropriate styles for cards
                        child: new ButtonBar(
                          children: <Widget>[
                            new FlatButton(
                              child: const Text('OK'),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ));
            });
      });


}