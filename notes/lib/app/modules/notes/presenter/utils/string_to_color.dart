import 'package:flutter/material.dart';

Color? stringToColor(String colorString){
    if (colorString == 'pink') {
      return Colors.pink[200];
    } else if (colorString == 'yellow') {
      return Colors.yellow[300];
    } else if (colorString == 'green') {
      return Colors.lightGreen[300];
    } else if (colorString == 'blue') {
      return Colors.lightBlue[200];
    } else {
      return Colors.white;
    }

}