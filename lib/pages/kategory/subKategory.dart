// ignore_for_file: file_names, deprecated_member_use

import 'package:apte/data/api/register.dart';
import 'package:apte/data/dio.dart';
import 'package:apte/pages/kategory/subKategoryPage.dart';
import 'package:apte/widgets/main/tertipleBottomSheet.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/model/category/controller.dart';

class SubKategory extends StatelessWidget {
  final int selectedCategory;
  final cc = Get.put(CategoryController());
  SubKategory({super.key, required this.selectedCategory});

  @override
  Widget build(BuildContext context) {
    debugPrint('$selectedCategory');
    debugPrint(cc.st.categorySlug);
    return GetBuilder<CategoryController>(
        init: CategoryController(),
        builder: (cc) {
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
              title: Text(Dioo.getTitle(
                  cc.categories.detail?.loc?[selectedCategory].title)),
            ),
            body: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      cc.st.selectedSubategory = index;
                      cc.st.categorySlug =
                          cc.categories.detail?.loc?[selectedCategory].slug ??
                              '';
                      cc.st.subcategorySlug = cc
                              .categories
                              .detail
                              ?.loc?[selectedCategory]
                              .subcategories?[cc.st.selectedSubategory]
                              .slug ??
                          '';
                      cc.url2 =
                          '${baseUrl}category/${cc.st.categorySlug}/subcategory/${cc.st.subcategorySlug}/?page=${cc.st.page}&sort=${prices[selectedTertip]}';
                      cc.getCategoryProducts(cc.url2);
                      Get.to(() => SubKategoryPage(
                            incPage: cc.incPage,
                            selectedcategory: selectedCategory,
                            selectedsubcategory: cc.st.selectedSubategory,
                          ));
                    },
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  Dioo.getTitle(cc
                                      .categories
                                      .detail
                                      ?.loc?[selectedCategory]
                                      .subcategories?[index]
                                      .title),
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              const Icon(Icons.chevron_right_rounded),
                            ],
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          height: 1,
                          color: const Color.fromRGBO(237, 237, 237, 1),
                        )
                      ],
                    ),
                  );
                },
                itemCount: cc.categories.detail?.loc?[selectedCategory]
                        .subcategories?.length ??
                    0,
              ),
            ),
          );
        });
  }
}
