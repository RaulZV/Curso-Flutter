import 'package:flutter/material.dart';
import 'package:flutterappavanzado/screen/home_screen.dart';


class MaterialDisenio extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MaterialDisenio();
  }
}

class _MaterialDisenio extends State<MaterialDisenio> {

  int indexTap= 0;

  final List<Widget> widgetsChildres  = [
    //Vistas
    HomeScreen(),
    Text("Search"),
    Text("Profile")
  ];


  void onTapTapped(int  index){
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
          primaryColor: Colors.purple
        ),
        child: BottomNavigationBar(
          currentIndex: indexTap,
          onTap: onTapTapped,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text("Home")
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.search),
                title: Text("Search")
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.person),
                title: Text("Profile")
            )
          ],
        ),
      ),
    );
  }

}