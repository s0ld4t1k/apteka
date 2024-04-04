// ignore_for_file: file_names

import 'package:apte/data/dio.dart';
import 'package:apte/pages/main/productPage.dart';
import 'package:apte/widgets/circul.dart';
import 'package:apte/widgets/colors.dart';
import 'package:apte/widgets/main/new_products.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/model/category/controller.dart';

class CategoryProducts extends StatelessWidget {
  const CategoryProducts({super.key});

  @override
  Widget build(BuildContext context) {
    // getCart(ctm, index, isAdd)
    return GetBuilder<CategoryController>(
      init: CategoryController(),
      builder: (cc) {
        return cc.categoryProdyctIsload
            ? const Circul()
            : GridView(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 162,
                  mainAxisExtent: 220,
                  mainAxisSpacing: 18,
                  crossAxisSpacing: 21,
                ),
                children: List.generate(
                  cc.categoryProducts.detail?.loc?[0].products?.length ?? 0,
                  (index) {
                    RxBool isAdd = false.obs;
                    getCart(
                        cc.categoryProducts.detail?.loc?[0].products?[index].id,
                        isAdd);
                    return GestureDetector(
                      onTap: () {
                        debugPrint(cc.categoryProducts.detail?.loc?[0]
                            .products?[index].absoluteUrl);
                        Get.to(
                          () => ProductPage(
                            url: cc.categoryProducts.detail?.loc?[0]
                                    .products?[index].absoluteUrl ??
                                '',
                          ),
                        );
                      },
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
                                      cc.categoryProducts.detail?.loc?[0]
                                              .products?[index].image?.imgUrl ??
                                          '',
                                      errorBuilder:
                                          (context, error, stackTrace) =>
                                              Text('err'),
                                    ),
                                  ),
                                ),
                                Text(
                                  Dioo.getTitle(cc.categoryProducts.detail
                                      ?.loc?[0].products?[index].title),
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                const SizedBox(
                                  height: 18,
                                ),
                                Text(
                                  '${cc.categoryProducts.detail?.loc?[0].products?[index].price?.price} TMT',
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
                                  addCart(
                                      cc.categoryProducts.detail?.loc?[0]
                                          .products?[index].id,
                                      isAdd);
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
              );
      },
    );
  }
}
