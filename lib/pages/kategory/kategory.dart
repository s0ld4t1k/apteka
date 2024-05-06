// ignore_for_file: deprecated_member_use

import 'package:apte/data/dio.dart';
import 'package:apte/pages/main/mainPage.dart';
import 'package:apte/pages/main/search.dart';
import 'package:apte/widgets/circul.dart';
import 'package:apte/widgets/colors.dart';
import 'package:apte/widgets/langDictionary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../data/model/category/controller.dart';

class Kategory extends StatelessWidget {
  const Kategory({super.key});

  @override
  Widget build(BuildContext context) {
    Get.delete<CategoryController>();
    return GetBuilder<CategoryController>(
        init: CategoryController(),
        builder: (cc) {
          return GestureDetector(
            onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
            child: Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(
                automaticallyImplyLeading: false,
                title: Text('${locale[curLN]?["category"]}'),
              ),
              body: SingleChildScrollView(
                controller: contrl,
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 50,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color.fromRGBO(249, 249, 249, 1),
                      ),
                      child: TextField(
                        onTap: () {
                          Get.to(() => const Searck());
                          FocusScope.of(context).requestFocus(FocusNode());
                        },
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.all(0),
                          border: const OutlineInputBorder(
                              borderSide: BorderSide.none),
                          suffixIconConstraints: const BoxConstraints(
                            maxHeight: 20,
                            maxWidth: 20,
                            minHeight: 20,
                            minWidth: 20,
                          ),
                          suffixIcon: SvgPicture.asset(
                              'assets/icons/search.svg',
                              color: green),
                          hintText: '${locale[curLN]?["searchByName"]}',
                          hintStyle: const TextStyle(
                            fontWeight: FontWeight.w500,
                            color: textGrey3,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    if (cc.isload) const Circul(),
                    if (!cc.isload && !cc.isErr)
                      GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: 111,
                          mainAxisExtent: 145,
                          crossAxisSpacing: 12,
                          mainAxisSpacing: 20,
                        ),
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              cc.st.selectedCategory = index;
                              cc.st.categorySlug = cc.categories.detail
                                      ?.loc?[cc.st.selectedCategory].slug ??
                                  '';
                              print('${cc.st.selectedCategory}');
                              print('${cc.st.categorySlug}');
                              cc.update();
                              Navigator.of(context)
                                  .pushNamed('/kategory/subKategory');
                            },
                            child: SizedBox(
                              height: 145,
                              child: Stack(
                                children: [
                                  Positioned(
                                    bottom: 0,
                                    left: 0,
                                    right: 0,
                                    child: Container(
                                      width: 111,
                                      height: 125,
                                      decoration: BoxDecoration(
                                        color: const Color.fromRGBO(
                                            250, 250, 250, 1),
                                        borderRadius: BorderRadius.circular(13),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    left: 10,
                                    right: 10,
                                    bottom: 22,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          Dioo.getTitle(cc.categories.detail
                                              ?.loc?[index].title),
                                          textAlign: TextAlign.center,
                                          style: const TextStyle(
                                            fontSize: 13,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Positioned(
                                    top: 0,
                                    left: 10,
                                    right: 10,
                                    child: SizedBox(
                                      width: 80,
                                      height: 80,
                                      child: Image.network(
                                        cc.categories.detail?.loc?[index]
                                                .imgUrl ??
                                            '',
                                        errorBuilder:
                                            (context, error, stackTrace) =>
                                                const Text('err'),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                        itemCount: cc.categories.detail?.loc?.length,
                      )
                  ],
                ),
              ),
            ),
          );
        });
  }
}
