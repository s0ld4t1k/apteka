import 'package:apte/data/model/order/controller.dart';
import 'package:apte/widgets/colors.dart';
import 'package:apte/widgets/langDictionary.dart';
import 'package:apte/widgets/profile/sargytInfo.dart';
import 'package:apte/widgets/statusCon.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Garasylyanlar extends StatelessWidget {
  final OrderController oc;
  const Garasylyanlar({super.key, required this.oc});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: List.generate(oc.orders.detail?.loc?.length ?? 0, (index) {
          if (true) {
            DateTime dt =
                DateTime.parse(oc.orders.detail?.loc?[index].orderedAt ?? '');
            return GestureDetector(
              onTap: () {
                Get.to(() => SargytInfo(loc: oc.orders.detail?.loc?[index]));
              },
              child: Container(
                margin: const EdgeInsets.only(bottom: 15),
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: sargytBorder),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text('${locale[curLN]?['yagdayy']}:'),
                        ),
                        Expanded(
                          child: Row(
                            children: [
                              StatusCon(
                                  text: '${oc.orders.detail?.loc?[index].id}'),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                    Row(
                      children: [
                        Expanded(
                          child: Text('${locale[curLN]?['orderID']}:'),
                        ),
                        const SizedBox(width: 20),
                        Expanded(
                          child: Text(
                            '${oc.orders.detail?.loc?[index].id}',
                            style: const TextStyle(
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                    Row(
                      children: [
                        Expanded(
                          child: Text('${locale[curLN]?['date']}:'),
                        ),
                        const SizedBox(width: 20),
                        Expanded(
                          child: Text(
                            '${dt.day}.${dt.month}.${dt.year}/${dt.hour}:${dt.minute}',
                            style: const TextStyle(
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            '${locale[curLN]?['res']}:',
                            style: const TextStyle(
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          child: Text(
                            '${oc.orders.detail?.loc?[index].total}',
                            style: const TextStyle(
                              fontWeight: FontWeight.w700,
                              color: green,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          }
        }),
      ),
    );
  }
}
