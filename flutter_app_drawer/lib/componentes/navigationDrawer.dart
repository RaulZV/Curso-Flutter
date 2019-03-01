import 'package:flutter/material.dart';
import 'package:flutter_app_drawer/screens/PrimerScreen.dart';
import 'package:flutter_app_drawer/screens/SegundoScreen.dart';

import 'package:flutter/services.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';

class NavigationDrawer extends StatefulWidget {

  @override
  _NavigationDrawer createState() => _NavigationDrawer();


}

class _NavigationDrawer extends State<NavigationDrawer>
    with WidgetsBindingObserver{

  changeNavigationColor() async {
    try {
      FlutterStatusbarcolor.setStatusBarWhiteForeground(false);
      await FlutterStatusbarcolor.setStatusBarColor(Colors.blue);
    } on PlatformException catch (e) {
      debugPrint(e.toString());
    }
  }


  @override
  initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);

    setState(() {
      changeNavigationColor();
    });

  }

  @override
  Widget build(BuildContext context) {
    return new Drawer(
      child: ListView(
        children: <Widget>[
          new UserAccountsDrawerHeader(
            accountName: Text("Felipe Hernandez Palafox"),
            accountEmail: Text("felipe.hernandez.palafox@gmail.com"),
            currentAccountPicture: new CircleAvatar(
              backgroundColor: Colors.white,
              child: new FlutterLogo(size: 42.0),
            ),
            /*decoration: BoxDecoration(
                image: DecorationImage(
                    image:
                     NetworkImage("https://cdn-images-1.medium.com/max/1600/1*8_sKMUCcMPka4fBzmcWuhA.png"),
                    fit: BoxFit.cover
                )
            ),*/
          ),
          Ink(
            color: Colors.blue,
            child: new ListTile(
              leading: const Icon(Icons.home,color: Colors.white,),
              title: Text("Item 1", style: TextStyle(color: Colors.white),),
              onTap: (){
                Navigator.of(context).pop();
                Navigator.of(context).push(
                    MaterialPageRoute(
                        builder:(BuildContext context) => PrimerScreen()
                    )
                );
              },
            ),
          ),
          new ListTile(
            title: Text("Item 2"),
            onTap: (){
              Navigator.of(context).pop();
              Navigator.of(context).push(
                  MaterialPageRoute(
                      builder:(BuildContext context) => SegundoScreen()
                  )
              );
            },
          ),
          new ListTile(
            title: Text("Item 3"),
            onTap: (){
              Navigator.of(context).pop();
              Navigator.of(context).push(
                  MaterialPageRoute(
                      builder:(BuildContext context) => PrimerScreen()
                  )
              );
            },
          ),
          new Divider(),
          new ListTile(
            leading: const Icon(Icons.info),
            title: Text("Item 4"),
            onTap: (){
              Navigator.of(context).pop();
              Navigator.of(context).push(
                  MaterialPageRoute(
                      builder:(BuildContext context) => SegundoScreen()
                  )
              );
            },
          )
        ],
      ) ,
    );
  }
}