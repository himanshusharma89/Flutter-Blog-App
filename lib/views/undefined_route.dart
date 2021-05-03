import 'package:flutter/material.dart';

class UndefinedView extends StatelessWidget {
  const UndefinedView({
    required this.routeName,
    Key? key,
  }) : super(key: key);

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
