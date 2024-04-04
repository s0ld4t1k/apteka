// ignore_for_file: file_names
import 'package:apte/data/api/register.dart';
import 'package:apte/data/dio.dart';
import 'package:apte/data/model/products/controller.dart';
import 'package:apte/data/model/products/model.dart';
import 'package:apte/pages/bag/bag.dart';
import 'package:apte/pages/main/main_product_page.dart.dart';
import 'package:apte/pages/main/productPage.dart';
import 'package:apte/widgets/colors.dart';
import 'package:apte/widgets/langDictionary.dart';
// import 'package:dio/src/response.dart';
// import 'package:dio/src/response.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void addCart(id, isAdd) async {
  if (isAdd == false) {
    try {
      // setState(() {});
      await Dioo().dio.post(
        '${baseUrl}cart/',
        data: {'product': id, 'quantity': 1, 'action': 'add'},
      );
      debugPrint('-----add------set');

      isAdd.value = true;
      addToCart();
    } catch (e) {
      debugPrint('-----add------$e');
    }
    // ps.update();
  } else {
    try {
      // setState(() {});
      await Dioo().dio.post(
        '${baseUrl}cart/',
        data: {'product': id, 'quantity': 1, 'action': 'remove'},
      );
      debugPrint('-----minus------set');
      isAdd.value = false;
    } catch (e) {
      debugPrint('-----minus-----$e');
    }
    // ps.update();
  }
}

List<dynamic> ress = [];
void getCart(id, isAdd) async {
  try {
    var res = await Dioo().dio.get('${baseUrl}cart/');
    ress = res.data['detail']['loc'];
  } catch (e) {
    debugPrint('--main-cart-----$e');
  }
  for (var i = 0; i < ress.length; i++) {
    if (id == ress[i]['product']) {
      isAdd.value = true;
    }
  }
}

class NewProducts extends StatelessWidget {
  final String text;
  final ProductsModel prs;
  const NewProducts({super.key, required this.text, required this.prs});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductsController>(
        init: ProductsController(),
        builder: (ps) {
          return ((prs.detail?.loc?.length ?? 0) > 0)
              ? Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.only(left: 25, right: 15),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Text(
                              text,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Get.to(
                                  () => MainProductsPage(text: text, prm: prs));
                            },
                            child: Text(
                              '${locale[curLN]?["seeAll"]}',
                              style: const TextStyle(
                                color: green,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 230,
                      child: ListView(
                        padding: const EdgeInsets.all(0),
                        scrollDirection: Axis.horizontal,
                        children: [
                          const SizedBox(width: 25),
                          Row(
                            children: List.generate(
                                (prs.detail?.loc?.length ?? 0) > 8
                                    ? 8
                                    : prs.detail?.loc?.length ?? 0, (index) {
                              RxBool? isAdd = false.obs;
                              getCart(prs.detail?.loc?[index].id, isAdd);
                              return GestureDetector(
                                onTap: () => Get.to(
                                  () => ProductPage(
                                    url: prs.detail?.loc?[index].absoluteUrl ??
                                        '',
                                  ),
                                ),
                                child: Container(
                                  margin: const EdgeInsets.only(right: 18),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 12),
                                  width: 162,
                                  height: 220,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: 3,
                                        offset: const Offset(0, 1),
                                        color: Colors.black.withOpacity(0.05),
                                      )
                                    ],
                                  ),
                                  child: Stack(
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Expanded(
                                            child: Container(
                                              alignment: Alignment.center,
                                              padding: const EdgeInsets.all(16),
                                              child: Image.network(
                                                prs.detail?.loc?[index].image
                                                        ?.imgUrl ??
                                                    '',
                                                errorBuilder: (context, error,
                                                        stackTrace) =>
                                                    Text('err'),
                                              ),
                                            ),
                                          ),
                                          Text(
                                            Dioo.getTitle(
                                                prs.detail?.loc?[index].title),
                                            style: const TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500,
                                            ),
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          const SizedBox(height: 18),
                                          Text(
                                            '${prs.detail?.loc?[index].price?.price ?? 0} TMT',
                                            style: const TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w700,
                                              color: green,
                                            ),
                                          ),
                                          const SizedBox(height: 16),
                                        ],
                                      ),
                                      Positioned(
                                        right: 1,
                                        bottom: 10,
                                        child: InkWell(
                                          onTap: () {
                                            addCart(prs.detail?.loc?[index].id,
                                                isAdd);
                                          },
                                          child: Container(
                                            width: 32,
                                            height: 32,
                                            decoration: BoxDecoration(
                                              color: orange,
                                              borderRadius:
                                                  BorderRadius.circular(32),
                                            ),
                                            child: Obx(
                                              () => Icon(
                                                isAdd.value
                                                    ? Icons.done
                                                    : Icons.add,
                                                color: Colors.white,
                                                size: 20,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }),
                          )
                        ],
                      ),
                    )
                  ],
                )
              : Container();
        });
  }
}
