import 'package:blog_app/helpers/app_theme.dart';
import 'package:flutter/material.dart';

final darkTheme = ThemeData(
    primarySwatch: Colors.grey,
    primaryColor: Colors.black,
    fontFamily: 'Nunito',
    brightness: Brightness.dark,
    backgroundColor: const Color(0xFF212121),
    accentColor: Colors.white,
    floatingActionButtonTheme: FloatingActionButtonThemeData(
        foregroundColor: AppTheme.primaryColor, backgroundColor: Colors.white),
    dividerColor: Colors.black12,
    inputDecorationTheme: InputDecorationTheme(
      // enabledBorder: new OutlineInputBorder(
      //   borderSide:  BorderSide(color: AppTheme.primaryColor ),
      // ),
      focusedBorder: new OutlineInputBorder(
        borderSide: BorderSide(color: Colors.white),
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
          fontFamily: 'Nunito',
          fontSize: 20.0,
          fontWeight: FontWeight.w700,
        ))));

final lightTheme = ThemeData(
    primarySwatch: Colors.purple,
    primaryColor: AppTheme.primaryColor,
    fontFamily: 'Nunito',
    brightness: Brightness.light,
    backgroundColor: const Color(0xFFE5E5E5),
    accentColor: Colors.black,
    floatingActionButtonTheme: FloatingActionButtonThemeData(
        foregroundColor: Colors.white, backgroundColor: AppTheme.primaryColor),
    dividerColor: Colors.white54,
    inputDecorationTheme: InputDecorationTheme(
      focusedBorder: new OutlineInputBorder(
        borderSide: BorderSide(color: AppTheme.primaryColor),
      ),
    ),
    iconTheme: IconThemeData(
      color: AppTheme.primaryColor,
    ),
    appBarTheme: AppBarTheme(
        elevation: 0,
        centerTitle: true,
        color: Colors.transparent,
        iconTheme: IconThemeData(
          color: AppTheme.primaryColor,
        ),
        textTheme: TextTheme(
            headline6: TextStyle(
          color: AppTheme.primaryColor,
          fontFamily: 'Nunito',
          fontSize: 22.0,
          fontWeight: FontWeight.w700,
        ))));
