import 'package:flutter/material.dart';

Widget modalBottomSheetDialog(BuildContext context , String tituloboton){

  return new RaisedButton(
      padding: EdgeInsets.symmetric(vertical: 14.0),
      child: new Text(
        tituloboton,
        style: new TextStyle(color: Colors.white),
      ),
      color: Colors.orange,
      onPressed: () {


        showModalBottomSheet<void>(
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
                        title: const Text('This is a modal bottom sheet'),
                      ),
                      new ListTile(
                        dense: true,
                        title: const Text('Click anywhete to dismiss'),
                      ),
                      ButtonBarTheme(
                          data: ButtonBarThemeData(alignment: MainAxisAlignment.start),
                          child: new ButtonBar(
                            children: <Widget>[
                              new FlatButton(
                                child: const Text('OK'),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                              ),
                            ],
                          )
                      )
                    ],
                  ));
            });
      });

}