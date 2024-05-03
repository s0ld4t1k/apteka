import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

class OnlinePayment extends StatefulWidget {
  const OnlinePayment({super.key});

  @override
  State<OnlinePayment> createState() => _OnlinePaymentState();
}

class _OnlinePaymentState extends State<OnlinePayment> {
  final WebViewController wc = WebViewController();
  @override
  void initState() {
    wc
      ..loadRequest(Uri.parse('https://codeforces.com/enter?back=%2F'))
      ..addJavaScriptChannel('js', onMessageReceived: (ms) {
        log('mesg---------${ms.message}');
      })
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(NavigationDelegate(
        onPageFinished: (url) async {
          wc.runJavaScript('''
            // document.getElementById('handleOrEmail').value='B.Begnazarov';
            // document.getElementById('password').value='wpptb9k57al351109';
            document.getElementById('header').style.display='none';
            console.log('hello');
          ''');
          Future.delayed(const Duration(milliseconds: 500), () {
            wc.runJavaScript('''
                      // document.getElementsByClassName('submit')[0].click();
                      js.postMessage('success);
                    ''');
            wc.reload();
          });
        },
      ));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Online Payment')),
      body: Column(
        children: [
          SizedBox(
            height: Get.height - Get.height,
            child: WebViewWidget(controller: wc),
          ),
        ],
      ),
    );
  }
}
