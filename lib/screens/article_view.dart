import 'dart:io';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:news_app/widgets/appbar.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ArticleNews extends StatefulWidget {
  final String url;
  const ArticleNews({Key? key, required this.url}) : super(key: key);

  @override
  State<ArticleNews> createState() => _ArticleNewsState();
}

class _ArticleNewsState extends State<ArticleNews> {
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();

  bool isLoading = true;
  @override
  void initState() {
    super.initState();
    // Enable virtual display.
    if (Platform.isAndroid) WebView.platform = AndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar(
        context,
      ),
      body: Stack(
        children: [
          WebView(
            onPageFinished: (finish) {
              setState(() {
                isLoading = false;
              });
            },
            initialUrl: widget.url,
            onWebViewCreated: (WebViewController webviewcontroller) {
              _controller.complete(webviewcontroller);
            },
          ),
          isLoading ? Center(child: CircularProgressIndicator()) : Stack()
        ],
      ),
    );
  }
}
