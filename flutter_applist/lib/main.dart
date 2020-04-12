import 'package:flutter/material.dart';
import 'dart:async';


void main() => runApp(new MaterialApp(
  home: ListPage(),
  debugShowCheckedModeBanner: false,
  theme: ThemeData(
    primarySwatch: Colors.blue
  ),
));

class ListPage extends StatefulWidget{

  ListPage({Key key}) :super(key: key);

  //Creación de los items de una lista
   List<String> items  =  new List<String>.generate(30, (i)=> "Item ${(i + 1)}");

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ListPageState(items: items);
  }
}

class ListPageState extends State<ListPage>{

  //Lista de tipo String
  final List<String> items;

  //Constructor
  ListPageState({this.items});

  /*

   Las claves globales identifican de forma unica los elementos.
   Las claves globales proporcionan acceso a otros objetos que estan asociados
   con elementos, como BuildContext, StatefulWidgets, State

   */

  final  GlobalKey<ScaffoldState> _scaffoldkey =
                new GlobalKey<ScaffoldState>();
  final  GlobalKey<RefreshIndicatorState> _refreshIndicatorkey =
                 new GlobalKey<RefreshIndicatorState>();

  //metodo
  Future<Null> _handleRefresh(){
    final Completer<Null> completer = new Completer<Null>();

    new Timer(const Duration(seconds: 2), () {
      completer.complete(null);
    });

    return completer.future.then((_) {
      _scaffoldkey.currentState?.showSnackBar(new
                 SnackBar(
                      content:  const Text("Refresh complete"),
                      action: new SnackBarAction(
                               label: "Retry",
                               textColor: Colors.white,
                               onPressed: () {
                                 _refreshIndicatorkey.currentState.show();
                               }
                      ),
          ),
      );
    });
  }



  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new  Scaffold(
      key: _scaffoldkey,
      appBar: new AppBar(
        title: new Text("Lista"),
      ),
      body: new RefreshIndicator(
            color: Colors.blue,
            key: _refreshIndicatorkey,
            onRefresh:  _handleRefresh,
            child: new ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, index){

                  final  item =  items[index];

                  return new Dismissible( //Poder eliminar los items (izquierda, Derecha)
                       key: new Key(item),

                       onDismissed: (direction){

                         setState(() {
                           items.removeAt(index);
                         });

                         if(direction  == DismissDirection.endToStart){

                           Scaffold.of(context).showSnackBar(
                             new SnackBar(content: new Text("$item archivado"))
                           );

                         }else if(direction  == DismissDirection.startToEnd){

                           Scaffold.of(context).showSnackBar(
                               new SnackBar(content: new Text("$item eliminado"))
                           );
                         }

                       },

                    background: new Container(
                      color: Colors.red,
                      child: const ListTile(
                        leading:  const Icon(Icons.delete, color: Colors.white,),
                      ),
                    ),
                    secondaryBackground: new Container(
                      color: Colors.green,
                      child: const ListTile(
                        trailing: const Icon(Icons.edit, color: Colors.white,),
                      ),
                    ),

                    //Contenido de la lista
                    child: new ListTile(
                      leading: new CircleAvatar(
                        backgroundColor: Colors.grey,
                        child: new Icon(
                          Icons.account_circle,
                          color: Colors.white,
                          size: 40,
                        ),
                      ),
                      title: new Text("$item"),
                      subtitle: new Text("Pull to refresh - Swipe to dismiss"),
                      onTap: (){
                        _showDialog("Alerta","Dato seleccionado: $item ");
                      },
                    ),

                  );
              },
            ),
         ),
      );
  }

  void _showDialog(String titulo, String contenido){

    showDialog(context: context,
               builder: (BuildContext context){

            return AlertDialog(
               title: new Text(titulo),
               content: new Text(contenido),
               actions: <Widget>[
                 new FlatButton(
                   child: new Text("Cerrar"),
                   onPressed: (){
                     Navigator.of(context).pop();
                   },
                 )
               ],
            );

    });

  }

}