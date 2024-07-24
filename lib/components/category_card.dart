import 'package:flutter/material.dart';

Widget categoryCard(String title, Color color) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        border: Border.all(color: color)),
    child: Text(title,style: TextStyle(color: color),),
  );
}
