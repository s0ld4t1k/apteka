// ignore_for_file: file_names, deprecated_member_use

import 'package:apte/data/api/register.dart';
import 'package:apte/data/dio.dart';
import 'package:apte/data/model/products/model.dart';
import 'package:apte/pages/main/mainPage.dart';
import 'package:apte/widgets/colors.dart';
import 'package:apte/widgets/langDictionary.dart';
import 'package:apte/widgets/main/category_products.dart';
import 'package:apte/widgets/main/filtrBottomSheet.dart';
import 'package:apte/widgets/main/tertipleBottomSheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../data/model/category/controller.dart';

// List filtrList = [];

class SubKategoryPage extends StatelessWidget {
  const SubKategoryPage({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CategoryController>(
        // init: CategoryController(),
        builder: (cc) {
      return Scaffold(
        backgroundColor: bc,
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
          title: Text(
            Dioo.getTitle(cc.categories.detail?.loc?[cc.selectedCategory]
                .subcategories?[cc.selectedSubategory].title),
          ),
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
                              fromJson: Products.fromJson,
                              update: cc.update,
                              url:
                                  '${baseUrl}category/${cc.categorySlug}/subcategory/${cc.subcategorySlug}/',
                              products: cc.categoryProducts.detail?.loc?[0]
                                      .products ??
                                  [],
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
                              color: Color.fromRGBO(237, 237, 237, 1),
                            ),
                          ),
                        ),
                      ),
                      onPressed: () {
                        showModalBottomSheet(
                          isScrollControlled: true,
                          showDragHandle: true,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20),
                            ),
                          ),
                          context: context,
                          builder: (context) {
                            return FiltrBottomSheet(
                              products: cc.categoryProducts.detail?.loc?[0]
                                      .products ??
                                  [],
                              update: cc.update,
                              url:
                                  '${baseUrl}category/${cc.categorySlug}/subcategory/${cc.subcategorySlug}/?sort=${prices[selectedTertip]}',
                              fromJson: Products.fromJson,
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
              const CategoryProducts(),
            ],
          ),
        ),
      );
    });
  }
}
