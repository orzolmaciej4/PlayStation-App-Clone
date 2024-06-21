import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class PSStoreScreen extends StatelessWidget {
  const PSStoreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    try {
      return Scaffold(
        body: InAppWebView(
          initialUrlRequest: URLRequest(
            url: Uri.parse('https://store.playstation.com/en-ro/pages/latest'),
          ),
        ),
      );
    } catch (e) {
      return Scaffold(
        body: Center(
          child: Text(
              'Unfortunately, the store is currently down. Please try again later.'),
        ),
      );
    }
  }
}
