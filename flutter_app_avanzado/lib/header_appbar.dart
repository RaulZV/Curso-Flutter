import 'package:flutter/material.dart';


class HeaderAppBar extends StatelessWidget {

  BuildContext contextGlobal;
  
  @override
  Widget build(BuildContext context) {
    contextGlobal =  context;
    return Stack(
        children: <Widget>[
          appBarGradiente("Bienvenido"),
          CargarImagenHeader(context)
        ],
    );
  }

  Widget appBarGradiente(String titulo){
    return Container(
      height: 250.0,
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            Color(0xFF4268D3),
            Color(0xFF584CD1)
          ],
              begin: FractionalOffset(0.2, 0.0),
              end: FractionalOffset(1.0, 0.6),
              stops: [0.0,0.6],
              tileMode: TileMode.clamp
          )
      ),
      child: Text(
        titulo,
        style: TextStyle(
            color: Colors.white,
            fontSize: 30.0,
            fontWeight: FontWeight.bold
        ),
      ),
      alignment: Alignment(-0.8, -0.5),
    );
  }

  Widget CargarImagenHeader(BuildContext context) {
    return Container(
       height: 350.0,
       child: ListView(
         padding: EdgeInsets.all(25.0),
         scrollDirection: Axis.horizontal,
         children: <Widget>[
             CardImage("assets/img/lugares/lugar1.jpg"),
             CardImage("assets/img/lugares/lugar2.jpg"),
             CardImage("assets/img/lugares/lugar3.jpg"),
             CardImage("assets/img/lugares/lugar4.jpg"),
             CardImage("assets/img/lugares/lugar5.jpg"),
             CardImage("assets/img/lugares/lugar6.jpeg"),
         ],
       ),
    );

  }

  Widget CardImage(String urlPath){

    final card = Container(
       height: 350.0,
       width: 250.0,
       margin: EdgeInsets.only(
        top: 80.0,
        left: 20.0
      ),
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(urlPath)
        ),
      borderRadius: BorderRadius.all(Radius.circular(10.0)),
      shape: BoxShape.rectangle,
      boxShadow: <BoxShadow>[
        BoxShadow(
          color: Colors.black38,
          blurRadius: 15.0,
          offset: Offset(0.0,7.0),
        )
      ]
      ),
    );


    return Stack(
       alignment: Alignment(0.9,1.1),
       children: <Widget>[
        card,
        FloatingActionButtonLugar()
      ],
    );

  }

  Widget FloatingActionButtonLugar(){

    return FloatingActionButton(
       backgroundColor:  Color(0xFF11DA53),
       mini: true,
       tooltip: "Fav",
       onPressed: (){

         Scaffold.of(contextGlobal).showSnackBar(SnackBar(
           content: Text("Lo agregaste a favoritos"),
         ));
       },
      child:  Icon(
        Icons.favorite_border
      ),
    );
  }


}