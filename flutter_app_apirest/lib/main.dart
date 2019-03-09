import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';


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
      home: MyHomePage(title: 'Flutter Demo Home Page'),
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
  
  Future<List<Alumno>> _getDatosAlumno() async {
    
    var data = await http.get("http://172.18.6.67:3000/alumnos/getDatosAlumnos");

    var jsonData = json.decode(data.body);

    List<Alumno> alumnos = [];

    for(var a in jsonData){

      Alumno alumno = Alumno(a["id"], a["nombre"], a["apellido"], a["edad"]);

      alumnos.add(alumno);

    }

    print(alumnos.length);

    return alumnos;
  }
  
  
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
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
                   child: Text("Cargando..."),
                 ),
               );
             }
             
             return ListView.builder(
               itemCount: snapshot.data.length,
               itemBuilder: (BuildContext context, int index){
                 
                 return ListTile(

                   leading: CircleAvatar(
                     backgroundImage: NetworkImage(
                       "https://cdn-images-1.medium.com/max/1200/1*5-aoK8IBmXve5whBQM90GA.png"
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

class DetalleAlumno extends StatelessWidget{
  
  final Alumno alumno;
  
  DetalleAlumno(this.alumno);
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(alumno.nombre),
      ),
    );
  }
  
}


//Se crea la clase Alumno para obtener los datos de la API REST
class Alumno {
   final int id;
   final String nombre;
   final String apellido;
   final int edad;

   Alumno(this.id,this.nombre,this.apellido,this.edad);


}
