import 'package:flutter/material.dart';

class RatingBarCustom extends StatefulWidget{

  //properties
  int numberStart;

  double startCount;

  Color colorStart;

  //Constructor and initializers
  RatingBarCustom({
    this.numberStart = 5,
    this.startCount = 1.0,
    @required
    this.colorStart
  });


  @override
  State<RatingBarCustom> createState() {
    // TODO: implement createState
    return _RatingBarCustom();
  }

}

class _RatingBarCustom  extends  State<RatingBarCustom>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Row(
      children: dynamicIcons()
    );
  }

  List<Widget> dynamicIcons(){

       int  count = 1;
       bool flagdecimal =  false;

       var numStartString = widget.startCount.toString();
       var arrNum = numStartString.split(".");

      return List<Widget>.generate(widget.numberStart, (int index) {
        if(count <=  int.parse(arrNum[0])  ){
          count += 1;
           return typeIconStart(Icons.star);
        }else if(int.parse(arrNum[1]) != 0 && flagdecimal ==  false){
          count += 1;
          flagdecimal =  true;
          return typeIconStart(Icons.star_half);
        } else if(count > int.parse(arrNum[0])){
          count += 1;
          return  typeIconStart(Icons.star_border);
        }
        return null;

      });
  }


  Widget typeIconStart(IconData icon){
    return Container(
      margin:  EdgeInsets.only(
          top: 335.0,
          right: 3.0
      ),
      child: Icon(
          icon,
          color:  widget.colorStart
      ),
    );
  }

}