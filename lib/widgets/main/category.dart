import 'package:apte/data/dio.dart';
import 'package:apte/data/model/category/controller.dart';
import 'package:apte/pages/kategory/subKategory.dart';
import 'package:apte/widgets/langDictionary.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainCategory extends StatelessWidget {
  const MainCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CategoryController>(
      init: CategoryController(),
      builder: (cc) {
        if (!cc.isload && !cc.isErr) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(left: 25),
                child: Text(
                  locale[curLN]?['mainCategory'] ?? '',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const SizedBox(height: 15),
              SizedBox(
                height: 115,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.all(0),
                  children: [
                    const SizedBox(width: 20),
                    Row(
                      children: List.generate(
                        cc.categories.detail?.loc?.length ?? 0,
                        (index) => SizedBox(
                          width: 90,
                          child: InkWell(
                            onTap: () {
                              cc.selectedCategory = index;
                              Get.to(() => const SubKategory());
                            },
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: 64,
                                  height: 64,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: cc.clrs[index % cc.clrs.length],
                                  ),
                                  child: Center(
                                    child: Container(
                                        padding: const EdgeInsets.all(10),
                                        child: Image.network(
                                          cc.categories.detail?.loc?[index]
                                                  .imgUrl ??
                                              '',
                                          errorBuilder:
                                              (context, error, stackTrace) =>
                                                  const Text('err'),
                                        )),
                                  ),
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  Dioo.getTitle(
                                      cc.categories.detail?.loc?[index].title),
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          );
        }
        return Container();
      },
    );
  }
}
