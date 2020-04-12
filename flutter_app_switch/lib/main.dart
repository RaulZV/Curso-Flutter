import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Switch'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  //Propiedades
  bool isSwitched = false;
  String estado = "Habilitado";
  bool enabledTextField  = false;

  //Metodos
  void estadoSwitch(bool valor){
    estado  =  (valor==true)?"Habilitado":"Deshabilitado";
    enabledTextField  =  valor;
  }

  //metodo en cargado de construir la vista
  //Build
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body:  Stack(
        children: <Widget>[
          ListView(
            children: <Widget>[
              Center(
                child: Switch(
                  value: isSwitched,
                  onChanged: (value){
                    setState(() {
                      isSwitched = value;
                      print(isSwitched);
                      estadoSwitch(value);
                    });
                  },
                  activeColor: Colors.green,
                  activeTrackColor: Colors.lightGreenAccent,
                ),
              ),
              Center(
                child: Text("Esta ${estado}"),
              ),
              Center(
                child: Container(
                  width: 300.0,
                  child: TextField(
                    enabled: enabledTextField,
                    decoration: InputDecoration(
                      hintText: 'Captura  un texto',
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      )
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
