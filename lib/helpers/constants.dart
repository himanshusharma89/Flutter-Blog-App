import 'package:flutter/material.dart';

/// ROUTE CONSTANTS

class RouteConstant {
  static const ROOT = "/";
  static const ADD_POST = "/add-post";
  static const EDIT_POST = "/edit-post";
  static const VIEW_POST = "/view-post";
  static const ABOUT = "/about";
  static const MEDIUM_ARTICLES = "/medium-articles";
  static const MEDIUM_ARTICLES_WEB_VIEW = "/medium-article-web-view";
}

/// APP THEME AND MODE

class AppTheme {
  static const Color primaryColor = Color(0xff38b6ff);
}

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

/// CONTRIBUTORS

List contributors = [
  {
    "login": "shubham-chhimpa",
    "name": "Shubham Chhimpa",
    "avatar_url": "https://avatars0.githubusercontent.com/u/38981756?v=4",
    "profile": "https://www.linkedin.com/in/shubhamchhimpa/",
    "contributions": ["code"]
  },
  {
    "login": "carlosfrodrigues",
    "name": "Carlos Felix",
    "avatar_url": "https://avatars3.githubusercontent.com/u/18339454?v=4",
    "profile": "http://carlosfelix.pythonanywhere.com/",
    "contributions": ["design"]
  },
  {
    "login": "derangga",
    "name": "Dimas Rangga",
    "avatar_url": "https://avatars2.githubusercontent.com/u/31648630?v=4",
    "profile": "https://medium.com/@derangga",
    "contributions": ["code"]
  },
  {
    "login": "arbazdiwan",
    "name": "Arbaz Mustufa Diwan",
    "avatar_url": "https://avatars3.githubusercontent.com/u/24837320?v=4",
    "profile": "https://github.com/arbazdiwan",
    "contributions": ["code"]
  },
  {
    "login": "Mrgove10",
    "name": "Adrien",
    "avatar_url": "https://avatars0.githubusercontent.com/u/25491408?v=4",
    "profile": "http://www.adrienrichard.com/",
    "contributions": ["code"]
  },
  {
    "login": "Wizpna",
    "name": "Promise Amadi",
    "avatar_url": "https://avatars2.githubusercontent.com/u/15036164?v=4",
    "profile": "https://promise.hashnode.dev/",
    "contributions": ["design"]
  },
  {
    "login": "daruanugerah",
    "name": "Daru Anugerah Setiawan",
    "avatar_url": "https://avatars2.githubusercontent.com/u/20470960?v=4",
    "profile": "https://linkedin.com/in/daruanugerah",
    "contributions": ["design"]
  },
  {
    "login": "yash2189",
    "name": "Yash Ajgaonkar",
    "avatar_url": "https://avatars2.githubusercontent.com/u/31548778?v=4",
    "profile": "https://www.linkedin.com/in/yash-ajgaonkar-289520168/?",
    "contributions": ["doc"]
  },
  {
    "login": "Dhruv-Sachdev1313",
    "name": "Dhruv Sachdev",
    "avatar_url": "https://avatars0.githubusercontent.com/u/56223242?v=4",
    "profile": "https://github.com/Dhruv-Sachdev1313",
    "contributions": ["code"]
  },
  {
    "login": "Janhavi23",
    "name": "Janhavi",
    "avatar_url": "https://avatars3.githubusercontent.com/u/56731465?v=4",
    "profile": "https://github.com/Janhavi23",
    "contributions": ["code", "design"]
  },
  {
    "login": "Saransh-cpp",
    "name": "Saransh Chopra",
    "avatar_url": "https://avatars.githubusercontent.com/u/74055102?v=4",
    "profile": "https://github.com/Saransh-cpp",
    "contributions": ["design", "doc"]
  }
];

/// SOCIAL LINKS

List social = [
  {
    'URL': 'https://github.com/himanshusharma89',
    'iconURL': 'https://img.icons8.com/fluent/50/000000/github.png'
  },
  {
    'URL': 'https://twitter.com/_SharmaHimanshu',
    'iconURL': 'https://img.icons8.com/color/48/000000/twitter.png'
  },
  {
    'URL': 'https://www.linkedin.com/in/himanshusharma89/',
    'iconURL': 'https://img.icons8.com/color/48/000000/linkedin.png'
  },
];
