import 'package:flutter/material.dart';
import 'package:flutterappavanzado/header_appbar.dart';
import 'package:flutterappavanzado/descripcion.dart';
import 'package:flutterappavanzado/reviewWidget.dart';

class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  Stack(
      children: <Widget>[
        ListView(
          children: <Widget>[
            Descripcion("Lugar 1", "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type",3),
            ReviewWidget()
          ],
        ),
        HeaderAppBar(),
      ],
    );
  }


}