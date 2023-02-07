import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class MediumArticlesWebView extends StatefulWidget {
  const MediumArticlesWebView({required this.title, required this.url});

  final String title;
  final String url;

  @override
  State<StatefulWidget> createState() {
    return MediumArticlesWebViewState();
  }
}

class MediumArticlesWebViewState extends State<MediumArticlesWebView> {
  WebViewController controller = WebViewController();
  @override
  void initState() {
    super.initState();
    controller = WebViewController()..loadRequest(Uri.parse(widget.url));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_rounded),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: WebViewWidget(
        controller: controller,
      ),
    );
  }
}
