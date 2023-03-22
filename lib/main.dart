import 'package:flutter/material.dart';
import 'package:future/desh_Screen.dart';
import 'package:future/home.dart';
void main()
{
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        "/":(context) => Home_Screen(),
        "desh":(context) => Desh_Screen(),
      },
    ),
  );
}