import 'package:apte/data/model/order/controller.dart';
import 'package:apte/widgets/colors.dart';
import 'package:apte/widgets/langDictionary.dart';
import 'package:apte/widgets/profile/garasylyanlar.dart';
import 'package:apte/widgets/profile/sargytlar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Sargyt extends StatelessWidget {
  const Sargyt({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrderController>(
        init: OrderController(),
        builder: (oc) {
          return DefaultTabController(
            length: 2,
            child: Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(title: Text('${locale[curLN]?['myOrders']}')),
              body: oc.isload
                  ? const Center(child: CircularProgressIndicator.adaptive())
                  : SafeArea(
                      child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 25),
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: const Color.fromRGBO(245, 245, 245, 1)),
                            padding: const EdgeInsets.all(4),
                            height: 50,
                            child: TabBar(
                                unselectedLabelColor: Colors.black,
                                unselectedLabelStyle: const TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16,
                                ),
                                labelColor: Colors.white,
                                labelStyle: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                ),
                                indicatorColor: Colors.red,
                                indicatorSize: TabBarIndicatorSize.tab,
                                indicator: const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(6)),
                                  color: green,
                                ),
                                dividerColor: Colors.transparent,
                                tabs: [
                                  Text(
                                    '${locale[curLN]?['waitingOrders']}',
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Text(
                                    '${locale[curLN]?['orders']}',
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ]),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Expanded(
                            child: TabBarView(
                              children: [
                                Garasylyanlar(oc: oc),
                                Sargytlarym(oc: oc),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )),
            ),
          );
        });
  }
}
