// ignore_for_file: file_names, deprecated_member_use, must_be_immutable

import 'package:apte/pages/main/mainPage.dart';
import 'package:apte/pages/main/productPage.dart';
import 'package:apte/widgets/langDictionary.dart';
import 'package:apte/widgets/main/filtrBottomSheet.dart';
import 'package:apte/widgets/main/new_products.dart';
import 'package:apte/widgets/main/tertipleBottomSheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../data/dio.dart';
import '../../data/model/products/controller.dart';
import '../../data/model/products/products.dart';
import '../../widgets/colors.dart';

class MainProductsPage extends StatelessWidget {
  final String text;
  final int type;
  MainProductsModel prm;
  final dynamic ontap;
  final String irl;
  MainProductsPage(
      {super.key,
      required this.text,
      required this.prm,
      required this.ontap,
      required this.irl,
      required this.type});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductsController>(
      init: ProductsController(),
      builder: (pc) {
        if (type == 1) {
          prm = pc.newProducts;
        }
        if (type == 2) {
          prm = pc.mostsoldProducts;
        }
        if (type == 3) {
          prm = pc.recommendedProducts;
        }
        return Scaffold(
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
            title: Text(text),
          ),
          body: SingleChildScrollView(
            controller: contrl,
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 18),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        style: ButtonStyle(
                          side: MaterialStateProperty.all(
                            const BorderSide(
                                color: Color.fromRGBO(237, 237, 237, 1)),
                          ),
                          minimumSize: MaterialStateProperty.all(
                              const Size(double.infinity, 42)),
                          backgroundColor:
                              MaterialStateProperty.all(Colors.white),
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                              side: const BorderSide(
                                color: Color.fromRGBO(237, 237, 237, 1),
                              ),
                            ),
                          ),
                        ),
                        onPressed: () {
                          showModalBottomSheet(
                            showDragHandle: true,
                            shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20),
                            )),
                            context: context,
                            builder: (context) {
                              return TertipleBottomSheet(
                                ontap: ontap,
                                url2: irl,
                                change: pc,
                              );
                            },
                          );
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset('assets/icons/tertiple.svg'),
                            const SizedBox(width: 7),
                            Text(
                              '${locale[curLN]?["sort"]}',
                              style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 21),
                    Expanded(
                      child: OutlinedButton(
                        style: ButtonStyle(
                            side: MaterialStateProperty.all(
                              const BorderSide(
                                  color: Color.fromRGBO(237, 237, 237, 1)),
                            ),
                            minimumSize: MaterialStateProperty.all(
                                const Size(double.infinity, 42)),
                            backgroundColor:
                                MaterialStateProperty.all(Colors.white),
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    side: const BorderSide(
                                        color: Color.fromRGBO(
                                            237, 237, 237, 1))))),
                        onPressed: () {
                          showModalBottomSheet(
                            isScrollControlled: true,
                            showDragHandle: true,
                            shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20),
                            )),
                            context: context,
                            builder: (context) {
                              return FiltrBottomSheet(
                                ontap: ontap,
                                url2: irl,
                                change: pc.change,
                              );
                            },
                          );
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset('assets/icons/filter.svg'),
                            const SizedBox(width: 7),
                            Text(
                              '${locale[curLN]?["filtr"]}',
                              style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 17),
                GridView(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 162,
                    mainAxisExtent: 220,
                    mainAxisSpacing: 18,
                    crossAxisSpacing: 21,
                  ),
                  children: List.generate(
                    prm.detail?.loc?[0].products?.length ?? 0,
                    (index) {
                      RxBool isAdd = false.obs;
                      getCart(prm.detail?.loc?[0].products?[index].id, isAdd);
                      return GestureDetector(
                        onTap: () => Get.to(() => ProductPage(
                            url: prm.detail?.loc?[0].products?[index]
                                    .absoluteUrl ??
                                '')),
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
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
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Container(
                                      alignment: Alignment.center,
                                      padding: const EdgeInsets.all(16),
                                      child: Image.network(
                                        prm.detail?.loc?[0].products?[index]
                                                .image?.imgUrl ??
                                            '',
                                        errorBuilder:
                                            (context, error, stackTrace) =>
                                                Image.asset(
                                          'assets/images/err.png',
                                          scale: 3,
                                        ),
                                        loadingBuilder:
                                            (context, child, loadingProgress) {
                                          if (loadingProgress == null) {
                                            return child;
                                          }
                                          return Image.asset(
                                            'assets/images/err.png',
                                            scale: 3,
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                  Text(
                                    Dioo.getTitle(prm.detail?.loc?[0]
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
                                    '${prm.detail?.loc?[0].products?[index].price?.price} TMT',
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
                                          prm.detail?.loc?[0].products?[index]
                                              .id,
                                          isAdd,
                                          prm.detail?.loc?[0].products?[index]
                                              .price?.price);
                                    }
                                  },
                                  child: Container(
                                    width: 32,
                                    height: 32,
                                    decoration: BoxDecoration(
                                      color: orange,
                                      borderRadius: BorderRadius.circular(32),
                                    ),
                                    child: Obx(
                                      () => Icon(
                                        isAdd.value ? Icons.done : Icons.add,
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
                    },
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
