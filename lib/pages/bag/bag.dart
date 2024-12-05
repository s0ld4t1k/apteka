import 'package:apte/data/model/cart/controller.dart';
import 'package:apte/pages/bag/bag_item.dart';
import 'package:apte/pages/bag/sargytEtmek.dart';
import 'package:apte/pages/main/mainPage.dart';
import 'package:apte/pages/main/productPage.dart';
import 'package:apte/widgets/bag&Card/eltmeCon.dart';
import 'package:apte/widgets/circul.dart';
import 'package:apte/widgets/colors.dart';
import 'package:apte/widgets/langDictionary.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';

RxDouble harytJemi = 0.0.obs;
RxDouble eltipberme = 0.0.obs;
List jemiList = [];
List eltmeList = [];
void addToCart() {
  HapticFeedback.lightImpact();
  Get.snackbar(
    'Haryt sebede goşuldy',
    'Harydy sebediňizde görüp bilersiň',
    isDismissible: true,
    dismissDirection: DismissDirection.horizontal,
    colorText: Colors.white,
    backgroundColor: green,
  );
}

class Bag extends StatelessWidget {
  const Bag({super.key});

  @override
  Widget build(BuildContext context) {
    jemiList = [
      ['${locale[curLN]?["resPrice"]}', '0.0 TMT'],
      ['${locale[curLN]?["deliveryHyzmat"]}', '$eltipberme TMT'],
    ];
    eltmeList = [
      ['${locale[curLN]?["delivery1Hour"]}', '0 ${locale[curLN]?["manat"]}'],
      ['${locale[curLN]?["delivery30min"]}', '20 ${locale[curLN]?["manat"]}'],
    ];
    return GetBuilder<CartController>(
      init: CartController(),
      builder: (cc) {
        jemiList[0][1] = '${harytJemi.value} TMT';
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            titleSpacing: 25,
            automaticallyImplyLeading: false,
            title: Row(
              children: [
                Text('${locale[curLN]?["cart"]}'),
                const Spacer(),
                TextButton(
                  style: ButtonStyle(
                    overlayColor: WidgetStateProperty.all(red.withOpacity(0.1)),
                  ),
                  onPressed: () => cc.cleanCart(),
                  child: Text(
                    '${locale[curLN]?["clean"]}',
                    style: const TextStyle(
                      color: red,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                )
              ],
            ),
          ),
          body: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Stack(
              children: [
                SingleChildScrollView(
                  controller: contrl,
                  child: cc.isload
                      ? const Circul()
                      : (cc.cartProducts.detail?.loc ?? []).isEmpty
                          ? Container(
                              alignment: Alignment.bottomCenter,
                              height:
                                  MediaQuery.of(context).size.height / 2 - 75,
                              child: Text('${locale[curLN]?['noPro']}'))
                          : Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 25, right: 25, top: 20),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Column(
                                        children: List.generate(
                                          cc.cartProducts.detail?.loc?.length ??
                                              0,
                                          (index) {
                                            return BagItem(
                                              index: index,
                                              cc: cc,
                                            );
                                          },
                                        ),
                                      ),
                                      Text(
                                        '${locale[curLN]?["delivery"]}',
                                        style: const TextStyle(fontSize: 16),
                                      ),
                                      const SizedBox(height: 20),
                                      Row(
                                        children: List.generate(
                                          eltmeList.length,
                                          (index) {
                                            return Expanded(
                                              child: Container(
                                                margin: EdgeInsets.only(
                                                  right: index == 0 ? 10 : 0,
                                                  left: index == 0 ? 0 : 10,
                                                ),
                                                child: GestureDetector(
                                                  onTap: () {
                                                    curEltme = index;
                                                    if (index == 1) {
                                                      eltipberme.value = 20;
                                                    } else {
                                                      eltipberme.value = 0;
                                                    }
                                                    jemiList[1][1] =
                                                        '$eltipberme TMT';
                                                    cc.update();
                                                  },
                                                  child: Column(
                                                    children: [
                                                      EltmeCon(
                                                        text1: eltmeList[index]
                                                            [0],
                                                        text2: eltmeList[index]
                                                            [1],
                                                        index: index,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                      const Devider(),
                                      Column(
                                        children: List.generate(
                                          jemiList.length,
                                          (index) => Container(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 12),
                                            height: 37,
                                            child: Row(
                                              children: [
                                                Text(
                                                  jemiList[index][0],
                                                  style: const TextStyle(
                                                      color: Color.fromRGBO(
                                                          107, 107, 107, 1),
                                                      fontSize: 16),
                                                ),
                                                const Spacer(),
                                                Text(
                                                  jemiList[index][1],
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w700,
                                                    color: index == 1
                                                        ? red
                                                        : const Color.fromRGBO(
                                                            107, 107, 107, 1),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 12.0),
                                        child: Row(
                                          children: [
                                            Text(
                                              locale[curLN]?['res'] ?? '',
                                              style: const TextStyle(
                                                  color: Color.fromRGBO(
                                                      107, 107, 107, 1),
                                                  fontSize: 16),
                                            ),
                                            const Spacer(),
                                            Text(
                                              '${harytJemi.value + eltipberme.value} TMT',
                                              style: const TextStyle(
                                                fontWeight: FontWeight.w700,
                                                color: Color.fromRGBO(
                                                    107, 107, 107, 1),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                ),
                (cc.cartProducts.detail?.loc ?? []).isNotEmpty
                    ? Positioned(
                        bottom: 0,
                        right: 0,
                        left: 0,
                        child: Container(
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 25, vertical: 10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 5,
                                  color: Colors.black.withOpacity(0.05)),
                            ],
                          ),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                      child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '${locale[curLN]?["res"]}',
                                        style: const TextStyle(
                                          color:
                                              Color.fromRGBO(107, 107, 107, 1),
                                        ),
                                      ),
                                      Obx(() {
                                        return Text(
                                          '${harytJemi.value + eltipberme.value} TMT',
                                          style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        );
                                      })
                                    ],
                                  )),
                                  ElevatedButton(
                                    style: ButtonStyle(
                                        minimumSize: WidgetStateProperty.all(
                                            const Size(196, 46)),
                                        elevation: WidgetStateProperty.all(1),
                                        shape: WidgetStateProperty.all(
                                            RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ))),
                                    onPressed: () {
                                      jem = harytJemi.value + eltipberme.value;
                                      Get.to(() => const SargytEtmek());
                                    },
                                    child: Text(
                                      '${locale[curLN]?["toDeliv"]}',
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      )
                    : Container()
              ],
            ),
          ),
        );
      },
    );
  }
}
