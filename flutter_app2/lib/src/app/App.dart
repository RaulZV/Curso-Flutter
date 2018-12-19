import 'package:flutter/material.dart';
import 'package:flutter_app2/screen/HomeScreen.dart';

class EstructuraApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: const Color(0xFF2196f3),
        accentColor: const Color(0xFF2196f3),
        canvasColor: const Color(0xFFfafafa)
      ),
      home: HomeScreen(title: 'Flutter Demo Home Page'),
    );
  }
}