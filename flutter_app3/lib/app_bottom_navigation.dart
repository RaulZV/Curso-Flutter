import 'package:flutter/material.dart';
import 'home_app.dart';
import 'search_app.dart';
import 'profile_app.dart';

class AppBottomNavigation extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _AppBottomNavigation();
  }

}

class _AppBottomNavigation extends State<AppBottomNavigation>{

  int indexTap = 0;

  final List<Widget>  widgetsChildres = [
    HomeApp(),
    SearchApp(),
    ProfileApp()
  ];

  void onTapTapped(int index){

    //Llamar toda la funcionalidad de StatefulWidget
    setState(() {
      indexTap = index;
    });
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(
      body: widgetsChildres[indexTap],
      bottomNavigationBar: Theme(
          data: Theme.of(context).copyWith(
            canvasColor: Colors.white,
            primaryColor: Colors.purple,
          ),
          child: BottomNavigationBar(
            currentIndex: indexTap,
              onTap: onTapTapped,
              items: [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  title: Text("")
                ),
                BottomNavigationBarItem(
                    icon: Icon(Icons.search),
                    title: Text("")
                ),
                BottomNavigationBarItem(
                    icon: Icon(Icons.person),
                    title: Text("")
                )
              ]
          ),
      ),
    );
  }

}