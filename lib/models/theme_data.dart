import 'package:flutter/material.dart';

final darkTheme = ThemeData(
    primarySwatch: Colors.grey,
    primaryColor: Colors.black,
    fontFamily: 'Roboto Mono',
    brightness: Brightness.dark,
    backgroundColor: const Color(0xFF212121),
    accentColor: Colors.white,
    floatingActionButtonTheme: FloatingActionButtonThemeData(
        foregroundColor: Colors.deepPurple, backgroundColor: Colors.white),
    dividerColor: Colors.black12,
    inputDecorationTheme: InputDecorationTheme(
      // enabledBorder: new OutlineInputBorder(
      //   borderSide:  BorderSide(color: Colors.deepPurple ),
      // ),
      focusedBorder: new OutlineInputBorder(
        borderSide:  BorderSide(color: Colors.white ),
      ),
    ),
    iconTheme: IconThemeData(
      color: Colors.white,
    ),
    appBarTheme: AppBarTheme(
        elevation: 0,
        color: Colors.transparent,
        centerTitle: true,
        textTheme: TextTheme(
            headline6: TextStyle(
          color: Colors.white,
          fontFamily: 'Roboto Mono',
          fontSize: 20.0,
          fontWeight: FontWeight.w700,
        ))));

final lightTheme = ThemeData(
    primarySwatch: Colors.purple,
    primaryColor: Colors.deepPurple,
    fontFamily: 'Roboto Mono',
    brightness: Brightness.light,
    backgroundColor: const Color(0xFFE5E5E5),
    accentColor: Colors.black,
    floatingActionButtonTheme: FloatingActionButtonThemeData(
        foregroundColor: Colors.white, backgroundColor: Colors.deepPurple),
    dividerColor: Colors.white54,
    inputDecorationTheme: InputDecorationTheme(
      // enabledBorder: new OutlineInputBorder(
      //   borderSide:  BorderSide(color: Colors.deepPurple ),
      // ),
      focusedBorder: new OutlineInputBorder(
        borderSide:  BorderSide(color: Colors.deepPurple ),
      ),
    ),
    iconTheme: IconThemeData(
      color: Colors.deepPurple,
    ),
    appBarTheme: AppBarTheme(
        elevation: 0,
        centerTitle: true,
        color: Colors.transparent,
        iconTheme: IconThemeData(
          color: Colors.deepPurple,
        ),
        textTheme: TextTheme(
            headline6: TextStyle(
          color: Colors.deepPurple,
          fontFamily: 'Roboto Mono',
          fontSize: 22.0,
          fontWeight: FontWeight.w700,
        ))));
