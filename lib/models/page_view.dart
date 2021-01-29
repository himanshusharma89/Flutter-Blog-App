import 'package:flutter/material.dart';

class PageViewModel extends StatelessWidget {

  final String image, text;

  const PageViewModel({Key key, @required this.image, @required this.text,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "assets/$image",
            height: 200,
          ),
          const SizedBox(height: 50),
          Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 15.0, color: Colors.black),
          ),
        ],
      ),
    );
  }
}