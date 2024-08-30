import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shopping_list/data/categories.dart';
import 'package:shopping_list/models/detailContent.dart';
import 'package:webview_flutter/webview_flutter.dart';

enum DetailContentType { content, nutritions, specifications, shipping }

extension DetailContentTypeExtension on DetailContentType {
  String getDetailContentTyepName() {
    switch (this) {
      case DetailContentType.content:
        return '產品介紹';
      case DetailContentType.nutritions:
        return '規格說明';
      case DetailContentType.specifications:
        return '營養標示';
      case DetailContentType.shipping:
        return '付款與運送';
    }
  }
}

class LeezenDetailContent extends StatefulWidget {
  const LeezenDetailContent({super.key, required this.content});

  final DetailContent content;
  @override
  State<LeezenDetailContent> createState() => _LeezenDetailContentState();
}

class _LeezenDetailContentState extends State<LeezenDetailContent> {
  late DetailContent content;
  late final WebViewController controller;
  double _contentHeight = 0.0;


  @override
  void initState() {
    super.initState();

    content = widget.content;

    controller = WebViewController.fromPlatformCreationParams(
        const PlatformWebViewControllerCreationParams());

    controller
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(NavigationDelegate(
        onProgress: (int progress) {
          // Update loading bar.
        },
        onPageStarted: (String url) {},
        onPageFinished: (String url) {
          _getContentHeight();
        },
        onWebResourceError: (WebResourceError error) {},
        onNavigationRequest: (NavigationRequest request) {
          if (request.url.startsWith('https://www.youtube.com/')) {
            return NavigationDecision.prevent;
          }
          return NavigationDecision.navigate;
        },
      ))
      ..loadHtmlString(content.content.combineHtml());
  }

@override
void dispose() {
  
  super.dispose();
  
}

  Future<void> _getContentHeight() async {
    try {
      final heightStr = await controller.runJavaScriptReturningResult(
          'document.body.scrollHeight');
          
      setState(() {
        _contentHeight = double.parse(heightStr.toString());
      });
    } catch (e) {
      print('Failed to get content height: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 12.0, right: 12.0),
            child: Text(
              DetailContentType.content.getDetailContentTyepName(),
              style: TextStyle(
                  color: leezenColor[LeezenColor.primary002]!.color,
                  fontSize: 14,
                  fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: _contentHeight - 700.0,
            child: Padding(
              padding: const EdgeInsets.only(left: 12.0, right: 12.0),
              child: WebViewWidget(
                controller: controller,
              ),
            ),
          ),
          Container(
            height: 1,
            color: LeezenColor.grey003alpha20.getTypeColor(),
          ),
        ],
      ),
    );
  }
}

extension StringExtension on String {
  String combineHtml() {
    return '''
        <!DOCTYPE html>
        <html>
        <style type="text/css">
            html,
            body {
                margin: 0px;
                padding: 0;
            }

            h {
                margin-top: 0;
            }

            img {
                max-width: 100%;
                max-height: 100%;
            }
        </style>
        <meta name="viewport"content="width=device-width, initial-scale=1.0, user-scalable=no, maximum-scale=1, shrink-to-fit=no">
          <body>
        $this
        </body>
        </html>
        ''';
  }
}
