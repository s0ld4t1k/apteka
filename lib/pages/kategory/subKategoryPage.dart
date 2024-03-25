// ignore_for_file: file_names, deprecated_member_use

import 'package:apte/data/dio.dart';
import 'package:apte/pages/main/mainPage.dart';
import 'package:apte/widgets/langDictionary.dart';
import 'package:apte/widgets/main/category_products.dart';
import 'package:apte/widgets/main/filtrBottomSheet.dart';
import 'package:apte/widgets/main/tertipleBottomSheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../data/model/category/controller.dart';

class SubKategoryPage extends StatelessWidget {
  SubKategoryPage({super.key});
  final CategoryController cc = Get.put(CategoryController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CategoryController>(builder: (cc) {
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
                            return const TertipleBottomSheet();
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
                          minimumSize: MaterialStateProperty.all(
                              const Size(double.infinity, 42)),
                          backgroundColor:
                              MaterialStateProperty.all(Colors.white),
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  side: const BorderSide(
                                      color:
                                          Color.fromRGBO(237, 237, 237, 1))))),
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
                            return const FiltrBottomSheet();
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
