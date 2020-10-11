import 'dart:io';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter/material.dart';

class MediumArticlesWebView extends StatefulWidget {
  final String title;
  final String url;

  MediumArticlesWebView({@required this.title, @required this.url});

  @override
  State<StatefulWidget> createState() {
    return MediumArticlesWebViewState();
  }
}

class MediumArticlesWebViewState extends State<MediumArticlesWebView> {

  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_rounded),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: WebView(
        initialUrl: widget.url,
      ),
    );
  }
}
