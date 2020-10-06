import 'package:flutter/material.dart';

class UndefinedView extends StatelessWidget {
  final String routeName;

  const UndefinedView({Key key, this.routeName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Route for $routeName is not defined'),
      ),
    );
  }
}
