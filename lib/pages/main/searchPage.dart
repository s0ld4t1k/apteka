// ignore_for_file: file_names, deprecated_member_use

import 'package:apte/data/dio.dart';
import 'package:apte/data/model/search/controller.dart';
import 'package:apte/pages/main/mainPageWidget.dart';
import 'package:apte/widgets/colors.dart';
import 'package:apte/widgets/langDictionary.dart';
import 'package:apte/widgets/main/new_products.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import 'productPage.dart';
import 'search.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

String searchText = '';

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _search = TextEditingController();
  @override
  Widget build(BuildContext context) {
    if (searchText != '') {
      _search.text = searchText;
    }
    if (barRes.value != '' && barRes.value != '-1') _search.text = barRes.value;
    return GetBuilder<SearckController>(
        init: SearckController(query: searchText),
        builder: (sc) {
          return GestureDetector(
            onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
            child: Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(
                toolbarHeight: 70,
                automaticallyImplyLeading: false,
                leading: IconButton(
                  padding: const EdgeInsets.all(0),
                  constraints: const BoxConstraints(
                    minHeight: 24,
                    minWidth: 24,
                    maxHeight: 24,
                    maxWidth: 24,
                  ),
                  onPressed: () => Get.back(),
                  icon: const Icon(Icons.chevron_left_rounded),
                ),
                title: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        width: 44,
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(249, 249, 249, 1),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: TextField(
                                onSubmitted: (value) {
                                  searchText = value;
                                  addToHistory(value);
                                  sc.get(_search.text);
                                },
                                controller: _search,
                                style: const TextStyle(
                                  color: Color.fromRGBO(131, 132, 139, 1),
                                ),
                                decoration: InputDecoration(
                                    contentPadding: const EdgeInsets.all(0),
                                    prefixIconConstraints: const BoxConstraints(
                                      maxHeight: 20,
                                      maxWidth: 20,
                                      minHeight: 20,
                                      minWidth: 20,
                                    ),
                                    prefixText: '   ',
                                    prefixIcon: SvgPicture.asset(
                                      'assets/icons/search.svg',
                                      color: green,
                                    ),
                                    border: InputBorder.none,
                                    hintText: '${locale[curLN]?["searchHint"]}',
                                    hintStyle: const TextStyle(
                                      fontSize: 14,
                                      color: textGrey3,
                                      fontWeight: FontWeight.w500,
                                    )),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 25),
                  ],
                ),
              ),
              body: sc.isload
                  ? const Center(child: CircularProgressIndicator())
                  : SingleChildScrollView(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 25, vertical: 15),
                      child: Column(
                        children: [
                          // Row(
                          //   children: [
                          //     Expanded(
                          //       child: OutlinedButton(
                          //         style: ButtonStyle(
                          //             minimumSize: MaterialStateProperty.all(
                          //                 const Size(double.infinity, 42)),
                          //             backgroundColor:
                          //                 MaterialStateProperty.all(
                          //                     Colors.white),
                          //             shape: MaterialStateProperty.all(
                          //                 RoundedRectangleBorder(
                          //                     borderRadius:
                          //                         BorderRadius.circular(8),
                          //                     side: const BorderSide(
                          //                         color: Color.fromRGBO(
                          //                             237, 237, 237, 1))))),
                          //         onPressed: () {
                          //           // showModalBottomSheet(
                          //           //   showDragHandle: true,
                          //           //   shape: const RoundedRectangleBorder(
                          //           //       borderRadius: BorderRadius.only(
                          //           //     topLeft: Radius.circular(20),
                          //           //     topRight: Radius.circular(20),
                          //           //   )),
                          //           //   context: context,
                          //           //   builder: (context) {
                          //           //     return const TertipleBottomSheet();
                          //           //   },
                          //           // );
                          //         },
                          //         child: Row(
                          //           mainAxisAlignment: MainAxisAlignment.center,
                          //           children: [
                          //             SvgPicture.asset(
                          //                 'assets/icons/tertiple.svg'),
                          //             const SizedBox(width: 7),
                          //             Text(
                          //               '${locale[curLN]?["sort"]}',
                          //               style: const TextStyle(
                          //                 color: Colors.black,
                          //                 fontWeight: FontWeight.w400,
                          //                 fontSize: 14,
                          //               ),
                          //             ),
                          //           ],
                          //         ),
                          //       ),
                          //     ),
                          //     const SizedBox(width: 21),
                          //     Expanded(
                          //       child: OutlinedButton(
                          //         style: ButtonStyle(
                          //             minimumSize: MaterialStateProperty.all(
                          //                 const Size(double.infinity, 42)),
                          //             backgroundColor:
                          //                 MaterialStateProperty.all(
                          //                     Colors.white),
                          //             shape: MaterialStateProperty.all(
                          //                 RoundedRectangleBorder(
                          //                     borderRadius:
                          //                         BorderRadius.circular(8),
                          //                     side: const BorderSide(
                          //                         color: Color.fromRGBO(
                          //                             237, 237, 237, 1))))),
                          //         onPressed: () {
                          //           // showModalBottomSheet(
                          //           //   useRootNavigator: true,
                          //           //   isScrollControlled: true,
                          //           //   showDragHandle: true,
                          //           //   shape: const RoundedRectangleBorder(
                          //           //     borderRadius: BorderRadius.only(
                          //           //       topLeft: Radius.circular(20),
                          //           //       topRight: Radius.circular(20),
                          //           //     )
                          //           //   ),
                          //           //   context: context,
                          //           //   builder:(context) {
                          //           //     return const FiltrBottomSheet();
                          //           //   },
                          //           // );
                          //         },
                          //         child: Row(
                          //           mainAxisAlignment: MainAxisAlignment.center,
                          //           children: [
                          //             SvgPicture.asset(
                          //                 'assets/icons/filter.svg'),
                          //             const SizedBox(width: 7),
                          //             Text(
                          //               '${locale[curLN]?["filtr"]}',
                          //               style: const TextStyle(
                          //                 color: Colors.black,
                          //                 fontWeight: FontWeight.w400,
                          //                 fontSize: 14,
                          //               ),
                          //             ),
                          //           ],
                          //         ),
                          //       ),
                          //     ),
                          //   ],
                          // ),
                          const SizedBox(height: 17),
                          GridView(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            gridDelegate:
                                const SliverGridDelegateWithMaxCrossAxisExtent(
                              maxCrossAxisExtent: 162,
                              mainAxisExtent: 220,
                              mainAxisSpacing: 18,
                              crossAxisSpacing: 21,
                            ),
                            children: List.generate(
                              sc.searchProducts.detail?.loc?.length ?? 0,
                              (index) {
                                RxBool isAdd = false.obs;
                                getCart(
                                    sc.searchProducts.detail?.loc?[index].id,
                                    isAdd);
                                return GestureDetector(
                                  onTap: () {
                                    Get.to(
                                      () => ProductPage(
                                        url: sc.searchProducts.detail
                                                ?.loc?[index].absoluteUrl ??
                                            '',
                                      ),
                                    );
                                  },
                                  child: Container(
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
                                                padding:
                                                    const EdgeInsets.all(16),
                                                child: Image.network(
                                                  sc
                                                          .searchProducts
                                                          .detail
                                                          ?.loc?[index]
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
                                              Dioo.getTitle(sc.searchProducts
                                                  .detail?.loc?[index].title),
                                              style: const TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500,
                                              ),
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                            const SizedBox(height: 18),
                                            Text(
                                              '${sc.searchProducts.detail?.loc?[index].price?.price} TMT',
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
                                                    sc.searchProducts.detail
                                                        ?.loc?[index].id,
                                                    isAdd,
                                                    sc
                                                        .searchProducts
                                                        .detail
                                                        ?.loc?[index]
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
                              },
                            ),
                          )
                        ],
                      ),
                    ),
            ),
          );
        });
  }
}
