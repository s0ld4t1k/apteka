import 'dart:developer';

import 'package:apte/pages/bag/addCard.dart';
import 'package:apte/pages/kard/kard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

int _index = 0;
List _inputsId = [
  [
    'pan_visible',
    'month-selectized',
    'year-selectized',
    'iTEXT',
    'iCVC2',
    'buttonPayment',
    '',
    ''
  ],
];

class OnlinePayment extends StatefulWidget {
  final String url;
  const OnlinePayment({super.key, required this.url});

  @override
  State<OnlinePayment> createState() => _OnlinePaymentState();
}

class _OnlinePaymentState extends State<OnlinePayment> {
  final WebViewController wc = WebViewController();
  @override
  void initState() {
    _index = cards[selectedCardBank.value][1];
    log('$_index - ${widget.url}');
    wc
      ..loadRequest(Uri.parse(widget.url))
      ..setBackgroundColor(Colors.white)
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(NavigationDelegate(
        onPageFinished: (url) async {
          wc.runJavaScript('''
          // document.getElementById('pan_visible').value='1111 1111 1111 1111';
          document.getElementById('${_inputsId[_index][0]}').value='${cards[selectedCardBank.value][0]}';
          document.getElementById('${_inputsId[_index][1]}').value='${cards[selectedCardBank.value][4] + 1}';
          document.getElementById('${_inputsId[_index][2]}').value='${cards[selectedCardBank.value][5]}';
          document.getElementById('${_inputsId[_index][3]}').value='${cards[selectedCardBank.value][3]}';
          document.getElementById('${_inputsId[_index][4]}').value='${cards[selectedCardBank.value][2]}';
          console.log('hello');
        ''');
          // Future.delayed(const Duration(milliseconds: 500), () {
          //   wc.runJavaScript('''
          //   document.getElementById(${_inputsId[_index][5]}).click();
          //             js.postMessage('success);
          //           ''');
          //   wc.reload();
          // });
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
            height: Get.height - 105,
            child: WebViewWidget(controller: wc),
          ),
        ],
      ),
    );
  }
}
