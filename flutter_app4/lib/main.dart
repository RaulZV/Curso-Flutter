import 'package:flutter/material.dart';
import 'dart:async';


void main() => runApp(new MaterialApp(
    home: ListPage(),
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
 )
);


class ListPage extends StatefulWidget {

  ListPage({Key key}) : super(key: key);

  // Creacion de los items de la lista
  List<String> items = new List<String>.generate(30, (i) => "Item ${(i + 1)}");

  @override
  State<StatefulWidget> createState() {
    return new ListPageState(items: items);
  }
}


class ListPageState extends State<ListPage> {

  //Constructor
  ListPageState({this.items});

  //Lista de tipo String
  final List<String> items;


  /*
    Las claves globales identifican de forma única los elementos.
    Las claves globales proporcionan acceso a otros objetos que
    están asociados
     con elementos, como BuildContext y, para StatefulWidgets, a State.
  */

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey
                       = new GlobalKey<RefreshIndicatorState>();

  Future<Null> _handleRefresh() {
    final Completer<Null> completer = new Completer<Null>();

    new Timer(const Duration(seconds: 2), () {
      completer.complete(null);
    });

    return completer.future.then((_) {
      _scaffoldKey.currentState?.showSnackBar(
        new SnackBar(
          content: const Text('Refresh complete'),
          action: new SnackBarAction(
            label: 'RETRY',
            onPressed: () {
              _refreshIndicatorKey.currentState.show();
            },
          ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      key: _scaffoldKey,
      appBar: new AppBar(
        title: new Text('Lista'),
      ),
      body: new RefreshIndicator(
        color: Colors.blue,
        key: _refreshIndicatorKey,
        onRefresh: _handleRefresh,
        child: new ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            final item = items[index];

            return new Dismissible(
              key: new Key(item),
              //direction: DismissDirection.vertical,
              onDismissed: (direction) {


                setState(() {
                  items.removeAt(index);
                });



                if(direction == DismissDirection.endToStart ){

                  Scaffold.of(context).showSnackBar(
                    new SnackBar(content: new Text("$item archivado")),
                  );

                }else if (direction == DismissDirection.startToEnd){

                    Scaffold.of(context).showSnackBar(
                      new SnackBar(content: new Text("$item Eliminar")),
                    );

                }

                //_showDialog("Alerta","Dato Seleccionado: $direction");


              },
              background: new Container(
                color: Colors.red,
                child: const ListTile(
                    leading: const Icon(Icons.delete, color: Colors.white)),
              ),
              secondaryBackground: new Container(
                color: Colors.green,
                child: const ListTile(
                    trailing: const Icon(Icons.edit, color: Colors.white)),
              ),
              //Contenido
              child: new ListTile(
                leading: new CircleAvatar(
                  backgroundColor: Colors.grey,
                  child: new Icon(
                      Icons.account_circle,
                      color: Colors.white,
                      size: 40,),

                ),
                title: new Text('$item'),
                subtitle: new Text('Pull to refresh.\nSwipe to dismiss.'),
                onTap: () {
                  _showDialog("Alerta","Dato Seleccionado: $item");
                },
              ),
            );
          },
        ),
      ),
    );
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




}

