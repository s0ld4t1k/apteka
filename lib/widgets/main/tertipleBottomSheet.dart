// ignore_for_file: file_names

import 'package:apte/data/model/category/controller.dart';
import 'package:apte/widgets/colors.dart';
import 'package:apte/widgets/langDictionary.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

List prices = ['price', '-price'];
int selectedTertip = 0;
List _tertipList = [];

class TertipleBottomSheet extends StatefulWidget {
  final dynamic ontap;
  // String url;
  const TertipleBottomSheet({super.key, required this.ontap});

  @override
  State<TertipleBottomSheet> createState() => _TertipleBottomSheetState();
}

class _TertipleBottomSheetState extends State<TertipleBottomSheet> {
  @override
  Widget build(BuildContext context) {
    _tertipList = [
      '${locale[curLN]?["sortByPriceUp"]}',
      '${locale[curLN]?["sortBypriceDown"]}',
    ];
    return GetBuilder<CategoryController>(builder: (cc) {
      return Container(
        height: 350,
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  '${locale[curLN]?["sort"]}',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const Spacer(),
                IconButton(
                  padding: const EdgeInsets.all(0),
                  constraints: const BoxConstraints(
                    maxHeight: 24,
                    maxWidth: 24,
                    minHeight: 24,
                    minWidth: 24,
                  ),
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.close),
                )
              ],
            ),
            const SizedBox(height: 34 - 18),
            Expanded(
              child: ListView.separated(
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        selectedTertip = index;
                        int a = cc.url2.indexOf('sort');
                        int b = cc.url2.indexOf('price');
                        if (a >= 0) {
                          cc.url2 = cc.url2.replaceRange(
                              a, b + 5, 'sort=${prices[selectedTertip]}');
                        }
                        widget.ontap(cc.url2);
                        setState(() {});
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 18),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                _tertipList[index],
                                style: const TextStyle(fontSize: 16),
                              ),
                            ),
                            Container(
                              width: 20,
                              height: 20,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                  color: (index == selectedTertip)
                                      ? green
                                      : const Color.fromRGBO(216, 216, 216, 1),
                                  width: (index == selectedTertip) ? 4 : 2,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return Container(
                      height: 1,
                      width: double.infinity,
                      color: const Color.fromRGBO(237, 237, 237, 1),
                    );
                  },
                  itemCount: _tertipList.length),
            )
          ],
        ),
      );
    });
  }
}
