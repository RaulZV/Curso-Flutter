import 'package:flutter/material.dart';
import 'package:flutterappavanzado/vistaiOS/cupertino_disenio.dart';
import 'package:flutterappavanzado/vistaAndroid/material_disenio.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    bool isIOS = Theme.of(context).platform == TargetPlatform.iOS;

    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:  (isIOS == true)?CupertinoDisenio():MaterialDisenio(),
    );
  }
}
