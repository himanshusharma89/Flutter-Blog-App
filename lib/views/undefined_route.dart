import 'package:flutter/material.dart';

class UndefinedView extends StatelessWidget {
  const UndefinedView({Key key, this.routeName}) : super(key: key);

  final String routeName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Route for $routeName is not defined'),
      ),
    );
  }
}
