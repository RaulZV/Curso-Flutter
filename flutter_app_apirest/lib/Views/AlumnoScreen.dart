import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:progress_hud/progress_hud.dart';
import 'package:flutter_app_apirest/Model/Alumno.dart';

import 'package:flutter_app_apirest/Views/DetalleAlumnoScreen.dart';

class AlumnoPage extends StatefulWidget {

  AlumnoPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyAlumnoPageState createState() => _MyAlumnoPageState();
}

class _MyAlumnoPageState extends State<AlumnoPage> {

  Future<List<Alumno>> _getDatosAlumno() async {

    var data = await http.get("http://172.18.3.221:3000/alumnos/getDatosAlumnos");

    var jsonData = json.decode(data.body);

    List<Alumno> alumnos = [];

    for(var a in jsonData){

      Alumno alumno = Alumno(a["id"], a["nombre"], a["apellido"], a["edad"], a["imagen"]);

      alumnos.add(alumno);

    }

    print(alumnos.length);

    return alumnos;
  }

  //Libreria de progreso
  ProgressHUD _progressHUD;
  bool _loading = true;

  int _counter = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _progressHUD = new ProgressHUD(
      backgroundColor: Colors.black12,
      color: Colors.white,
      containerColor: Colors.blue,
      borderRadius: 5.0,
      text: 'Cargando',
      loading: true,
    );



  }


  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }



  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Container(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: FutureBuilder(
          future: _getDatosAlumno(),
          builder: (BuildContext context, AsyncSnapshot snapshot){


            if(snapshot.data ==  null){
              return Container(
                child: Center(
                  child: _progressHUD //CircularProgressIndicator(),  //Text("Cargando..."),
                ),
              );
            }

            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index){

                return ListTile(

                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(
                       snapshot.data[index].imagen  // "https://cdn-images-1.medium.com/max/1200/1*5-aoK8IBmXve5whBQM90GA.png"
                    ),
                  ),

                  title: Text(snapshot.data[index].nombre),

                  subtitle: Text(snapshot.data[index].apellido),

                  onTap: () {

                    Navigator.push(context, new MaterialPageRoute(builder:(context) => DetalleAlumno(snapshot.data[index])));

                  },
                );

              },
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}




class HeroImageViewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Imagen Seleccionada'),
      ),
      body: Center(
        child: Hero(
            tag: 'flutterLogo',
            child: FlutterLogo(
              size: 200.0,
            )
        ),
      ),
    );
  }
}