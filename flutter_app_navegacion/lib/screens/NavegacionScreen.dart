import 'package:flutter/material.dart';
import 'package:flutter_app_navegacion/modelo/Persona.dart';
import 'package:flutter_app_navegacion/screens/DetallePersonaScreen.dart';

class NavegacionScreen extends StatelessWidget{

  //Generar la lista de Personas
  final listaPersonas = List<Persona>.generate(20, (i) => Persona(
    'Persona $i',
    'Una descripción $i',
  ),
  );



 // NavegacionScreen({Key key, listaPersonas}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Personas'),
      ),
      body: ListView.builder(
        itemCount: listaPersonas.length,
        itemBuilder: (context, index) {

          bool isIOS = Theme.of(context).platform == TargetPlatform.iOS;

          return ListTile(
            title: Text(listaPersonas[index].nombre),
            subtitle: Text(listaPersonas[index].descripcion),
            leading: Icon(Icons.account_circle,size: 50.0,),
            trailing: (isIOS) ? Icon(Icons.arrow_forward_ios):
            Icon(Icons.arrow_forward),
            onTap: () {
              Navigator.push(context,
                MaterialPageRoute(builder: (context) =>
                    DetallePersonaScreen(objPersona: listaPersonas[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}


