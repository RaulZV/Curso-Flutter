import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_alertas/alertas/MultiChoiceDialog.dart';
import 'package:flutter_app_alertas/alertas/SingleChoiceDialog.dart';
import 'package:flutter_app_alertas/alertas/alertaBoton.dart';
import 'package:flutter_app_alertas/alertas/alertaDialogo.dart';
import 'package:flutter_app_alertas/alertas/alertalibreria.dart';
import 'package:flutter_app_alertas/alertas/datePickerDialogo.dart';
import 'package:flutter_app_alertas/alertas/modalBottomSheetDialogo.dart';
import 'package:flutter_app_alertas/alertas/showBottonSheetDialogo.dart';
import 'package:flutter_app_alertas/alertas/timePickerDialogo.dart';



class DialogoScreen extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _DialogoScreen();
  }

}

class _DialogoScreen extends State<DialogoScreen> {

  TimeOfDay _selectedTime; //Propiedad

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    final DateTime now = DateTime.now();

    _selectedTime  = TimeOfDay(hour: now.hour,minute: now.minute);
  }

  @override
  Widget build(BuildContext context) {

    // TODO: implement build
    return new ListView(
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
      children: <Widget>[

        alertaLibreria(context,"Dialogo 1"),

        alertaBoton(context, Colors.purple, "Dialogo 2", alertaDialogo()),

        alertaBoton(context, Colors.indigo, "Dialogo 3", SingleChoiceDialog()),

        alertaBoton(context, Colors.blue, "Dialogo 4", MultiChoiceDialog()),

        timePickerDialogo(context, _selectedTime, "Dialogo 5"),

        datePickerDialog(context,"Dialogo 6"),

        modalBottomSheetDialog(context,"Dialogo 7"),

        showBottonSheetDialogo(context, "Dialogo 8")


      ].map((Widget widget){
        return Container(
             padding: EdgeInsets.symmetric(vertical:10.0),
             child: widget
        );
      }).toList(),
    );
  }
}
