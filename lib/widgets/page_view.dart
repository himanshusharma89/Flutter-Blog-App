import 'package:flutter/material.dart';

class PageViewWidget extends StatelessWidget {
  const PageViewWidget({
    @required this.image,
    @required this.text,
    Key key,
  }) : super(key: key);

  final String image, text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            'assets/$image',
            height: 200,
          ),
          const SizedBox(height: 50),
          Text(
            text,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 15.0, color: Colors.black),
          ),
        ],
      ),
    );
  }
}
