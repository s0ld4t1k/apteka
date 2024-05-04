import 'dart:developer';

import 'package:apte/pages/bag/addCard.dart';
import 'package:apte/pages/kard/kard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

String _url =
    'https://epg.rysgalbank.tm/payments/merchants/173801TSE3751/payment.html?mdOrder=65fc857d-52b4-43b6-b6e3-3a23a4844b2e&language=ru';
int _index = 0;
List _inputsId = [
  [
    'pan-visible',
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
  const OnlinePayment({super.key});

  @override
  State<OnlinePayment> createState() => _OnlinePaymentState();
}

class _OnlinePaymentState extends State<OnlinePayment> {
  final WebViewController wc = WebViewController();
  @override
  void initState() {
    _index = cards[selectedCardBank.value][1];
    log('$_index');
    wc
      ..loadRequest(Uri.parse(_url))
      ..setBackgroundColor(Colors.white)
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(NavigationDelegate(
        onPageFinished: (url) async {
          //   wc.runJavaScript('''
          //   document.getElementById(${_inputsId[_index][0]}).value=${cards[selectedCardBank.value][0]};
          //   document.getElementById(${_inputsId[_index][1]}).value=${cards[selectedCardBank.value][4]};
          //   document.getElementById(${_inputsId[_index][2]}).value=${cards[selectedCardBank.value][5]};
          //   document.getElementById(${_inputsId[_index][3]}).value=${cards[selectedCardBank.value][3]};
          //   document.getElementById(${_inputsId[_index][4]}).value=${cards[selectedCardBank.value][2]};
          //   document.getElementById(${_inputsId[_index][5]}).click();
          //   console.log('hello');
          // ''');
          // Future.delayed(const Duration(milliseconds: 500), () {
          //   wc.runJavaScript('''
          //             // document.getElementsByClassName('submit')[0].click();
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
