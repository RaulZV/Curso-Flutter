import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //var _numero1;
  //var _numero2;
  String resultadoOp = "";

  final TextEditingController _numero1controller = new TextEditingController();
  final TextEditingController _numero2controller = new TextEditingController();

  void _incrementCounter() {
    setState(() {
      // _counter++;
    });
  }

  void fabPressed() {

    var num1 = int.tryParse(_numero1controller.text);
    var num2 = int.tryParse(_numero2controller.text);

    var resultado  =  num1 +  num2;

    _showDialog("Resultado","El resultado de la suma es : $resultado");

    setState(() {
      resultadoOp = "El resultado de la suma es : $resultado";
    });


    print("El resultado de la suma es : $resultado");

  }

  void _showDialog(String titulo, String contenido) {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text(titulo),
          content: new Text(contenido),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("Cerrar"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }


    @override
    Widget build(BuildContext context) {
      return new Scaffold(
        appBar: new AppBar(
          title: new Text('App Name'),
        ),
        body:
        new Container(
          child:
          new Center(
            child:
            new Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: new TextField(
                      controller: _numero1controller,
                      decoration: InputDecoration(
                        labelText: "Numero 1"
                        //hintText: "Numero 1"
                      ),
                      keyboardType: TextInputType.number,
                      style: new TextStyle(fontSize:14.0,
                          color: const Color(0xFF000000),
                          fontWeight: FontWeight.w200,
                          fontFamily: "Roboto"),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: new TextField(
                      controller: _numero2controller,
                      decoration: InputDecoration(
                          labelText: "Numero 2"
                        //hintText: "Numero 1"
                      ),
                      keyboardType: TextInputType.number,
                      style: new TextStyle(fontSize:14.0,
                          color: const Color(0xFF000000),
                          fontWeight: FontWeight.w200,
                          fontFamily: "Roboto"),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: new Text(
                      "$resultadoOp",
                      style: new TextStyle(fontSize:14.0,
                          color: const Color(0xFF000000),
                          fontWeight: FontWeight.w200,
                          fontFamily: "Roboto"),
                    ),
                  ),
                ]
            ),

          ),

          padding: const EdgeInsets.fromLTRB(5.0, 10.0, 5.0, 5.0),
          alignment: Alignment.center,
        ),

        floatingActionButton: new FloatingActionButton(
            child: new Icon(Icons.add),
            onPressed: fabPressed),
      );
    }
  }

