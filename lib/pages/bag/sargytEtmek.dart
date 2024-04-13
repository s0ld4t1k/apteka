// ignore_for_file: file_names

import 'dart:async';

import 'package:apte/data/api/register.dart';
import 'package:apte/data/dio.dart';
import 'package:apte/data/model/user/controller.dart';
import 'package:apte/pages/bag/bankKarty.dart';
import 'package:apte/pages/bag/nagt.dart';
import 'package:apte/pages/bag/terminal.dart';
import 'package:apte/widgets/colors.dart';
import 'package:apte/widgets/langDictionary.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<int> toOrder(fullName, phone, address, paymentMethod) async {
  String url = '${baseUrl}order/';
  var data = {
    "full_name": fullName,
    "phone": phone,
    "address": address,
    "payment_method": paymentMethod,
  };
  try {
    var res = await Dioo().dio.post(url, data: data);
    return res.statusCode ?? 0;
  } catch (e) {
    debugPrint('----order-post----$e');
    return 0;
  }
}

var jem = 0.0;
int minutes = 0;
int secunds = 0;
void timmer(update) {
  // ignore: unused_local_variable
  Timer timer = Timer.periodic(const Duration(seconds: 1), (timer) {
    if (minutes > 0 && secunds == 0) {
      minutes--;
      secunds = 60;
    } else if (secunds > 0) {
      secunds--;
    } else {
      timer.cancel();
    }
    update();
  });
}

class SargytEtmek extends StatelessWidget {
  const SargytEtmek({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserController>(
        init: UserController(),
        builder: (uc) {
          return DefaultTabController(
            length: 3,
            child: Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(
                automaticallyImplyLeading: false,
                leading: IconButton(
                    padding: const EdgeInsets.all(0),
                    constraints: const BoxConstraints(
                      maxHeight: 24,
                      maxWidth: 24,
                      minHeight: 24,
                      minWidth: 24,
                    ),
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.chevron_left_rounded)),
                title: Text('${locale[curLN]?['toDoDeliv']}'),
              ),
              body: GestureDetector(
                onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
                child: Column(
                  children: [
                    Container(
                      height: 130,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 25, vertical: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('${locale[curLN]?['tolegUsuly']}'),
                          const SizedBox(height: 12),
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: const Color.fromRGBO(245, 245, 245, 1)),
                            padding: const EdgeInsets.all(4),
                            child: TabBar(
                                padding: const EdgeInsets.all(0),
                                indicatorPadding: const EdgeInsets.all(0),
                                unselectedLabelColor: Colors.black,
                                unselectedLabelStyle: const TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14,
                                ),
                                labelPadding: const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 13),
                                labelColor: Colors.white,
                                labelStyle: const TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14,
                                ),
                                indicatorColor: Colors.red,
                                indicatorSize: TabBarIndicatorSize.tab,
                                indicator: BoxDecoration(
                                    borderRadius: BorderRadius.circular(6),
                                    color: green),
                                dividerColor: Colors.transparent,
                                tabs: [
                                  Text('${locale[curLN]?['nagt']}',
                                      textAlign: TextAlign.center),
                                  Text(locale[curLN]!['terminal']!,
                                      textAlign: TextAlign.center),
                                  Text('${locale[curLN]?['bankKarty']}',
                                      textAlign: TextAlign.center),
                                ]),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: TabBarView(
                          children: [Nagt(), Terminal(), BankKarty()]),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
