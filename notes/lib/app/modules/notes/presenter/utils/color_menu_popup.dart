import 'package:flutter/material.dart';

dynamic getColorMenuPopUp(context, details) {
  return showMenu(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15),
    ),
    context: context,
    position: RelativeRect.fromLTRB(
      details.globalPosition.dx,
      details.globalPosition.dy,
      details.globalPosition.dx,
      details.globalPosition.dy,
    ),
    items: [
      const PopupMenuItem<String>(
        value: 'white',
        child: Text('white'),
      ),
      const PopupMenuItem<String>(
        value: 'pink',
        child: Text('pink'),
      ),
      const PopupMenuItem<String>(
        value: 'yellow',
        child: Text('yellow'),
      ),
      const PopupMenuItem<String>(
        value: 'green',
        child: Text('green'),
      ),
      const PopupMenuItem<String>(
        value: 'blue',
        child: Text('blue'),
      ),
    ],
    elevation: 8.0,
  );
}