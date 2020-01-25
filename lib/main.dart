import 'package:blog_app/screens/dashboard.dart';
import 'package:flutter/material.dart';
import 'screens/home.dart';

void main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Dashboard(),
    theme: ThemeData(
      //backgroundColor: Color(0xff133337),
      primaryColor: Colors.deepPurple,
      fontFamily: 'Roboto Mono',
    ),
  ));
}