import 'package:blog_app/notifier/medium_Article_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/home.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => MediumArticleNotifier()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePage(),
        theme: ThemeData(
          //backgroundColor: Color(0xff133337),
          scaffoldBackgroundColor: Colors.white,
          primaryColor: Colors.deepPurple,
          fontFamily: 'Roboto Mono',
        ),
      ),
    ),
  );
}
