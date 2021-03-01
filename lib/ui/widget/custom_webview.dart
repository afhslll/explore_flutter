import 'dart:async';
import 'dart:io';

import 'package:explore_flutter/core/argument/webview_argument.dart';
import 'package:explore_flutter/core/service/locator/locator.dart';
import 'package:explore_flutter/core/service/navigator/navigation_service.dart';
import 'package:explore_flutter/ui/shared/theme_color.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class CustomWebview extends StatefulWidget {
  final WebviewArgument argument;
  const CustomWebview({@required this.argument});
  @override
  _CustomWebviewState createState() => _CustomWebviewState();
}

class _CustomWebviewState extends State<CustomWebview> {
  final NavigationService _navigationService = locator<NavigationService>();
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();

  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.close,
            color: ThemeColor.black,
          ),
          onPressed: () {
            _navigationService.pop();
          },
        ),
        actions: [
          Visibility(
            visible: _isLoading,
            child: Center(
              child: Container(
                margin: EdgeInsets.only(right: 20),
                width: 17,
                height: 17,
                child: Center(
                  child: Theme(
                    data: Theme.of(context)
                        .copyWith(accentColor: ThemeColor.black),
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
        backgroundColor: ThemeColor.white,
      ),
      body: WebView(
        initialUrl: widget?.argument?.url ?? 'https://flutter.dev',
        javascriptMode: JavascriptMode.disabled,
        onWebViewCreated: (WebViewController webViewController) {
          _controller.complete(webViewController);
        },
        onPageStarted: (String url) {
          setState(() {
            _isLoading = true;
          });
        },
        onPageFinished: (String url) {
          setState(() {
            _isLoading = false;
          });
        },
        gestureNavigationEnabled: false,
      ),
    );
  }
}
