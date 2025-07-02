import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lms_user_app/components/custom_app_bar.dart';
import 'package:lms_user_app/utils/html_type.dart';
import 'package:webview_flutter/webview_flutter.dart';

class HtmlViewerScreen extends StatefulWidget {
  final HtmlType? htmlType;
  const HtmlViewerScreen({super.key, @required this.htmlType});

  @override
  State<HtmlViewerScreen> createState() => _HtmlViewerScreenState();
}

class _HtmlViewerScreenState extends State<HtmlViewerScreen> {
  late WebViewController _controller;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    // Enable hybrid composition for Android
    if (WebView.platform == SurfaceAndroidWebView()) {
      WebView.platform = SurfaceAndroidWebView();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: widget.htmlType == HtmlType.termsAndConditions
            ? 'terms_and_conditions'.tr
            : widget.htmlType == HtmlType.aboutUs
            ? 'about_us'.tr
            : widget.htmlType == HtmlType.privacyPolicy
            ? 'privacy_policy'.tr
            : widget.htmlType == HtmlType.cancellationPolicy
            ? 'cancellation_policy'.tr
            : widget.htmlType == HtmlType.refundPolicy
            ? 'refund_policy'.tr
            : 'no_data_found'.tr,
      ),
      body: Stack(
        children: [
          WebView(
            initialUrl: 'https://spagreen.net/privacy-policy/',
            javascriptMode: JavascriptMode.unrestricted,
            onWebViewCreated: (WebViewController webViewController) {
              _controller = webViewController;
            },
            onPageStarted: (String url) {
              setState(() {
                _isLoading = true;
              });
              print('Page started loading: $url');
            },
            onPageFinished: (String url) {
              setState(() {
                _isLoading = false;
              });
              print('Page finished loading: $url');
            },
            onWebResourceError: (WebResourceError error) {
              print('''
              Page resource error:
              Code: ${error.errorCode}
              Description: ${error.description}
              ''');
              setState(() {
                _isLoading = false;
              });
            },
          ),
          if (_isLoading)
            Center(
              child: CircularProgressIndicator(),
            ),
        ],
      ),
    );
  }
}
