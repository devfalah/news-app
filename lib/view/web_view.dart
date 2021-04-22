import 'package:flutter/material.dart';
import 'package:news/view/widgets/custom_text.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViews extends StatelessWidget {
  final String url;
  final String title;
  WebViews(this.url, this.title);
  @override
  Widget build(BuildContext context) {
    print(url);
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: CustomText(text: title),
        ),
        body: WebView(
          initialUrl: url,
        ),
      ),
    );
  }
}
