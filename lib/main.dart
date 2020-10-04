import 'package:flutter/material.dart';
import 'screens/home.dart';
import 'routing/route_page.dart';
import 'routing/route_constant.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomePage(),
    theme: ThemeData(
      //backgroundColor: Color(0xff133337),
      scaffoldBackgroundColor: Colors.white,
      primaryColor: Colors.deepPurple,
      fontFamily: 'Roboto Mono',
    ),
    onGenerateRoute: RoutePage.generateRoute,
    initialRoute: RouteConstant.ROOT,
  ));
}
