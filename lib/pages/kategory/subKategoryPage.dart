// ignore_for_file: file_names

import 'package:apte/data/dio.dart';
import 'package:apte/widgets/colors.dart';
import 'package:apte/widgets/langDictionary.dart';
import 'package:apte/widgets/main/category_products.dart';
import 'package:apte/widgets/main/filtrBottomSheet.dart';
import 'package:apte/widgets/main/tertipleBottomSheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../data/model/category/controller.dart';

ScrollController _scont = ScrollController();

class SubKategoryPage extends StatefulWidget {
  final dynamic incPage;
  const SubKategoryPage({super.key, required this.incPage});

  @override
  State<SubKategoryPage> createState() => _SubKategoryPageState();
}

class _SubKategoryPageState extends State<SubKategoryPage> {
  @override
  void initState() {
    _scont.addListener(() {
      print('maxxxxxxx');
      if (_scont.position.pixels == _scont.position.maxScrollExtent) {
        widget.incPage;
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _scont.removeListener(() {});
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CategoryController>(builder: (cc) {
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
            Dioo.getTitle(cc.categories.detail?.loc?[cc.st.selectedCategory]
                .subcategories?[cc.st.selectedSubategory].title),
          ),
        ),
        body: SingleChildScrollView(
          controller: _scont,
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
                            color: Color.fromRGBO(237, 237, 237, 1),
                          ),
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
                              ontap: cc.getCategoryProducts,
                              change: cc.changeUrl,
                              url2: cc.url2,
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
                              ontap: cc.getCategoryProducts,
                              url2: cc.url2,
                              change: cc.changeUrl,
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
