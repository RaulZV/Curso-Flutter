import 'package:flutter/material.dart';

class MultiChoiceDialog extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new MultiChoiceDialogState();
  }
}

class MultiChoiceDialogState extends State<MultiChoiceDialog> {

  List<bool> checkboxSelected = <bool>[false,false,false,true];

  @override
  Widget build(BuildContext context) {
    return new SimpleDialog(
      contentPadding: EdgeInsets.fromLTRB(8.0, 12.0, 8.0, 0.0),
      title: new Text('This Is Title'),
      children: <Widget>[
        new Column(
          children: <Widget>[
            new CheckboxListTile(
              title: const Text('item 0'),
              value: checkboxSelected[0],
              onChanged: (bool value) {
                setState(() {
                  checkboxSelected[0] = value;
                });
              },
            ),
            new CheckboxListTile(
                title: const Text('item 1'),
                value: checkboxSelected[1],
                onChanged: (bool value) {
                  setState(() {
                    checkboxSelected[1] = value;
                  });
                }),
            new CheckboxListTile(
                title: const Text('item 2'),
                value: checkboxSelected[2],
                onChanged: (bool value) {
                  setState(() {
                    checkboxSelected[2] = value;
                  });
                }),
            new CheckboxListTile(
                title: const Text('item 3'),
                value: checkboxSelected[3],
                onChanged: (bool value) {
                  setState(() {
                    checkboxSelected[3] = value;
                  });
                }),
          ],
        ),
        ButtonBarTheme(
          data: ButtonBarThemeData(alignment: MainAxisAlignment.end),
          child: new ButtonBar(
            children: <Widget>[
              new FlatButton(
                  onPressed: () {
                    Navigator.pop(context, 'OK');
                  },
                  child: const Text('OK')),
            ],
          ),
        ),
      ],
    );
  }
}
