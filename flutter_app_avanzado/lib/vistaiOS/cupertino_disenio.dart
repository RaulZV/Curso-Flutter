import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutterappavanzado/screen/home_screen.dart';

class CupertinoDisenio extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      bottomNavigationBar: CupertinoTabScaffold(
           tabBar: CupertinoTabBar(
             items: [
               BottomNavigationBarItem(
                 icon:  Icon(
                   Icons.home,
                   color: Colors.indigo
                 ),
                 title: Text("Home")
               ),
               BottomNavigationBarItem(
                   icon:  Icon(
                       Icons.search,
                       color: Colors.indigo
                   ),
                   title: Text("Search")
               ),
               BottomNavigationBarItem(
                   icon:  Icon(
                       Icons.person,
                       color: Colors.indigo
                   ),
                   title: Text("Profile")
               )
             ],
           ),
        tabBuilder: (BuildContext context, int index){
             switch(index){
               case 0:
                  return CupertinoTabView(
                    builder: (BuildContext contex) => HomeScreen(),
                  );
                 break;
               case 1:
                 return CupertinoTabView(
                   builder: (BuildContext contex) => Text("Search"),
                 );
                 break;
               case 2:
                 return CupertinoTabView(
                   builder: (BuildContext contex) => Text("Profile"),
                 );
                 break;
             }
        },
      ),
    );
  }

}