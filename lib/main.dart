import 'package:flutter/material.dart';
import 'screens/home.dart';

void main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomePage(),
    theme: ThemeData(
      primaryColor: Colors.purple
    ),
  ));
}