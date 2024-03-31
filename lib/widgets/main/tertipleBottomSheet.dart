// ignore_for_file: file_names

import 'package:apte/data/dio.dart';
import 'package:apte/widgets/colors.dart';
import 'package:apte/widgets/langDictionary.dart';
import 'package:flutter/material.dart';

import '../../data/model/products/model.dart';

List prices = ['price', '-price'];
int selectedTertip = 0;
List _tertipList = [];

// ignore: must_be_immutable
class TertipleBottomSheet extends StatefulWidget {
  List<Products> products;
  final dynamic update;
  String url;
  final dynamic fromJson;
  TertipleBottomSheet(
      {super.key,
      required this.update,
      required this.url,
      required this.products,
      required this.fromJson});

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
    return Container(
      height: 350,
      padding: const EdgeInsets.symmetric(
        horizontal: 25,
      ),
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
          const SizedBox(
            height: 34 - 18,
          ),
          Expanded(
            child: ListView.separated(
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () async {
                      selectedTertip = index;
                      widget.url += '?sort=${prices[selectedTertip]}';
                      try {
                        var res = await Dioo().dio.get(widget.url);
                        if (res.statusCode == 200) {
                          List<Products> list = [];
                          for (var i = 0;
                              i <
                                  res.data['detail']['loc'][0]['products']
                                      .length;
                              i++) {
                            list.add(widget.fromJson(
                                res.data['detail']['loc'][0]['products'][i]));
                          }
                          widget.products.clear();
                          widget.products.addAll(list);
                        }
                        widget.update();
                      } catch (e) {
                        debugPrint('----sort-----$e');
                      }

                      setState(() {});
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 18),
                      child: Row(
                        children: [
                          Text(
                            _tertipList[index],
                            style: const TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          const Spacer(),
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
  }
}
