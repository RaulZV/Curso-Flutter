import 'package:flutter/material.dart';

class CardsScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new SingleChildScrollView(
      padding: EdgeInsets.all(10.0),
      child: new Column(
        children: <Widget>[


          new Card(
            color: Color(0xFFF3862FF),
            child: new Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const ListTile(
                  leading: const Icon(
                    Icons.account_circle,
                    color: Colors.white,
                    size: 50.0
                  ),

                  trailing: const Icon(
                      Icons.account_circle,
                      color: Colors.white,
                      size: 50.0
                  ),
                  title: const Text('Esto es un titulo',style: TextStyle(
                    color: Colors.white, fontSize: 20.0
                  ),
                  ),


                  subtitle: const Text('Esto es un subtitulo',style: TextStyle(
                      color: Colors.white
                  )),


                ),
                new ButtonTheme.bar(
                  // make buttons use the appropriate styles for cards
                  child: new ButtonBar(
                    children: <Widget>[
                      new RaisedButton(
                        child: const Text("Aceptar", style: TextStyle(
                          color: Colors.white,
                        ),),
                        onPressed: () {

                        },
                      ),
                      new FlatButton(
                        child: const Text('Cancelar',style: TextStyle(
                            color: Colors.white
                        )),
                        onPressed: () {},
                      ),
                      new FlatButton(
                        child: const Text('Aceptar',style: TextStyle(
                                            color: Colors.white
                                            )),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),



          new Card(
            child: new Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                new Image.asset(
                  'res/images/material_design_2.jpg',
//                  height: 60.0,
                  fit: BoxFit.fill,
                ),
                const ListTile(
                  title: const Text('Esto es un titulo'),
                  subtitle: const Text('Esto es un sibtitulo de la tarjeta.'),
                ),
                new ButtonTheme.bar(
                  // make buttons use the appropriate styles for cards
                  child: new ButtonBar(
                    alignment: MainAxisAlignment.start,
                    children: <Widget>[
                      new FlatButton(
                        child: const Text('Cancelar'),
                        onPressed: () {},
                      ),
                      new FlatButton(
                        child: const Text('Aceptar'),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),



          new Card(
            child: new Column(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                new Stack(
                  alignment: AlignmentDirectional.bottomEnd,
                  children: <Widget>[
                    new Image.asset(
                      'res/images/material_design_4.jpg',
//                      height: 192.0,
                      fit: BoxFit.fill,
                    ),
                    new ListTile(
                      title: new Text(
                        'Esto es un titulo',
                        style:
                        new TextStyle(color: Colors.white, fontSize: 24.0),
                      ),
                    ),
                  ],
                ),
                new ButtonTheme.bar(
                  child: new ButtonBar(
                    alignment: MainAxisAlignment.end,
                    children: <Widget>[
                      new IconButton(
                        icon: new Icon(Icons.favorite, color: Colors.red),
                        onPressed: () {},
                      ),
                      new IconButton(
                        icon: new Icon(Icons.bookmark, color: Colors.brown),
                        onPressed: () {},
                      ),
                      new IconButton(
                        icon: new Icon(Icons.share, color: Colors.blue),
                        onPressed: () {},
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}