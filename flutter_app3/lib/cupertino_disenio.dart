import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';


import 'home_app.dart';
import 'search_app.dart';
import 'profile_app.dart';

class CupertinoDisenio extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      bottomNavigationBar: CupertinoTabScaffold(
          tabBar: CupertinoTabBar(
              items: [
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home,
                    color: Colors.indigo,
                  ),
                  title: Text("Home")
                ),
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.search,
                      color: Colors.indigo,
                    ),
                  title: Text("")
                ),
                BottomNavigationBarItem(
                    icon: Icon(
                      CupertinoIcons.person,
                      color: Colors.indigo,
                    ),
                   title: Text("")
                ),
              ],
          ),
          tabBuilder: (BuildContext context,int index){

            

           switch(index){
             case 0:
               return CupertinoTabView(
                 builder: (BuildContext contex) => HomeApp(),
               );
               break;
             case 1:
               return CupertinoTabView(
                 builder: (BuildContext contex) => SearchApp(),
               );
               break;
             case 2:
               return CupertinoTabView(
                 builder: (BuildContext contex) => ProfileApp(),
               );
               break;
           }
          },
      ),
    );
  }

}