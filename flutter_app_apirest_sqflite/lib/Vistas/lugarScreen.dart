import 'package:flutter/material.dart';
import 'package:flutter_app_apirest/Vistas/detalleLugarScreen.dart';
import 'package:flutter_app_apirest/provedores/DBProvider.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:progress_hud/progress_hud.dart';
import 'package:flutter_app_apirest/Modelo/Lugar.dart';

import 'package:connectivity/connectivity.dart';


class lugarScreen extends StatefulWidget{
  
  //constructor
  final String title;
  lugarScreen({Key key, this.title}) : super (key: key);

  
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MiLugarState();
  }
  
  
}

class _MiLugarState extends State<lugarScreen>{

  //Libreria de progreso
  ProgressHUD _progressHUD;
  bool _loading  = true;


  Future<List<Lugar>> _getDatosLugar() async {
    DBProvider.db.eliminarTbl();

    var data = await  http.get("http://mtwdm.kicks-ass.net/lugaresApi/");

    var jsonData  = json.decode(data.body);

    List<Lugar> lugares  = [];

    for(var l in jsonData){

      Lugar objLugar =  Lugar(l["id"], l["nombre"], l["descripcion"],
                              l["direccion"],l["telefono"],l["website"],
                              l["imagen_nombre"], l["importancia"],l["latitud"],
                             l["longitud"],l["title"],l["reaction"]);
      DBProvider.db.insertarTbl(objLugar);
      lugares.add(objLugar);
    }

    //print(lugares.length);

    return lugares;

  }

  @override
  void initState() {
    super.initState();

    //inicializando el progressHub
    _progressHUD =  ProgressHUD(
      backgroundColor: Colors.black12,
      color:  Colors.white,
      containerColor: Colors.blue,
      borderRadius: 5.0,
      text: 'Cargando',
      loading: true,
    );

  }

 Future<List<Lugar>> verificarConexion() async {
    var connectivityResult = await (Connectivity().checkConnectivity());

    if (connectivityResult == ConnectivityResult.none) {
     return  DBProvider.db.consultaTabla();
    } else if (connectivityResult == ConnectivityResult.wifi) {
      return _getDatosLugar();
    }
  }

  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        child:  FutureBuilder(
          future:   verificarConexion(),//DBProvider.db.consultaTabla(), //_getDatosLugar(),
          builder: (BuildContext context, AsyncSnapshot snapshot){

            if(snapshot.data == null){
              return Container(
                child: Center(
                  child: _progressHUD,
                ),
              );
            }

            return ListView.builder(
               itemCount: snapshot.data.length,
               itemBuilder: (BuildContext context, int index){

                 return ListTile(

                   leading:  CircleAvatar(
                     backgroundImage: NetworkImage(
                       snapshot.data[index].imagen_nombre
                     ),
                   ),

                   title: Text(snapshot.data[index].nombre),
                   subtitle: Text(snapshot.data[index].descripcion),

                   onTap: () {
                       Navigator.push(context, MaterialPageRoute(builder:
                           (context) => detalleLugarScreen(snapshot.data[index])));
                   },
                 );
              },
            );

          },
        ),


      ),
    );
  }
  
}