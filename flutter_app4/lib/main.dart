import 'package:flutter/material.dart';

void main() => runApp(new MaterialApp(
    home: MyApp(),
    title: 'Card',
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
 )
);

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    final double IconSize = 40;

    final TextStyle textStyle = TextStyle(
       color: Colors.grey,
       fontSize: 30.0
    );

    return new Scaffold(
      appBar: AppBar(
        title:Text("Cards"),
      ),
      body:Container(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              new myCard(
                   Text("Tarjeta 1", style: textStyle,),
                   Icon(Icons.face, size: IconSize, color: Colors.blueAccent,)
              ),
              new myCard(
                  Text("Tarjeta 2", style: textStyle,),
                  Icon(Icons.favorite, size: IconSize, color: Colors.deepOrangeAccent,)
              ),
              new myCard(
                  Text("Tarjeta 3", style: textStyle,),
                  Icon(Icons.account_circle, size: IconSize, color: Colors.deepPurpleAccent,)
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class myCard extends StatelessWidget{

  final Widget titulo;
  final Widget icono;

  myCard(this.titulo,this.icono);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: EdgeInsets.only(top: 1.0),
        margin: EdgeInsets.only(
            top: 10.0,
            left: 5.0,
            right: 5.0
        ),
      child: Card(
        child: Container(
          padding: EdgeInsets.all(
              20.0
          ),
          child: Column(
            children: <Widget>[
              titulo,
              icono
            ],
          ),
        ),
      ),
      decoration: BoxDecoration(
          borderRadius:  BorderRadius.all(Radius.circular(10.0)),
          shape: BoxShape.rectangle,
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.black38,
                blurRadius: 10.0,
                offset: Offset(0.0, 7.0)
            )
          ]
      ),
    );
  }

}

