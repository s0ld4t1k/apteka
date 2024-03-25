// ignore_for_file: file_names
import 'package:apte/data/dio.dart';
import 'package:apte/data/model/products/controller.dart';
import 'package:apte/data/model/products/model.dart';
import 'package:apte/pages/main/main_product_page.dart.dart';
import 'package:apte/pages/main/productPage.dart';
import 'package:apte/widgets/colors.dart';
import 'package:apte/widgets/langDictionary.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NewProducts extends StatelessWidget {
  final String text;
  final ProductsModel prs;
  const NewProducts({super.key, required this.text, required this.prs});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductsController>(
        init: ProductsController(),
        builder: (ps) {
          return Column(
            children: [
              Container(
                padding: const EdgeInsets.only(
                  left: 25,
                  right: 15,
                ),
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
                          Get.to(() => MainProductsPage(text: text, prm: prs));
                        },
                        child: Text(
                          '${locale[curLN]?["seeAll"]}',
                          style: const TextStyle(
                            color: green,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ))
                  ],
                ),
              ),
              // SizedBox(height: 15,),
              SizedBox(
                height: 230,
                child: ListView(
                  padding: const EdgeInsets.all(0),
                  scrollDirection: Axis.horizontal,
                  children: [
                    const SizedBox(
                      width: 25,
                    ),
                    Row(
                      children:
                          List.generate(prs.detail?.loc?.length ?? 0, (index) {
                        // var _added=false;
                        return GestureDetector(
                          onTap: () => Get.to(
                            () => ProductPage(
                              url: prs.detail?.loc?[index].absoluteUrl ?? '',
                            ),
                          ),
                          child: Container(
                            margin: const EdgeInsets.only(right: 18),
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
                                          prs.detail?.loc?[index].image
                                                  ?.imgUrl ??
                                              '',
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
                                    onTap: () {},
                                    child: Container(
                                      width: 32,
                                      height: 32,
                                      decoration: BoxDecoration(
                                        color: orange,
                                        borderRadius: BorderRadius.circular(32),
                                      ),
                                      child: const Icon(
                                        Icons.add,
                                        color: Colors.white,
                                        size: 20,
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
          );
        });
  }
}
