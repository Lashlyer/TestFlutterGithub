

import 'package:flutter/cupertino.dart';
import 'package:shopping_list/data/categories.dart';
import 'package:shopping_list/widgets/productDetail/detailContent/leezenDetailContent.dart';
import 'package:webview_flutter/webview_flutter.dart';


class LeeznDetailShipping extends StatefulWidget {

  const LeeznDetailShipping({super.key, required this.url});

  final String url;

  @override
  State<LeeznDetailShipping> createState() => _LeeznDetailShippingState();
}

class _LeeznDetailShippingState extends State<LeeznDetailShipping> {

  late final WebViewController _controller;

  double _contentHeight = 0.0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = WebViewController.fromPlatformCreationParams(const PlatformWebViewControllerCreationParams());

    _controller
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
      ..loadHtmlString(widget.url.combineHtml());
  }

  @override
  void dispose() {
    
    super.dispose();
  }

  Future<void> _getContentHeight() async {
    try {
      final heightStr = await _controller.runJavaScriptReturningResult(
          'document.documentElement.scrollHeight');
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
      padding: const EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            DetailContentType.shipping.getDetailContentTyepName(),
            style: TextStyle(
              color: LeezenColor.primary002.getTypeColor(),
              fontSize: 14,
              fontWeight: FontWeight.bold
            ),
          ),

          SizedBox(
            height: _contentHeight,
            child: WebViewWidget(controller: _controller),
          ) 
        ],
      ),
    );
  }
}