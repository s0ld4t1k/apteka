// ignore_for_file: file_names
import 'package:apte/data/api/register.dart';
import 'package:apte/data/dio.dart';
import 'package:apte/data/model/products/controller.dart';
import 'package:apte/data/model/products/products.dart';
import 'package:apte/main.dart';
import 'package:apte/pages/bag/bag.dart';
import 'package:apte/pages/main/main_product_page.dart.dart';
import 'package:apte/pages/main/productPage.dart';
import 'package:apte/widgets/colors.dart';
import 'package:apte/widgets/langDictionary.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

import '../../data/model/product/controller.dart';

void addCart(id, isAdd, price) async {
  if (isAdd == false) {
    try {
      await Dioo().dio.post(
        '${baseUrl}cart/',
        data: {'product': id, 'quantity': 1, 'action': 'add'},
      );
      debugPrint('-----add------set');

      isAdd.value = true;
      addToCart();
      harytJemi.value += price;
    } catch (e) {
      debugPrint('-----add------$e');
    }
  } else {
    try {
      await Dioo().dio.post(
        '${baseUrl}cart/',
        data: {'product': id, 'quantity': 1, 'action': 'remove'},
      );
      debugPrint('-----minus------set');
      harytJemi.value -= price;
      isAdd.value = false;
    } catch (e) {
      debugPrint('-----minus-----$e');
    }
  }
}

List<dynamic> ress = [];
void getCart(id, isAdd) async {
  try {
    var res = await Dioo().dio.get('${baseUrl}cart/');
    ress = res.data['detail']['loc'];
  } catch (e) {
    debugPrint('--main---cart-----$e');
  }
  for (var i = 0; i < ress.length; i++) {
    if (id == ress[i]['product']) {
      isAdd.value = true;
    }
  }
}

class NewProducts extends StatelessWidget {
  final String text;
  final int type;
  final MainProductsModel prs;
  final dynamic ontap;
  final String url;
  const NewProducts({
    super.key,
    required this.text,
    required this.prs,
    required this.ontap,
    required this.url,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductsController>(
        init: ProductsController(),
        builder: (ps) {
          return ((prs.detail?.loc?[0].products?.length ?? 0) > 0)
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
                                () => MainProductsPage(
                                  type: type,
                                  text: text,
                                  prm: prs,
                                  irl: url,
                                  ontap: ontap,
                                ),
                              );
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
                                (prs.detail?.loc?[0].products?.length ?? 0) > 8
                                    ? 8
                                    : prs.detail?.loc?[0].products?.length ?? 0,
                                (index) {
                              RxBool? isAdd = false.obs;
                              if (tokenn.isNotEmpty &&
                                  !JwtDecoder.isExpired(tokenn)) {
                                getCart(prs.detail?.loc?[0].products?[index].id,
                                    isAdd);
                              }
                              return GestureDetector(
                                onTap: () {
                                  Get.delete<ProductController>();
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => ProductPage(
                                          url: prs
                                                  .detail
                                                  ?.loc?[0]
                                                  .products?[index]
                                                  .absoluteUrl ??
                                              '')));
                                },
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
                                                prs
                                                        .detail
                                                        ?.loc?[0]
                                                        .products?[index]
                                                        .image
                                                        ?.imgUrl ??
                                                    '',
                                                errorBuilder: (context, error,
                                                        stackTrace) =>
                                                    const Text('err'),
                                              ),
                                            ),
                                          ),
                                          Text(
                                            Dioo.getTitle(prs.detail?.loc?[0]
                                                .products?[index].title),
                                            style: const TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500,
                                            ),
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          const SizedBox(height: 18),
                                          Text(
                                            '${prs.detail?.loc?[0].products?[index].price?.price ?? 0} TMT',
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
                                            if (Dioo().checkToken()) {
                                              addCart(
                                                  prs.detail?.loc?[0]
                                                      .products?[index].id,
                                                  isAdd,
                                                  prs
                                                      .detail
                                                      ?.loc?[0]
                                                      .products?[index]
                                                      .price
                                                      ?.price);
                                            }
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
