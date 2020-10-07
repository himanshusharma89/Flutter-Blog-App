import 'dart:io';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter/material.dart';

class MediumPostView extends StatefulWidget {
  final String title;
  final String url;

  MediumPostView({@required this.title, @required this.url});

  @override
  State<StatefulWidget> createState() {
    return MediumPostViewState(title, url);
  }
}

class MediumPostViewState extends State<MediumPostView> {
  String title;
  String url;

  MediumPostViewState(this.title, this.url);

  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_rounded),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: WebView(
        initialUrl: url,
      ),
    );
  }
}
